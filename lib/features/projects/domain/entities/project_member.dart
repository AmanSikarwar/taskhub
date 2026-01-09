import 'package:freezed_annotation/freezed_annotation.dart';

import 'project.dart';

part 'project_member.freezed.dart';
part 'project_member.g.dart';

@freezed
abstract class ProjectMember with _$ProjectMember {
  const factory ProjectMember({
    required String projectId,
    required String userId,
    required ProjectRole role,
    required DateTime joinedAt,
    String? email,
    String? displayName,
    String? avatarUrl,
  }) = _ProjectMember;

  factory ProjectMember.fromJson(Map<String, dynamic> json) =>
      _$ProjectMemberFromJson(json);
}
