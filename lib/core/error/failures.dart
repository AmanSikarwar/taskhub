import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class AppFailure with _$AppFailure {
  const factory AppFailure.serverError(String message) = ServerError;
  const factory AppFailure.networkError() = NetworkError;
  const factory AppFailure.notFound(String entity) = NotFound;
  const factory AppFailure.unauthorized() = Unauthorized;
  const factory AppFailure.forbidden() = Forbidden;
  const factory AppFailure.validationError(String message) = ValidationError;
  const factory AppFailure.unknown(String message) = UnknownError;
}
