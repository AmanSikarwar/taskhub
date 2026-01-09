import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String userId,
    required NotificationType type,
    required String title,
    String? body,
    String? relatedEntityType,
    String? relatedEntityId,
    required bool isRead,
    DateTime? readAt,
    required DateTime createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}

enum NotificationType {
  @JsonValue('project_invite')
  projectInvite,
  @JsonValue('task_assigned')
  taskAssigned,
  @JsonValue('task_due_soon')
  taskDueSoon,
  @JsonValue('task_completed')
  taskCompleted,
  @JsonValue('project_updated')
  projectUpdated,
  @JsonValue('member_joined')
  memberJoined,
  @JsonValue('reminder')
  reminder,
}

extension NotificationTypeExtension on NotificationType {
  String get displayName {
    switch (this) {
      case .projectInvite:
        return 'Project Invite';
      case .taskAssigned:
        return 'Task Assigned';
      case .taskDueSoon:
        return 'Task Due Soon';
      case .taskCompleted:
        return 'Task Completed';
      case .projectUpdated:
        return 'Project Updated';
      case .memberJoined:
        return 'Member Joined';
      case .reminder:
        return 'Reminder';
    }
  }

  String get dbValue {
    switch (this) {
      case .projectInvite:
        return 'project_invite';
      case .taskAssigned:
        return 'task_assigned';
      case .taskDueSoon:
        return 'task_due_soon';
      case .taskCompleted:
        return 'task_completed';
      case .projectUpdated:
        return 'project_updated';
      case .memberJoined:
        return 'member_joined';
      case .reminder:
        return 'reminder';
    }
  }
}
