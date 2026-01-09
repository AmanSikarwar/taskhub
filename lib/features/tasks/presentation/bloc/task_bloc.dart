import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/task.dart';
import '../../domain/entities/task_failure.dart';
import '../../domain/repositories/task_repository.dart';

part 'task_bloc.freezed.dart';
part 'task_event.dart';
part 'task_state.dart';

@injectable
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;
  StreamSubscription<List<Task>>? _tasksSubscription;

  TaskBloc(this._taskRepository) : super(const TaskState.initial()) {
    on<LoadProjectTasks>(_onLoadProjectTasks);
    on<LoadMyTasks>(_onLoadMyTasks);
    on<LoadTasksByDateRange>(_onLoadTasksByDateRange);
    on<LoadTask>(_onLoadTask);
    on<CreateTask>(_onCreateTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<CompleteTask>(_onCompleteTask);
    on<ReopenTask>(_onReopenTask);
    on<WatchProjectTasks>(_onWatchProjectTasks);
    on<WatchMyTasks>(_onWatchMyTasks);
    on<TasksUpdated>(_onTasksUpdated);
  }

  Future<void> _onLoadProjectTasks(
    LoadProjectTasks event,
    Emitter<TaskState> emit,
  ) async {
    emit(const .loading());

    final result = await _taskRepository.getTasksByProject(event.projectId);

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else {
      emit(.tasksLoaded(result.tasks ?? []));
    }
  }

  Future<void> _onLoadMyTasks(
    LoadMyTasks event,
    Emitter<TaskState> emit,
  ) async {
    emit(const .loading());

    final result = await _taskRepository.getMyTasks();

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else {
      emit(.tasksLoaded(result.tasks ?? []));
    }
  }

  Future<void> _onLoadTasksByDateRange(
    LoadTasksByDateRange event,
    Emitter<TaskState> emit,
  ) async {
    emit(const .loading());

    final result = await _taskRepository.getTasksByDateRange(
      start: event.start,
      end: event.end,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else {
      emit(.tasksLoaded(result.tasks ?? []));
    }
  }

  Future<void> _onLoadTask(LoadTask event, Emitter<TaskState> emit) async {
    emit(const .loading());

    final result = await _taskRepository.getTask(event.taskId);

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.task != null) {
      emit(.taskLoaded(result.task!));
    }
  }

  Future<void> _onCreateTask(CreateTask event, Emitter<TaskState> emit) async {
    emit(const .loading());

    final result = await _taskRepository.createTask(
      projectId: event.projectId,
      title: event.title,
      description: event.description,
      status: event.status,
      priority: event.priority,
      assignedTo: event.assignedTo,
      dueDate: event.dueDate,
      isRecurring: event.isRecurring,
      recurrenceRule: event.recurrenceRule,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.task != null) {
      emit(.taskCreated(result.task!));
    }
  }

  Future<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    emit(const .loading());

    final result = await _taskRepository.updateTask(
      taskId: event.taskId,
      title: event.title,
      description: event.description,
      status: event.status,
      priority: event.priority,
      assignedTo: event.assignedTo,
      dueDate: event.dueDate,
      isRecurring: event.isRecurring,
      recurrenceRule: event.recurrenceRule,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.task != null) {
      emit(.taskUpdated(result.task!));
    }
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    emit(const .loading());

    final failure = await _taskRepository.deleteTask(event.taskId);

    if (failure != null) {
      emit(.error(failure));
    } else {
      emit(.taskDeleted(event.taskId));
    }
  }

  Future<void> _onCompleteTask(
    CompleteTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(const .loading());

    final result = await _taskRepository.completeTask(event.taskId);

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.task != null) {
      emit(.taskUpdated(result.task!));
    }
  }

  Future<void> _onReopenTask(ReopenTask event, Emitter<TaskState> emit) async {
    emit(const .loading());

    final result = await _taskRepository.reopenTask(event.taskId);

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.task != null) {
      emit(.taskUpdated(result.task!));
    }
  }

  void _onWatchProjectTasks(WatchProjectTasks event, Emitter<TaskState> emit) {
    _tasksSubscription?.cancel();
    _tasksSubscription = _taskRepository
        .watchProjectTasks(event.projectId)
        .listen((tasks) => add(.tasksUpdated(tasks)));
  }

  void _onWatchMyTasks(WatchMyTasks event, Emitter<TaskState> emit) {
    _tasksSubscription?.cancel();
    _tasksSubscription = _taskRepository.watchMyTasks().listen(
      (tasks) => add(.tasksUpdated(tasks)),
    );
  }

  void _onTasksUpdated(TasksUpdated event, Emitter<TaskState> emit) {
    emit(.tasksLoaded(event.tasks));
  }

  @override
  Future<void> close() {
    _tasksSubscription?.cancel();
    return super.close();
  }
}
