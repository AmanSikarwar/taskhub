// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectMember _$ProjectMemberFromJson(Map<String, dynamic> json) =>
    _ProjectMember(
      projectId: json['projectId'] as String,
      userId: json['userId'] as String,
      role: $enumDecode(_$ProjectRoleEnumMap, json['role']),
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$ProjectMemberToJson(_ProjectMember instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'userId': instance.userId,
      'role': _$ProjectRoleEnumMap[instance.role]!,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'email': instance.email,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
    };

const _$ProjectRoleEnumMap = {
  ProjectRole.admin: 'admin',
  ProjectRole.editor: 'editor',
  ProjectRole.viewer: 'viewer',
};
