import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_failure.freezed.dart';

@freezed
class NotificationFailure with _$NotificationFailure {
  const factory NotificationFailure.serverError(String message) =
      NotificationServerError;
  const factory NotificationFailure.networkError() = NotificationNetworkError;
  const factory NotificationFailure.notFound() = NotificationNotFound;
  const factory NotificationFailure.unauthorized() = NotificationUnauthorized;
  const factory NotificationFailure.unknown(String message) =
      NotificationUnknown;
}
