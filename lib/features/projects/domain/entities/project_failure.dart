import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_failure.freezed.dart';

@freezed
class ProjectFailure with _$ProjectFailure {
  const factory ProjectFailure.serverError(String message) = ProjectServerError;
  const factory ProjectFailure.networkError() = ProjectNetworkError;
  const factory ProjectFailure.notFound() = ProjectNotFound;
  const factory ProjectFailure.unauthorized() = ProjectUnauthorized;
  const factory ProjectFailure.forbidden() = ProjectForbidden;
  const factory ProjectFailure.invalidTitle() = ProjectInvalidTitle;
  const factory ProjectFailure.invalidColorCode() = ProjectInvalidColorCode;
  const factory ProjectFailure.memberAlreadyExists() =
      ProjectMemberAlreadyExists;
  const factory ProjectFailure.memberNotFound() = ProjectMemberNotFound;
  const factory ProjectFailure.cannotRemoveOwner() = ProjectCannotRemoveOwner;
  const factory ProjectFailure.unknown(String message) = ProjectUnknown;
}
