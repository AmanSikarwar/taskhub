import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_failure.freezed.dart';

@freezed
class CalendarFailure with _$CalendarFailure {
  const factory CalendarFailure.serverError(String message) =
      CalendarServerError;
  const factory CalendarFailure.networkError() = CalendarNetworkError;
  const factory CalendarFailure.unauthorized() = CalendarUnauthorized;
  const factory CalendarFailure.unknown(String message) = CalendarUnknown;
}
