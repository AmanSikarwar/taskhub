import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
abstract class Project with _$Project {
  const factory Project({
    required String id,
    required String ownerId,
    required String title,
    String? description,
    DateTime? dueDate,
    required String colorCode,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@freezed
abstract class ProjectWithRole with _$ProjectWithRole {
  const factory ProjectWithRole({
    required Project project,
    required ProjectRole role,
    required int taskCount,
    required int completedTaskCount,
  }) = _ProjectWithRole;

  factory ProjectWithRole.fromJson(Map<String, dynamic> json) =>
      _$ProjectWithRoleFromJson(json);
}

enum ProjectRole {
  @JsonValue('admin')
  admin,
  @JsonValue('editor')
  editor,
  @JsonValue('viewer')
  viewer,
}
