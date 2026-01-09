import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/project.dart';
import '../../domain/entities/project_failure.dart';
import '../../domain/entities/project_member.dart';
import '../../domain/repositories/project_repository.dart';

part 'project_bloc.freezed.dart';
part 'project_event.dart';
part 'project_state.dart';

@injectable
class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectRepository _projectRepository;
  StreamSubscription<List<ProjectWithRole>>? _projectsSubscription;

  ProjectBloc(this._projectRepository) : super(const ProjectState.initial()) {
    on<LoadProjects>(_onLoadProjects);
    on<LoadProject>(_onLoadProject);
    on<LoadProjectMembers>(_onLoadProjectMembers);
    on<CreateProject>(_onCreateProject);
    on<UpdateProject>(_onUpdateProject);
    on<DeleteProject>(_onDeleteProject);
    on<AddMember>(_onAddMember);
    on<UpdateMemberRole>(_onUpdateMemberRole);
    on<RemoveMember>(_onRemoveMember);
    on<LeaveProject>(_onLeaveProject);
    on<WatchProjects>(_onWatchProjects);
    on<ProjectsUpdated>(_onProjectsUpdated);
  }

  Future<void> _onLoadProjects(
    LoadProjects event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const .loading());

    final result = await _projectRepository.getProjects();

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else {
      emit(.projectsLoaded(result.projects ?? []));
    }
  }

  Future<void> _onLoadProject(
    LoadProject event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const .loading());

    final result = await _projectRepository.getProject(event.projectId);

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.project != null) {
      emit(.projectLoaded(result.project!));
    }
  }

  Future<void> _onLoadProjectMembers(
    LoadProjectMembers event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const .loading());

    final result = await _projectRepository.getProjectMembers(event.projectId);

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else {
      emit(.membersLoaded(result.members ?? []));
    }
  }

  Future<void> _onCreateProject(
    CreateProject event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const .loading());

    final result = await _projectRepository.createProject(
      title: event.title,
      description: event.description,
      dueDate: event.dueDate,
      colorCode: event.colorCode,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.project != null) {
      emit(.projectCreated(result.project!));
    }
  }

  Future<void> _onUpdateProject(
    UpdateProject event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const .loading());

    final result = await _projectRepository.updateProject(
      projectId: event.projectId,
      title: event.title,
      description: event.description,
      dueDate: event.dueDate,
      colorCode: event.colorCode,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.project != null) {
      emit(.projectUpdated(result.project!));
    }
  }

  Future<void> _onDeleteProject(
    DeleteProject event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const .loading());

    final failure = await _projectRepository.deleteProject(event.projectId);

    if (failure != null) {
      emit(.error(failure));
    } else {
      emit(.projectDeleted(event.projectId));
    }
  }

  Future<void> _onAddMember(AddMember event, Emitter<ProjectState> emit) async {
    emit(const .loading());

    final result = await _projectRepository.addMember(
      projectId: event.projectId,
      userId: event.userId,
      role: event.role,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.member != null) {
      emit(.memberAdded(result.member!));
    }
  }

  Future<void> _onUpdateMemberRole(
    UpdateMemberRole event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const .loading());

    final result = await _projectRepository.updateMemberRole(
      projectId: event.projectId,
      userId: event.userId,
      role: event.role,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.member != null) {
      emit(.memberUpdated(result.member!));
    }
  }

  Future<void> _onRemoveMember(
    RemoveMember event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const .loading());

    final failure = await _projectRepository.removeMember(
      projectId: event.projectId,
      userId: event.userId,
    );

    if (failure != null) {
      emit(.error(failure));
    } else {
      emit(.memberRemoved(event.userId));
    }
  }

  Future<void> _onLeaveProject(
    LeaveProject event,
    Emitter<ProjectState> emit,
  ) async {
    emit(const .loading());

    final failure = await _projectRepository.leaveProject(event.projectId);

    if (failure != null) {
      emit(.error(failure));
    } else {
      emit(.projectLeft(event.projectId));
    }
  }

  void _onWatchProjects(WatchProjects event, Emitter<ProjectState> emit) {
    _projectsSubscription?.cancel();
    _projectsSubscription = _projectRepository.watchProjects().listen(
      (projects) => add(.projectsUpdated(projects)),
    );
  }

  void _onProjectsUpdated(ProjectsUpdated event, Emitter<ProjectState> emit) {
    emit(.projectsLoaded(event.projects));
  }

  @override
  Future<void> close() {
    _projectsSubscription?.cancel();
    return super.close();
  }
}
