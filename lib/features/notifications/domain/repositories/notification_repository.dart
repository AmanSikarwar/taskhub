import '../entities/notification.dart';
import '../entities/notification_failure.dart';

abstract class NotificationRepository {
  Future<({List<AppNotification>? notifications, NotificationFailure? failure})>
  getNotifications({int? limit});

  Future<({int? count, NotificationFailure? failure})> getUnreadCount();

  Future<({AppNotification? notification, NotificationFailure? failure})>
  markAsRead(String notificationId);

  Future<NotificationFailure?> markAllAsRead();

  Future<NotificationFailure?> deleteNotification(String notificationId);

  Future<NotificationFailure?> deleteAllNotifications();

  Stream<List<AppNotification>> streamNotifications();

  Stream<int> streamUnreadCount();
}
