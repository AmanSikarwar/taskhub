part of 'notification_bloc.dart';

@freezed
sealed class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = NotificationInitial;

  const factory NotificationState.loading({required int unreadCount}) =
      NotificationLoading;

  const factory NotificationState.loaded({
    required List<AppNotification> notifications,
    required int unreadCount,
  }) = NotificationLoaded;

  const factory NotificationState.error(
    NotificationFailure failure, {
    required int unreadCount,
  }) = NotificationError;
}
