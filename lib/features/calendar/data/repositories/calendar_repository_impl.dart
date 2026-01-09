import 'dart:async';
import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../tasks/domain/entities/task.dart';
import '../../domain/entities/calendar_failure.dart';
import '../../domain/repositories/calendar_repository.dart';
import '../../../../core/utils/realtime_utils.dart';

@LazySingleton(as: CalendarRepository)
class CalendarRepositoryImpl implements CalendarRepository {
  final SupabaseClient _supabase;

  CalendarRepositoryImpl(this._supabase);

  String? get _currentUserId => _supabase.auth.currentUser?.id;

  @override
  Future<({Map<DateTime, List<Task>>? events, CalendarFailure? failure})>
  getEventsForMonth(DateTime month) async {
    final start = DateTime(month.year, month.month, 1);
    final end = DateTime(month.year, month.month + 1, 0, 23, 59, 59);

    return getEventsForDateRange(start: start, end: end);
  }

  @override
  Future<({Map<DateTime, List<Task>>? events, CalendarFailure? failure})>
  getEventsForDateRange({
    required DateTime start,
    required DateTime end,
  }) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return (events: null, failure: const CalendarFailure.unauthorized());
      }

      final response = await _supabase
          .from('tasks')
          .select('''
            *,
            projects!inner(title, color_code, project_members!inner(user_id)),
            assignee:profiles!tasks_assigned_to_fkey(display_name, avatar_url)
          ''')
          .eq('projects.project_members.user_id', userId)
          .gte('due_date', start.toIso8601String())
          .lte('due_date', end.toIso8601String())
          .order('due_date');

      final tasks = _mapTaskList(response as List);
      final events = _groupTasksByDate(tasks);

      return (events: events, failure: null);
    } on PostgrestException catch (e) {
      developer.log(
        'PostgrestException: ${e.message}',
        name: 'CalendarRepository',
      );
      return (events: null, failure: _mapPostgrestException(e));
    } catch (e) {
      developer.log(
        'Error getting calendar events: $e',
        name: 'CalendarRepository',
      );
      return (events: null, failure: CalendarFailure.unknown(e.toString()));
    }
  }

  @override
  Stream<Map<DateTime, List<Task>>> watchEventsForMonth(DateTime month) {
    final userId = _currentUserId;
    if (userId == null) {
      return Stream.value({});
    }

    return RealtimeUtils.safeStream(
      () => _supabase.from('tasks').stream(primaryKey: ['id']).asyncMap((
        _,
      ) async {
        final result = await getEventsForMonth(month);
        if (result.failure != null) {
          throw Exception('Failed to fetch calendar events: ${result.failure}');
        }
        return result.events ?? {};
      }),
      logName: 'watchEventsForMonth',
    );
  }

  Map<DateTime, List<Task>> _groupTasksByDate(List<Task> tasks) {
    final events = <DateTime, List<Task>>{};

    for (final task in tasks) {
      if (task.dueDate != null) {
        final date = DateTime(
          task.dueDate!.year,
          task.dueDate!.month,
          task.dueDate!.day,
        );

        if (events.containsKey(date)) {
          events[date]!.add(task);
        } else {
          events[date] = [task];
        }
      }
    }

    return events;
  }

  List<Task> _mapTaskList(List<dynamic> response) {
    return response
        .map((json) => _mapToTask(json as Map<String, dynamic>))
        .toList();
  }

  Task _mapToTask(Map<String, dynamic> json) {
    final project = json['projects'] as Map<String, dynamic>?;
    final assignee = json['assignee'] as Map<String, dynamic>?;

    return Task(
      id: json['id'] as String,
      projectId: json['project_id'] as String,
      createdBy: json['created_by'] as String,
      assignedTo: json['assigned_to'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      status: _parseTaskStatus(json['status'] as String),
      priority: _parseTaskPriority(json['priority'] as String),
      dueDate: json['due_date'] != null
          ? DateTime.parse(json['due_date'] as String)
          : null,
      isRecurring: json['is_recurring'] as bool? ?? false,
      recurrenceRule: json['recurrence_rule'] as String?,
      parentTaskId: json['parent_task_id'] as String?,
      completedAt: json['completed_at'] != null
          ? DateTime.parse(json['completed_at'] as String)
          : null,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      projectTitle: project?['title'] as String?,
      projectColorCode: project?['color_code'] as String?,
      assigneeName: assignee?['display_name'] as String?,
      assigneeAvatarUrl: assignee?['avatar_url'] as String?,
    );
  }

  TaskStatus _parseTaskStatus(String status) {
    return switch (status) {
      'todo' => .todo,
      'in_progress' => .inProgress,
      'completed' => .completed,
      'cancelled' => .cancelled,
      _ => .todo,
    };
  }

  TaskPriority _parseTaskPriority(String priority) {
    return TaskPriority.values.firstWhere(
      (e) => e.name == priority,
      orElse: () => .medium,
    );
  }

  CalendarFailure _mapPostgrestException(PostgrestException e) {
    final message = e.message.toLowerCase();

    if (message.contains('network') || message.contains('connection')) {
      return const CalendarFailure.networkError();
    }

    return CalendarFailure.serverError(e.message);
  }
}
