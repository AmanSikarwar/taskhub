part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.loadProjectTasks(String projectId) = LoadProjectTasks;

  const factory TaskEvent.loadMyTasks() = LoadMyTasks;

  const factory TaskEvent.loadTasksByDateRange({
    required DateTime start,
    required DateTime end,
  }) = LoadTasksByDateRange;

  const factory TaskEvent.loadTask(String taskId) = LoadTask;

  const factory TaskEvent.createTask({
    String? projectId,
    required String title,
    String? description,
    TaskStatus? status,
    TaskPriority? priority,
    String? assignedTo,
    DateTime? dueDate,
    bool? isRecurring,
    String? recurrenceRule,
  }) = CreateTask;

  const factory TaskEvent.updateTask({
    required String taskId,
    String? title,
    String? description,
    TaskStatus? status,
    TaskPriority? priority,
    String? assignedTo,
    DateTime? dueDate,
    bool? isRecurring,
    String? recurrenceRule,
  }) = UpdateTask;

  const factory TaskEvent.deleteTask(String taskId) = DeleteTask;

  const factory TaskEvent.completeTask(String taskId) = CompleteTask;

  const factory TaskEvent.reopenTask(String taskId) = ReopenTask;

  const factory TaskEvent.watchProjectTasks(String projectId) =
      WatchProjectTasks;

  const factory TaskEvent.watchMyTasks() = WatchMyTasks;

  const factory TaskEvent.tasksUpdated(List<Task> tasks) = TasksUpdated;
}
