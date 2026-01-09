import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_failure.freezed.dart';

@freezed
class TaskFailure with _$TaskFailure {
  const factory TaskFailure.serverError(String message) = TaskServerError;
  const factory TaskFailure.networkError() = TaskNetworkError;
  const factory TaskFailure.notFound() = TaskNotFound;
  const factory TaskFailure.unauthorized() = TaskUnauthorized;
  const factory TaskFailure.forbidden() = TaskForbidden;
  const factory TaskFailure.invalidTitle() = TaskInvalidTitle;
  const factory TaskFailure.invalidRecurrenceRule() = TaskInvalidRecurrenceRule;
  const factory TaskFailure.projectNotFound() = TaskProjectNotFound;
  const factory TaskFailure.assigneeNotFound() = TaskAssigneeNotFound;
  const factory TaskFailure.unknown(String message) = TaskUnknown;
}
