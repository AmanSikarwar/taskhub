part of 'project_bloc.dart';

@freezed
class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.loadProjects() = LoadProjects;

  const factory ProjectEvent.loadProject(String projectId) = LoadProject;

  const factory ProjectEvent.loadProjectMembers(String projectId) =
      LoadProjectMembers;

  const factory ProjectEvent.createProject({
    required String title,
    String? description,
    DateTime? dueDate,
    String? colorCode,
  }) = CreateProject;

  const factory ProjectEvent.updateProject({
    required String projectId,
    String? title,
    String? description,
    DateTime? dueDate,
    String? colorCode,
  }) = UpdateProject;

  const factory ProjectEvent.deleteProject(String projectId) = DeleteProject;

  const factory ProjectEvent.addMember({
    required String projectId,
    required String userId,
    required ProjectRole role,
  }) = AddMember;

  const factory ProjectEvent.updateMemberRole({
    required String projectId,
    required String userId,
    required ProjectRole role,
  }) = UpdateMemberRole;

  const factory ProjectEvent.removeMember({
    required String projectId,
    required String userId,
  }) = RemoveMember;

  const factory ProjectEvent.leaveProject(String projectId) = LeaveProject;

  const factory ProjectEvent.watchProjects() = WatchProjects;

  const factory ProjectEvent.projectsUpdated(List<ProjectWithRole> projects) =
      ProjectsUpdated;
}
