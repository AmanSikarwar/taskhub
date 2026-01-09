// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String,
  projectId: json['projectId'] as String?,
  createdBy: json['createdBy'] as String,
  assignedTo: json['assignedTo'] as String?,
  title: json['title'] as String,
  description: json['description'] as String?,
  status: $enumDecode(_$TaskStatusEnumMap, json['status']),
  priority: $enumDecode(_$TaskPriorityEnumMap, json['priority']),
  dueDate: json['dueDate'] == null
      ? null
      : DateTime.parse(json['dueDate'] as String),
  isRecurring: json['isRecurring'] as bool,
  recurrenceRule: json['recurrenceRule'] as String?,
  parentTaskId: json['parentTaskId'] as String?,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  projectTitle: json['projectTitle'] as String?,
  projectColorCode: json['projectColorCode'] as String?,
  assigneeName: json['assigneeName'] as String?,
  assigneeAvatarUrl: json['assigneeAvatarUrl'] as String?,
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'projectId': instance.projectId,
  'createdBy': instance.createdBy,
  'assignedTo': instance.assignedTo,
  'title': instance.title,
  'description': instance.description,
  'status': _$TaskStatusEnumMap[instance.status]!,
  'priority': _$TaskPriorityEnumMap[instance.priority]!,
  'dueDate': instance.dueDate?.toIso8601String(),
  'isRecurring': instance.isRecurring,
  'recurrenceRule': instance.recurrenceRule,
  'parentTaskId': instance.parentTaskId,
  'completedAt': instance.completedAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'projectTitle': instance.projectTitle,
  'projectColorCode': instance.projectColorCode,
  'assigneeName': instance.assigneeName,
  'assigneeAvatarUrl': instance.assigneeAvatarUrl,
};

const _$TaskStatusEnumMap = {
  TaskStatus.todo: 'todo',
  TaskStatus.inProgress: 'in_progress',
  TaskStatus.completed: 'completed',
  TaskStatus.cancelled: 'cancelled',
};

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
  TaskPriority.urgent: 'urgent',
};
