import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    required String id,
    String? projectId,
    required String createdBy,
    String? assignedTo,
    required String title,
    String? description,
    required TaskStatus status,
    required TaskPriority priority,
    DateTime? dueDate,
    required bool isRecurring,
    String? recurrenceRule,
    String? parentTaskId,
    DateTime? completedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    // Populated from joins
    String? projectTitle,
    String? projectColorCode,
    String? assigneeName,
    String? assigneeAvatarUrl,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

enum TaskStatus {
  @JsonValue('todo')
  todo,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
}

enum TaskPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('urgent')
  urgent,
}

extension TaskStatusExtension on TaskStatus {
  String get displayName {
    switch (this) {
      case .todo:
        return 'To Do';
      case .inProgress:
        return 'In Progress';
      case .completed:
        return 'Completed';
      case .cancelled:
        return 'Cancelled';
    }
  }

  String get dbValue {
    switch (this) {
      case .todo:
        return 'todo';
      case .inProgress:
        return 'in_progress';
      case .completed:
        return 'completed';
      case .cancelled:
        return 'cancelled';
    }
  }
}

extension TaskPriorityExtension on TaskPriority {
  String get displayName {
    switch (this) {
      case .low:
        return 'Low';
      case .medium:
        return 'Medium';
      case .high:
        return 'High';
      case .urgent:
        return 'Urgent';
    }
  }
}
