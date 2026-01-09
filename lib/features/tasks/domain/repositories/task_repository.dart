import '../entities/task.dart';
import '../entities/task_failure.dart';

abstract class TaskRepository {
  Future<({List<Task>? tasks, TaskFailure? failure})> getTasksByProject(
    String projectId,
  );

  Future<({List<Task>? tasks, TaskFailure? failure})> getMyTasks();

  Future<({List<Task>? tasks, TaskFailure? failure})> getTasksByDateRange({
    required DateTime start,
    required DateTime end,
  });

  Future<({Task? task, TaskFailure? failure})> getTask(String taskId);

  Future<({Task? task, TaskFailure? failure})> createTask({
    String? projectId,
    required String title,
    String? description,
    TaskStatus? status,
    TaskPriority? priority,
    String? assignedTo,
    DateTime? dueDate,
    bool? isRecurring,
    String? recurrenceRule,
  });

  Future<({Task? task, TaskFailure? failure})> updateTask({
    required String taskId,
    String? title,
    String? description,
    TaskStatus? status,
    TaskPriority? priority,
    String? assignedTo,
    DateTime? dueDate,
    bool? isRecurring,
    String? recurrenceRule,
  });

  Future<TaskFailure?> deleteTask(String taskId);

  Future<({Task? task, TaskFailure? failure})> completeTask(String taskId);

  Future<({Task? task, TaskFailure? failure})> reopenTask(String taskId);

  Stream<List<Task>> watchProjectTasks(String projectId);

  Stream<List<Task>> watchMyTasks();
}
