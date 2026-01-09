import '../entities/project.dart';
import '../entities/project_failure.dart';
import '../entities/project_member.dart';

abstract class ProjectRepository {
  Future<({List<ProjectWithRole>? projects, ProjectFailure? failure})>
  getProjects();

  Future<({Project? project, ProjectFailure? failure})> getProject(
    String projectId,
  );

  Future<({List<ProjectMember>? members, ProjectFailure? failure})>
  getProjectMembers(String projectId);

  Future<({Project? project, ProjectFailure? failure})> createProject({
    required String title,
    String? description,
    DateTime? dueDate,
    String? colorCode,
  });

  Future<({Project? project, ProjectFailure? failure})> updateProject({
    required String projectId,
    String? title,
    String? description,
    DateTime? dueDate,
    String? colorCode,
  });

  Future<ProjectFailure?> deleteProject(String projectId);

  Future<({ProjectMember? member, ProjectFailure? failure})> addMember({
    required String projectId,
    required String userId,
    required ProjectRole role,
  });

  Future<({ProjectMember? member, ProjectFailure? failure})> updateMemberRole({
    required String projectId,
    required String userId,
    required ProjectRole role,
  });

  Future<ProjectFailure?> removeMember({
    required String projectId,
    required String userId,
  });

  Future<ProjectFailure?> leaveProject(String projectId);

  Stream<List<ProjectWithRole>> watchProjects();
}
