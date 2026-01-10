import 'dart:async';
import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/task.dart';
import '../../domain/entities/task_failure.dart';
import '../../domain/repositories/task_repository.dart';
import '../../../../core/utils/realtime_utils.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final SupabaseClient _supabase;

  TaskRepositoryImpl(this._supabase);

  String? get _currentUserId => _supabase.auth.currentUser?.id;

  static const _taskSelectQuery = '''
    *,
    projects(title, color_code),
    assignee:profiles!tasks_assigned_to_fkey(display_name, avatar_url)
  ''';

  @override
  Future<({List<Task>? tasks, TaskFailure? failure})> getTasksByProject(
    String projectId,
  ) async {
    try {
      final response = await _supabase
          .from('tasks')
          .select(_taskSelectQuery)
          .eq('project_id', projectId)
          .order('created_at', ascending: false);

      final tasks = _mapTaskList(response as List);
      return (tasks: tasks, failure: null);
    } on PostgrestException catch (e) {
      developer.log('PostgrestException: ${e.message}', name: 'TaskRepository');
      return (tasks: null, failure: _mapPostgrestException(e));
    } catch (e) {
      developer.log('Error getting tasks: $e', name: 'TaskRepository');
      return (tasks: null, failure: TaskFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({List<Task>? tasks, TaskFailure? failure})> getMyTasks() async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return (tasks: null, failure: const TaskFailure.unauthorized());
      }

      final response = await _supabase
          .from('tasks')
          .select(_taskSelectQuery)
          .or(
            'assigned_to.eq.$userId,and(created_by.eq.$userId,assigned_to.is.null)',
          )
          .neq('status', 'completed')
          .neq('status', 'cancelled')
          .order('due_date', ascending: true, nullsFirst: false);

      final tasks = _mapTaskList(response as List);
      return (tasks: tasks, failure: null);
    } on PostgrestException catch (e) {
      return (tasks: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (tasks: null, failure: TaskFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({List<Task>? tasks, TaskFailure? failure})> getTasksByDateRange({
    required DateTime start,
    required DateTime end,
  }) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return (tasks: null, failure: const TaskFailure.unauthorized());
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
      return (tasks: tasks, failure: null);
    } on PostgrestException catch (e) {
      developer.log('PostgrestException: ${e.message}', name: 'TaskRepository');
      return (tasks: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (tasks: null, failure: TaskFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({Task? task, TaskFailure? failure})> getTask(String taskId) async {
    try {
      final response = await _supabase
          .from('tasks')
          .select(_taskSelectQuery)
          .eq('id', taskId)
          .single();

      final task = _mapToTask(response);
      return (task: task, failure: null);
    } on PostgrestException catch (e) {
      if (e.code == 'PGRST116') {
        return (task: null, failure: const TaskFailure.notFound());
      }
      return (task: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (task: null, failure: TaskFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({Task? task, TaskFailure? failure})> createTask({
    String? projectId,
    required String title,
    String? description,
    TaskStatus? status,
    TaskPriority? priority,
    String? assignedTo,
    DateTime? dueDate,
    bool? isRecurring,
    String? recurrenceRule,
  }) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return (task: null, failure: const TaskFailure.unauthorized());
      }

      final insertData = <String, dynamic>{
        'created_by': userId,
        'title': title,
        'description': description,
        'status': (status ?? TaskStatus.todo).dbValue,
        'priority': (priority ?? TaskPriority.medium).name,
        'assigned_to': assignedTo,
        'due_date': dueDate?.toIso8601String(),
        'is_recurring': isRecurring ?? false,
        'recurrence_rule': recurrenceRule,
      };

      if (projectId != null) {
        insertData['project_id'] = projectId;
      }

      final response = await _supabase
          .from('tasks')
          .insert(insertData)
          .select(_taskSelectQuery)
          .single();

      final task = _mapToTask(response);
      return (task: task, failure: null);
    } on PostgrestException catch (e) {
      if (e.message.contains('tasks_title_length')) {
        return (task: null, failure: const TaskFailure.invalidTitle());
      }
      if (e.message.contains('tasks_recurrence_requires_rule')) {
        return (task: null, failure: const TaskFailure.invalidRecurrenceRule());
      }
      if (e.message.contains('fk_tasks_project')) {
        return (task: null, failure: const TaskFailure.projectNotFound());
      }
      return (task: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (task: null, failure: TaskFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({Task? task, TaskFailure? failure})> updateTask({
    required String taskId,
    String? title,
    String? description,
    TaskStatus? status,
    TaskPriority? priority,
    String? assignedTo,
    DateTime? dueDate,
    bool? isRecurring,
    String? recurrenceRule,
  }) async {
    try {
      final updates = <String, dynamic>{};
      if (title != null) {
        updates['title'] = title;
      }
      if (description != null) {
        updates['description'] = description;
      }
      if (status != null) {
        updates['status'] = status.dbValue;
      }
      if (priority != null) {
        updates['priority'] = priority.name;
      }
      if (assignedTo != null) {
        updates['assigned_to'] = assignedTo;
      }
      if (dueDate != null) {
        updates['due_date'] = dueDate.toIso8601String();
      }
      if (isRecurring != null) {
        updates['is_recurring'] = isRecurring;
      }
      if (recurrenceRule != null) {
        updates['recurrence_rule'] = recurrenceRule;
      }

      if (updates.isEmpty) {
        return getTask(taskId);
      }

      final response = await _supabase
          .from('tasks')
          .update(updates)
          .eq('id', taskId)
          .select(_taskSelectQuery)
          .single();

      final task = _mapToTask(response);
      return (task: task, failure: null);
    } on PostgrestException catch (e) {
      if (e.message.contains('tasks_title_length')) {
        return (task: null, failure: const TaskFailure.invalidTitle());
      }
      return (task: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (task: null, failure: TaskFailure.unknown(e.toString()));
    }
  }

  @override
  Future<TaskFailure?> deleteTask(String taskId) async {
    try {
      await _supabase.from('tasks').delete().eq('id', taskId);
      return null;
    } on PostgrestException catch (e) {
      return _mapPostgrestException(e);
    } catch (e) {
      return TaskFailure.unknown(e.toString());
    }
  }

  @override
  Future<({Task? task, TaskFailure? failure})> completeTask(
    String taskId,
  ) async {
    return updateTask(taskId: taskId, status: .completed);
  }

  @override
  Future<({Task? task, TaskFailure? failure})> reopenTask(String taskId) async {
    return updateTask(taskId: taskId, status: .todo);
  }

  @override
  Stream<List<Task>> watchProjectTasks(String projectId) {
    return RealtimeUtils.safeStream(
      () => _supabase
          .from('tasks')
          .stream(primaryKey: ['id'])
          .eq('project_id', projectId)
          .asyncMap((_) async {
            final result = await getTasksByProject(projectId);
            if (result.failure != null) {
              throw Exception(
                'Failed to fetch project tasks: ${result.failure}',
              );
            }
            return result.tasks ?? [];
          }),
      logName: 'watchProjectTasks($projectId)',
    );
  }

  @override
  Stream<List<Task>> watchMyTasks() {
    final userId = _currentUserId;
    if (userId == null) {
      return Stream.value([]);
    }

    return RealtimeUtils.safeStream(
      () => _supabase
          .from('tasks')
          .stream(primaryKey: ['id'])
          .eq('created_by', userId)
          .asyncMap((_) async {
            final result = await getMyTasks();
            if (result.failure != null) {
              throw Exception('Failed to fetch my tasks: ${result.failure}');
            }
            return result.tasks ?? [];
          }),
      logName: 'watchMyTasks',
    );
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
      projectId: json['project_id'] as String?,
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

  TaskFailure _mapPostgrestException(PostgrestException e) {
    final message = e.message.toLowerCase();
    final code = e.code;

    if (code == '42501' || message.contains('permission denied')) {
      return const TaskFailure.forbidden();
    }

    if (code == 'PGRST116') {
      return const TaskFailure.notFound();
    }

    if (message.contains('network') || message.contains('connection')) {
      return const TaskFailure.networkError();
    }

    return TaskFailure.serverError(e.message);
  }
}
