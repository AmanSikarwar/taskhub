part of 'project_bloc.dart';

@freezed
sealed class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = ProjectInitial;

  const factory ProjectState.loading() = ProjectLoading;

  const factory ProjectState.projectsLoaded(List<ProjectWithRole> projects) =
      ProjectsLoaded;

  const factory ProjectState.projectLoaded(Project project) = ProjectLoaded;

  const factory ProjectState.membersLoaded(List<ProjectMember> members) =
      MembersLoaded;

  const factory ProjectState.projectCreated(Project project) = ProjectCreated;

  const factory ProjectState.projectUpdated(Project project) = ProjectUpdated;

  const factory ProjectState.projectDeleted(String projectId) = ProjectDeleted;

  const factory ProjectState.memberAdded(ProjectMember member) = MemberAdded;

  const factory ProjectState.memberUpdated(ProjectMember member) =
      MemberUpdated;

  const factory ProjectState.memberRemoved(String userId) = MemberRemoved;

  const factory ProjectState.projectLeft(String projectId) = ProjectLeft;

  const factory ProjectState.error(ProjectFailure failure) = ProjectError;
}
