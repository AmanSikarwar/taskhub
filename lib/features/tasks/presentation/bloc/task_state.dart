part of 'task_bloc.dart';

@freezed
sealed class TaskState with _$TaskState {
  const factory TaskState.initial() = TaskInitial;

  const factory TaskState.loading() = TaskLoading;

  const factory TaskState.tasksLoaded(List<Task> tasks) = TasksLoaded;

  const factory TaskState.taskLoaded(Task task) = TaskLoaded;

  const factory TaskState.taskCreated(Task task) = TaskCreated;

  const factory TaskState.taskUpdated(Task task) = TaskUpdated;

  const factory TaskState.taskDeleted(String taskId) = TaskDeleted;

  const factory TaskState.error(TaskFailure failure) = TaskError;
}
