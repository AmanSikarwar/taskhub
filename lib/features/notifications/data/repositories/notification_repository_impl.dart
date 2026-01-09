import 'dart:async';
import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/realtime_utils.dart';
import '../../domain/entities/notification.dart';
import '../../domain/entities/notification_failure.dart';
import '../../domain/repositories/notification_repository.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final SupabaseClient _supabase;

  NotificationRepositoryImpl(this._supabase);

  String? get _currentUserId => _supabase.auth.currentUser?.id;

  @override
  Future<({List<AppNotification>? notifications, NotificationFailure? failure})>
  getNotifications({int? limit}) async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return (
          notifications: null,
          failure: const NotificationFailure.unauthorized(),
        );
      }

      var query = _supabase
          .from('notifications')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      if (limit != null) {
        query = query.limit(limit);
      }

      final response = await query;

      final notifications = (response as List)
          .map((json) => _mapToNotification(json as Map<String, dynamic>))
          .toList();

      return (notifications: notifications, failure: null);
    } on PostgrestException catch (e) {
      developer.log(
        'PostgrestException: ${e.message}',
        name: 'NotificationRepository',
      );
      return (notifications: null, failure: _mapPostgrestException(e));
    } catch (e) {
      developer.log(
        'Error getting notifications: $e',
        name: 'NotificationRepository',
      );
      return (
        notifications: null,
        failure: NotificationFailure.unknown(e.toString()),
      );
    }
  }

  @override
  Future<({int? count, NotificationFailure? failure})> getUnreadCount() async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return (count: null, failure: const NotificationFailure.unauthorized());
      }

      final response = await _supabase
          .from('notifications')
          .select()
          .eq('user_id', userId)
          .eq('is_read', false)
          .count(.exact);

      return (count: response.count, failure: null);
    } on PostgrestException catch (e) {
      return (count: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (count: null, failure: NotificationFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({AppNotification? notification, NotificationFailure? failure})>
  markAsRead(String notificationId) async {
    try {
      final response = await _supabase
          .from('notifications')
          .update({'is_read': true})
          .eq('id', notificationId)
          .select()
          .single();

      final notification = _mapToNotification(response);
      return (notification: notification, failure: null);
    } on PostgrestException catch (e) {
      if (e.code == 'PGRST116') {
        return (
          notification: null,
          failure: const NotificationFailure.notFound(),
        );
      }
      return (notification: null, failure: _mapPostgrestException(e));
    } catch (e) {
      return (
        notification: null,
        failure: NotificationFailure.unknown(e.toString()),
      );
    }
  }

  @override
  Future<NotificationFailure?> markAllAsRead() async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return const NotificationFailure.unauthorized();
      }

      await _supabase
          .from('notifications')
          .update({'is_read': true})
          .eq('user_id', userId)
          .eq('is_read', false);

      return null;
    } on PostgrestException catch (e) {
      return _mapPostgrestException(e);
    } catch (e) {
      return NotificationFailure.unknown(e.toString());
    }
  }

  @override
  Future<NotificationFailure?> deleteNotification(String notificationId) async {
    try {
      await _supabase.from('notifications').delete().eq('id', notificationId);
      return null;
    } on PostgrestException catch (e) {
      return _mapPostgrestException(e);
    } catch (e) {
      return NotificationFailure.unknown(e.toString());
    }
  }

  @override
  Future<NotificationFailure?> deleteAllNotifications() async {
    try {
      final userId = _currentUserId;
      if (userId == null) {
        return const NotificationFailure.unauthorized();
      }

      await _supabase.from('notifications').delete().eq('user_id', userId);
      return null;
    } on PostgrestException catch (e) {
      return _mapPostgrestException(e);
    } catch (e) {
      return NotificationFailure.unknown(e.toString());
    }
  }

  @override
  Stream<List<AppNotification>> streamNotifications() {
    final userId = _currentUserId;
    if (userId == null) {
      return Stream.value([]);
    }

    return RealtimeUtils.safeStream(
      () => _supabase
          .from('notifications')
          .stream(primaryKey: ['id'])
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .map((data) => data.map((json) => _mapToNotification(json)).toList()),
      logName: 'streamNotifications',
    );
  }

  @override
  Stream<int> streamUnreadCount() {
    final userId = _currentUserId;
    if (userId == null) {
      return Stream.value(0);
    }

    return streamNotifications().map(
      (notifications) => notifications.where((n) => !n.isRead).length,
    );
  }

  AppNotification _mapToNotification(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      type: _parseNotificationType(json['type'] as String),
      title: json['title'] as String,
      body: json['body'] as String?,
      relatedEntityType: json['related_entity_type'] as String?,
      relatedEntityId: json['related_entity_id'] as String?,
      isRead: json['is_read'] as bool? ?? false,
      readAt: json['read_at'] != null
          ? DateTime.parse(json['read_at'] as String)
          : null,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  NotificationType _parseNotificationType(String type) {
    return switch (type) {
      'project_invite' => .projectInvite,
      'task_assigned' => .taskAssigned,
      'task_due_soon' => .taskDueSoon,
      'task_completed' => .taskCompleted,
      'project_updated' => .projectUpdated,
      'member_joined' => .memberJoined,
      'reminder' => .reminder,
      _ => .reminder,
    };
  }

  NotificationFailure _mapPostgrestException(PostgrestException e) {
    final message = e.message.toLowerCase();

    if (message.contains('network') || message.contains('connection')) {
      return const NotificationFailure.networkError();
    }

    return NotificationFailure.serverError(e.message);
  }
}
