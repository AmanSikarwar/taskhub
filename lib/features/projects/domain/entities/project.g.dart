// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Project _$ProjectFromJson(Map<String, dynamic> json) => _Project(
  id: json['id'] as String,
  ownerId: json['ownerId'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  dueDate: json['dueDate'] == null
      ? null
      : DateTime.parse(json['dueDate'] as String),
  colorCode: json['colorCode'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ProjectToJson(_Project instance) => <String, dynamic>{
  'id': instance.id,
  'ownerId': instance.ownerId,
  'title': instance.title,
  'description': instance.description,
  'dueDate': instance.dueDate?.toIso8601String(),
  'colorCode': instance.colorCode,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

_ProjectWithRole _$ProjectWithRoleFromJson(Map<String, dynamic> json) =>
    _ProjectWithRole(
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
      role: $enumDecode(_$ProjectRoleEnumMap, json['role']),
      taskCount: (json['taskCount'] as num).toInt(),
      completedTaskCount: (json['completedTaskCount'] as num).toInt(),
    );

Map<String, dynamic> _$ProjectWithRoleToJson(_ProjectWithRole instance) =>
    <String, dynamic>{
      'project': instance.project,
      'role': _$ProjectRoleEnumMap[instance.role]!,
      'taskCount': instance.taskCount,
      'completedTaskCount': instance.completedTaskCount,
    };

const _$ProjectRoleEnumMap = {
  ProjectRole.admin: 'admin',
  ProjectRole.editor: 'editor',
  ProjectRole.viewer: 'viewer',
};
