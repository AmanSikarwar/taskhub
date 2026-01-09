part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.loadNotifications({int? limit}) =
      LoadNotifications;

  const factory NotificationEvent.loadUnreadCount() = LoadUnreadCount;

  const factory NotificationEvent.markAsRead(String notificationId) =
      MarkAsRead;

  const factory NotificationEvent.markAllAsRead() = MarkAllAsRead;

  const factory NotificationEvent.deleteNotification(String notificationId) =
      DeleteNotification;

  const factory NotificationEvent.deleteAllNotifications() =
      DeleteAllNotifications;

  const factory NotificationEvent.watchNotifications() = WatchNotifications;

  const factory NotificationEvent.notificationsUpdated(
    List<AppNotification> notifications,
  ) = NotificationsUpdated;

  const factory NotificationEvent.unreadCountUpdated(int count) =
      UnreadCountUpdated;
}
