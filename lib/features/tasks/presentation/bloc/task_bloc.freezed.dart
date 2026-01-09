// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskEvent()';
}


}

/// @nodoc
class $TaskEventCopyWith<$Res>  {
$TaskEventCopyWith(TaskEvent _, $Res Function(TaskEvent) __);
}


/// Adds pattern-matching-related methods to [TaskEvent].
extension TaskEventPatterns on TaskEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadProjectTasks value)?  loadProjectTasks,TResult Function( LoadMyTasks value)?  loadMyTasks,TResult Function( LoadTasksByDateRange value)?  loadTasksByDateRange,TResult Function( LoadTask value)?  loadTask,TResult Function( CreateTask value)?  createTask,TResult Function( UpdateTask value)?  updateTask,TResult Function( DeleteTask value)?  deleteTask,TResult Function( CompleteTask value)?  completeTask,TResult Function( ReopenTask value)?  reopenTask,TResult Function( WatchProjectTasks value)?  watchProjectTasks,TResult Function( WatchMyTasks value)?  watchMyTasks,TResult Function( TasksUpdated value)?  tasksUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadProjectTasks() when loadProjectTasks != null:
return loadProjectTasks(_that);case LoadMyTasks() when loadMyTasks != null:
return loadMyTasks(_that);case LoadTasksByDateRange() when loadTasksByDateRange != null:
return loadTasksByDateRange(_that);case LoadTask() when loadTask != null:
return loadTask(_that);case CreateTask() when createTask != null:
return createTask(_that);case UpdateTask() when updateTask != null:
return updateTask(_that);case DeleteTask() when deleteTask != null:
return deleteTask(_that);case CompleteTask() when completeTask != null:
return completeTask(_that);case ReopenTask() when reopenTask != null:
return reopenTask(_that);case WatchProjectTasks() when watchProjectTasks != null:
return watchProjectTasks(_that);case WatchMyTasks() when watchMyTasks != null:
return watchMyTasks(_that);case TasksUpdated() when tasksUpdated != null:
return tasksUpdated(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadProjectTasks value)  loadProjectTasks,required TResult Function( LoadMyTasks value)  loadMyTasks,required TResult Function( LoadTasksByDateRange value)  loadTasksByDateRange,required TResult Function( LoadTask value)  loadTask,required TResult Function( CreateTask value)  createTask,required TResult Function( UpdateTask value)  updateTask,required TResult Function( DeleteTask value)  deleteTask,required TResult Function( CompleteTask value)  completeTask,required TResult Function( ReopenTask value)  reopenTask,required TResult Function( WatchProjectTasks value)  watchProjectTasks,required TResult Function( WatchMyTasks value)  watchMyTasks,required TResult Function( TasksUpdated value)  tasksUpdated,}){
final _that = this;
switch (_that) {
case LoadProjectTasks():
return loadProjectTasks(_that);case LoadMyTasks():
return loadMyTasks(_that);case LoadTasksByDateRange():
return loadTasksByDateRange(_that);case LoadTask():
return loadTask(_that);case CreateTask():
return createTask(_that);case UpdateTask():
return updateTask(_that);case DeleteTask():
return deleteTask(_that);case CompleteTask():
return completeTask(_that);case ReopenTask():
return reopenTask(_that);case WatchProjectTasks():
return watchProjectTasks(_that);case WatchMyTasks():
return watchMyTasks(_that);case TasksUpdated():
return tasksUpdated(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadProjectTasks value)?  loadProjectTasks,TResult? Function( LoadMyTasks value)?  loadMyTasks,TResult? Function( LoadTasksByDateRange value)?  loadTasksByDateRange,TResult? Function( LoadTask value)?  loadTask,TResult? Function( CreateTask value)?  createTask,TResult? Function( UpdateTask value)?  updateTask,TResult? Function( DeleteTask value)?  deleteTask,TResult? Function( CompleteTask value)?  completeTask,TResult? Function( ReopenTask value)?  reopenTask,TResult? Function( WatchProjectTasks value)?  watchProjectTasks,TResult? Function( WatchMyTasks value)?  watchMyTasks,TResult? Function( TasksUpdated value)?  tasksUpdated,}){
final _that = this;
switch (_that) {
case LoadProjectTasks() when loadProjectTasks != null:
return loadProjectTasks(_that);case LoadMyTasks() when loadMyTasks != null:
return loadMyTasks(_that);case LoadTasksByDateRange() when loadTasksByDateRange != null:
return loadTasksByDateRange(_that);case LoadTask() when loadTask != null:
return loadTask(_that);case CreateTask() when createTask != null:
return createTask(_that);case UpdateTask() when updateTask != null:
return updateTask(_that);case DeleteTask() when deleteTask != null:
return deleteTask(_that);case CompleteTask() when completeTask != null:
return completeTask(_that);case ReopenTask() when reopenTask != null:
return reopenTask(_that);case WatchProjectTasks() when watchProjectTasks != null:
return watchProjectTasks(_that);case WatchMyTasks() when watchMyTasks != null:
return watchMyTasks(_that);case TasksUpdated() when tasksUpdated != null:
return tasksUpdated(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String projectId)?  loadProjectTasks,TResult Function()?  loadMyTasks,TResult Function( DateTime start,  DateTime end)?  loadTasksByDateRange,TResult Function( String taskId)?  loadTask,TResult Function( String? projectId,  String title,  String? description,  TaskStatus? status,  TaskPriority? priority,  String? assignedTo,  DateTime? dueDate,  bool? isRecurring,  String? recurrenceRule)?  createTask,TResult Function( String taskId,  String? title,  String? description,  TaskStatus? status,  TaskPriority? priority,  String? assignedTo,  DateTime? dueDate,  bool? isRecurring,  String? recurrenceRule)?  updateTask,TResult Function( String taskId)?  deleteTask,TResult Function( String taskId)?  completeTask,TResult Function( String taskId)?  reopenTask,TResult Function( String projectId)?  watchProjectTasks,TResult Function()?  watchMyTasks,TResult Function( List<Task> tasks)?  tasksUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadProjectTasks() when loadProjectTasks != null:
return loadProjectTasks(_that.projectId);case LoadMyTasks() when loadMyTasks != null:
return loadMyTasks();case LoadTasksByDateRange() when loadTasksByDateRange != null:
return loadTasksByDateRange(_that.start,_that.end);case LoadTask() when loadTask != null:
return loadTask(_that.taskId);case CreateTask() when createTask != null:
return createTask(_that.projectId,_that.title,_that.description,_that.status,_that.priority,_that.assignedTo,_that.dueDate,_that.isRecurring,_that.recurrenceRule);case UpdateTask() when updateTask != null:
return updateTask(_that.taskId,_that.title,_that.description,_that.status,_that.priority,_that.assignedTo,_that.dueDate,_that.isRecurring,_that.recurrenceRule);case DeleteTask() when deleteTask != null:
return deleteTask(_that.taskId);case CompleteTask() when completeTask != null:
return completeTask(_that.taskId);case ReopenTask() when reopenTask != null:
return reopenTask(_that.taskId);case WatchProjectTasks() when watchProjectTasks != null:
return watchProjectTasks(_that.projectId);case WatchMyTasks() when watchMyTasks != null:
return watchMyTasks();case TasksUpdated() when tasksUpdated != null:
return tasksUpdated(_that.tasks);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String projectId)  loadProjectTasks,required TResult Function()  loadMyTasks,required TResult Function( DateTime start,  DateTime end)  loadTasksByDateRange,required TResult Function( String taskId)  loadTask,required TResult Function( String? projectId,  String title,  String? description,  TaskStatus? status,  TaskPriority? priority,  String? assignedTo,  DateTime? dueDate,  bool? isRecurring,  String? recurrenceRule)  createTask,required TResult Function( String taskId,  String? title,  String? description,  TaskStatus? status,  TaskPriority? priority,  String? assignedTo,  DateTime? dueDate,  bool? isRecurring,  String? recurrenceRule)  updateTask,required TResult Function( String taskId)  deleteTask,required TResult Function( String taskId)  completeTask,required TResult Function( String taskId)  reopenTask,required TResult Function( String projectId)  watchProjectTasks,required TResult Function()  watchMyTasks,required TResult Function( List<Task> tasks)  tasksUpdated,}) {final _that = this;
switch (_that) {
case LoadProjectTasks():
return loadProjectTasks(_that.projectId);case LoadMyTasks():
return loadMyTasks();case LoadTasksByDateRange():
return loadTasksByDateRange(_that.start,_that.end);case LoadTask():
return loadTask(_that.taskId);case CreateTask():
return createTask(_that.projectId,_that.title,_that.description,_that.status,_that.priority,_that.assignedTo,_that.dueDate,_that.isRecurring,_that.recurrenceRule);case UpdateTask():
return updateTask(_that.taskId,_that.title,_that.description,_that.status,_that.priority,_that.assignedTo,_that.dueDate,_that.isRecurring,_that.recurrenceRule);case DeleteTask():
return deleteTask(_that.taskId);case CompleteTask():
return completeTask(_that.taskId);case ReopenTask():
return reopenTask(_that.taskId);case WatchProjectTasks():
return watchProjectTasks(_that.projectId);case WatchMyTasks():
return watchMyTasks();case TasksUpdated():
return tasksUpdated(_that.tasks);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String projectId)?  loadProjectTasks,TResult? Function()?  loadMyTasks,TResult? Function( DateTime start,  DateTime end)?  loadTasksByDateRange,TResult? Function( String taskId)?  loadTask,TResult? Function( String? projectId,  String title,  String? description,  TaskStatus? status,  TaskPriority? priority,  String? assignedTo,  DateTime? dueDate,  bool? isRecurring,  String? recurrenceRule)?  createTask,TResult? Function( String taskId,  String? title,  String? description,  TaskStatus? status,  TaskPriority? priority,  String? assignedTo,  DateTime? dueDate,  bool? isRecurring,  String? recurrenceRule)?  updateTask,TResult? Function( String taskId)?  deleteTask,TResult? Function( String taskId)?  completeTask,TResult? Function( String taskId)?  reopenTask,TResult? Function( String projectId)?  watchProjectTasks,TResult? Function()?  watchMyTasks,TResult? Function( List<Task> tasks)?  tasksUpdated,}) {final _that = this;
switch (_that) {
case LoadProjectTasks() when loadProjectTasks != null:
return loadProjectTasks(_that.projectId);case LoadMyTasks() when loadMyTasks != null:
return loadMyTasks();case LoadTasksByDateRange() when loadTasksByDateRange != null:
return loadTasksByDateRange(_that.start,_that.end);case LoadTask() when loadTask != null:
return loadTask(_that.taskId);case CreateTask() when createTask != null:
return createTask(_that.projectId,_that.title,_that.description,_that.status,_that.priority,_that.assignedTo,_that.dueDate,_that.isRecurring,_that.recurrenceRule);case UpdateTask() when updateTask != null:
return updateTask(_that.taskId,_that.title,_that.description,_that.status,_that.priority,_that.assignedTo,_that.dueDate,_that.isRecurring,_that.recurrenceRule);case DeleteTask() when deleteTask != null:
return deleteTask(_that.taskId);case CompleteTask() when completeTask != null:
return completeTask(_that.taskId);case ReopenTask() when reopenTask != null:
return reopenTask(_that.taskId);case WatchProjectTasks() when watchProjectTasks != null:
return watchProjectTasks(_that.projectId);case WatchMyTasks() when watchMyTasks != null:
return watchMyTasks();case TasksUpdated() when tasksUpdated != null:
return tasksUpdated(_that.tasks);case _:
  return null;

}
}

}

/// @nodoc


class LoadProjectTasks implements TaskEvent {
  const LoadProjectTasks(this.projectId);
  

 final  String projectId;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadProjectTasksCopyWith<LoadProjectTasks> get copyWith => _$LoadProjectTasksCopyWithImpl<LoadProjectTasks>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProjectTasks&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'TaskEvent.loadProjectTasks(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $LoadProjectTasksCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $LoadProjectTasksCopyWith(LoadProjectTasks value, $Res Function(LoadProjectTasks) _then) = _$LoadProjectTasksCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$LoadProjectTasksCopyWithImpl<$Res>
    implements $LoadProjectTasksCopyWith<$Res> {
  _$LoadProjectTasksCopyWithImpl(this._self, this._then);

  final LoadProjectTasks _self;
  final $Res Function(LoadProjectTasks) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(LoadProjectTasks(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadMyTasks implements TaskEvent {
  const LoadMyTasks();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMyTasks);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskEvent.loadMyTasks()';
}


}




/// @nodoc


class LoadTasksByDateRange implements TaskEvent {
  const LoadTasksByDateRange({required this.start, required this.end});
  

 final  DateTime start;
 final  DateTime end;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadTasksByDateRangeCopyWith<LoadTasksByDateRange> get copyWith => _$LoadTasksByDateRangeCopyWithImpl<LoadTasksByDateRange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTasksByDateRange&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}


@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'TaskEvent.loadTasksByDateRange(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $LoadTasksByDateRangeCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $LoadTasksByDateRangeCopyWith(LoadTasksByDateRange value, $Res Function(LoadTasksByDateRange) _then) = _$LoadTasksByDateRangeCopyWithImpl;
@useResult
$Res call({
 DateTime start, DateTime end
});




}
/// @nodoc
class _$LoadTasksByDateRangeCopyWithImpl<$Res>
    implements $LoadTasksByDateRangeCopyWith<$Res> {
  _$LoadTasksByDateRangeCopyWithImpl(this._self, this._then);

  final LoadTasksByDateRange _self;
  final $Res Function(LoadTasksByDateRange) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,}) {
  return _then(LoadTasksByDateRange(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class LoadTask implements TaskEvent {
  const LoadTask(this.taskId);
  

 final  String taskId;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadTaskCopyWith<LoadTask> get copyWith => _$LoadTaskCopyWithImpl<LoadTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTask&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'TaskEvent.loadTask(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $LoadTaskCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $LoadTaskCopyWith(LoadTask value, $Res Function(LoadTask) _then) = _$LoadTaskCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class _$LoadTaskCopyWithImpl<$Res>
    implements $LoadTaskCopyWith<$Res> {
  _$LoadTaskCopyWithImpl(this._self, this._then);

  final LoadTask _self;
  final $Res Function(LoadTask) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(LoadTask(
null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateTask implements TaskEvent {
  const CreateTask({this.projectId, required this.title, this.description, this.status, this.priority, this.assignedTo, this.dueDate, this.isRecurring, this.recurrenceRule});
  

 final  String? projectId;
 final  String title;
 final  String? description;
 final  TaskStatus? status;
 final  TaskPriority? priority;
 final  String? assignedTo;
 final  DateTime? dueDate;
 final  bool? isRecurring;
 final  String? recurrenceRule;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTaskCopyWith<CreateTask> get copyWith => _$CreateTaskCopyWithImpl<CreateTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTask&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.recurrenceRule, recurrenceRule) || other.recurrenceRule == recurrenceRule));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,title,description,status,priority,assignedTo,dueDate,isRecurring,recurrenceRule);

@override
String toString() {
  return 'TaskEvent.createTask(projectId: $projectId, title: $title, description: $description, status: $status, priority: $priority, assignedTo: $assignedTo, dueDate: $dueDate, isRecurring: $isRecurring, recurrenceRule: $recurrenceRule)';
}


}

/// @nodoc
abstract mixin class $CreateTaskCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $CreateTaskCopyWith(CreateTask value, $Res Function(CreateTask) _then) = _$CreateTaskCopyWithImpl;
@useResult
$Res call({
 String? projectId, String title, String? description, TaskStatus? status, TaskPriority? priority, String? assignedTo, DateTime? dueDate, bool? isRecurring, String? recurrenceRule
});




}
/// @nodoc
class _$CreateTaskCopyWithImpl<$Res>
    implements $CreateTaskCopyWith<$Res> {
  _$CreateTaskCopyWithImpl(this._self, this._then);

  final CreateTask _self;
  final $Res Function(CreateTask) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = freezed,Object? title = null,Object? description = freezed,Object? status = freezed,Object? priority = freezed,Object? assignedTo = freezed,Object? dueDate = freezed,Object? isRecurring = freezed,Object? recurrenceRule = freezed,}) {
  return _then(CreateTask(
projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority?,assignedTo: freezed == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isRecurring: freezed == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool?,recurrenceRule: freezed == recurrenceRule ? _self.recurrenceRule : recurrenceRule // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UpdateTask implements TaskEvent {
  const UpdateTask({required this.taskId, this.title, this.description, this.status, this.priority, this.assignedTo, this.dueDate, this.isRecurring, this.recurrenceRule});
  

 final  String taskId;
 final  String? title;
 final  String? description;
 final  TaskStatus? status;
 final  TaskPriority? priority;
 final  String? assignedTo;
 final  DateTime? dueDate;
 final  bool? isRecurring;
 final  String? recurrenceRule;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTaskCopyWith<UpdateTask> get copyWith => _$UpdateTaskCopyWithImpl<UpdateTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTask&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.recurrenceRule, recurrenceRule) || other.recurrenceRule == recurrenceRule));
}


@override
int get hashCode => Object.hash(runtimeType,taskId,title,description,status,priority,assignedTo,dueDate,isRecurring,recurrenceRule);

@override
String toString() {
  return 'TaskEvent.updateTask(taskId: $taskId, title: $title, description: $description, status: $status, priority: $priority, assignedTo: $assignedTo, dueDate: $dueDate, isRecurring: $isRecurring, recurrenceRule: $recurrenceRule)';
}


}

/// @nodoc
abstract mixin class $UpdateTaskCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $UpdateTaskCopyWith(UpdateTask value, $Res Function(UpdateTask) _then) = _$UpdateTaskCopyWithImpl;
@useResult
$Res call({
 String taskId, String? title, String? description, TaskStatus? status, TaskPriority? priority, String? assignedTo, DateTime? dueDate, bool? isRecurring, String? recurrenceRule
});




}
/// @nodoc
class _$UpdateTaskCopyWithImpl<$Res>
    implements $UpdateTaskCopyWith<$Res> {
  _$UpdateTaskCopyWithImpl(this._self, this._then);

  final UpdateTask _self;
  final $Res Function(UpdateTask) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? title = freezed,Object? description = freezed,Object? status = freezed,Object? priority = freezed,Object? assignedTo = freezed,Object? dueDate = freezed,Object? isRecurring = freezed,Object? recurrenceRule = freezed,}) {
  return _then(UpdateTask(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority?,assignedTo: freezed == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isRecurring: freezed == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool?,recurrenceRule: freezed == recurrenceRule ? _self.recurrenceRule : recurrenceRule // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DeleteTask implements TaskEvent {
  const DeleteTask(this.taskId);
  

 final  String taskId;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteTaskCopyWith<DeleteTask> get copyWith => _$DeleteTaskCopyWithImpl<DeleteTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteTask&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'TaskEvent.deleteTask(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $DeleteTaskCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $DeleteTaskCopyWith(DeleteTask value, $Res Function(DeleteTask) _then) = _$DeleteTaskCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class _$DeleteTaskCopyWithImpl<$Res>
    implements $DeleteTaskCopyWith<$Res> {
  _$DeleteTaskCopyWithImpl(this._self, this._then);

  final DeleteTask _self;
  final $Res Function(DeleteTask) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(DeleteTask(
null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CompleteTask implements TaskEvent {
  const CompleteTask(this.taskId);
  

 final  String taskId;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteTaskCopyWith<CompleteTask> get copyWith => _$CompleteTaskCopyWithImpl<CompleteTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteTask&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'TaskEvent.completeTask(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $CompleteTaskCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $CompleteTaskCopyWith(CompleteTask value, $Res Function(CompleteTask) _then) = _$CompleteTaskCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class _$CompleteTaskCopyWithImpl<$Res>
    implements $CompleteTaskCopyWith<$Res> {
  _$CompleteTaskCopyWithImpl(this._self, this._then);

  final CompleteTask _self;
  final $Res Function(CompleteTask) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(CompleteTask(
null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReopenTask implements TaskEvent {
  const ReopenTask(this.taskId);
  

 final  String taskId;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReopenTaskCopyWith<ReopenTask> get copyWith => _$ReopenTaskCopyWithImpl<ReopenTask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReopenTask&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'TaskEvent.reopenTask(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $ReopenTaskCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $ReopenTaskCopyWith(ReopenTask value, $Res Function(ReopenTask) _then) = _$ReopenTaskCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class _$ReopenTaskCopyWithImpl<$Res>
    implements $ReopenTaskCopyWith<$Res> {
  _$ReopenTaskCopyWithImpl(this._self, this._then);

  final ReopenTask _self;
  final $Res Function(ReopenTask) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(ReopenTask(
null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WatchProjectTasks implements TaskEvent {
  const WatchProjectTasks(this.projectId);
  

 final  String projectId;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchProjectTasksCopyWith<WatchProjectTasks> get copyWith => _$WatchProjectTasksCopyWithImpl<WatchProjectTasks>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchProjectTasks&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'TaskEvent.watchProjectTasks(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $WatchProjectTasksCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $WatchProjectTasksCopyWith(WatchProjectTasks value, $Res Function(WatchProjectTasks) _then) = _$WatchProjectTasksCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$WatchProjectTasksCopyWithImpl<$Res>
    implements $WatchProjectTasksCopyWith<$Res> {
  _$WatchProjectTasksCopyWithImpl(this._self, this._then);

  final WatchProjectTasks _self;
  final $Res Function(WatchProjectTasks) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(WatchProjectTasks(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WatchMyTasks implements TaskEvent {
  const WatchMyTasks();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchMyTasks);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskEvent.watchMyTasks()';
}


}




/// @nodoc


class TasksUpdated implements TaskEvent {
  const TasksUpdated(final  List<Task> tasks): _tasks = tasks;
  

 final  List<Task> _tasks;
 List<Task> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksUpdatedCopyWith<TasksUpdated> get copyWith => _$TasksUpdatedCopyWithImpl<TasksUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksUpdated&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'TaskEvent.tasksUpdated(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $TasksUpdatedCopyWith<$Res> implements $TaskEventCopyWith<$Res> {
  factory $TasksUpdatedCopyWith(TasksUpdated value, $Res Function(TasksUpdated) _then) = _$TasksUpdatedCopyWithImpl;
@useResult
$Res call({
 List<Task> tasks
});




}
/// @nodoc
class _$TasksUpdatedCopyWithImpl<$Res>
    implements $TasksUpdatedCopyWith<$Res> {
  _$TasksUpdatedCopyWithImpl(this._self, this._then);

  final TasksUpdated _self;
  final $Res Function(TasksUpdated) _then;

/// Create a copy of TaskEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tasks = null,}) {
  return _then(TasksUpdated(
null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<Task>,
  ));
}


}

/// @nodoc
mixin _$TaskState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskState()';
}


}

/// @nodoc
class $TaskStateCopyWith<$Res>  {
$TaskStateCopyWith(TaskState _, $Res Function(TaskState) __);
}


/// Adds pattern-matching-related methods to [TaskState].
extension TaskStatePatterns on TaskState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskInitial value)?  initial,TResult Function( TaskLoading value)?  loading,TResult Function( TasksLoaded value)?  tasksLoaded,TResult Function( TaskLoaded value)?  taskLoaded,TResult Function( TaskCreated value)?  taskCreated,TResult Function( TaskUpdated value)?  taskUpdated,TResult Function( TaskDeleted value)?  taskDeleted,TResult Function( TaskError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskInitial() when initial != null:
return initial(_that);case TaskLoading() when loading != null:
return loading(_that);case TasksLoaded() when tasksLoaded != null:
return tasksLoaded(_that);case TaskLoaded() when taskLoaded != null:
return taskLoaded(_that);case TaskCreated() when taskCreated != null:
return taskCreated(_that);case TaskUpdated() when taskUpdated != null:
return taskUpdated(_that);case TaskDeleted() when taskDeleted != null:
return taskDeleted(_that);case TaskError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskInitial value)  initial,required TResult Function( TaskLoading value)  loading,required TResult Function( TasksLoaded value)  tasksLoaded,required TResult Function( TaskLoaded value)  taskLoaded,required TResult Function( TaskCreated value)  taskCreated,required TResult Function( TaskUpdated value)  taskUpdated,required TResult Function( TaskDeleted value)  taskDeleted,required TResult Function( TaskError value)  error,}){
final _that = this;
switch (_that) {
case TaskInitial():
return initial(_that);case TaskLoading():
return loading(_that);case TasksLoaded():
return tasksLoaded(_that);case TaskLoaded():
return taskLoaded(_that);case TaskCreated():
return taskCreated(_that);case TaskUpdated():
return taskUpdated(_that);case TaskDeleted():
return taskDeleted(_that);case TaskError():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskInitial value)?  initial,TResult? Function( TaskLoading value)?  loading,TResult? Function( TasksLoaded value)?  tasksLoaded,TResult? Function( TaskLoaded value)?  taskLoaded,TResult? Function( TaskCreated value)?  taskCreated,TResult? Function( TaskUpdated value)?  taskUpdated,TResult? Function( TaskDeleted value)?  taskDeleted,TResult? Function( TaskError value)?  error,}){
final _that = this;
switch (_that) {
case TaskInitial() when initial != null:
return initial(_that);case TaskLoading() when loading != null:
return loading(_that);case TasksLoaded() when tasksLoaded != null:
return tasksLoaded(_that);case TaskLoaded() when taskLoaded != null:
return taskLoaded(_that);case TaskCreated() when taskCreated != null:
return taskCreated(_that);case TaskUpdated() when taskUpdated != null:
return taskUpdated(_that);case TaskDeleted() when taskDeleted != null:
return taskDeleted(_that);case TaskError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Task> tasks)?  tasksLoaded,TResult Function( Task task)?  taskLoaded,TResult Function( Task task)?  taskCreated,TResult Function( Task task)?  taskUpdated,TResult Function( String taskId)?  taskDeleted,TResult Function( TaskFailure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskInitial() when initial != null:
return initial();case TaskLoading() when loading != null:
return loading();case TasksLoaded() when tasksLoaded != null:
return tasksLoaded(_that.tasks);case TaskLoaded() when taskLoaded != null:
return taskLoaded(_that.task);case TaskCreated() when taskCreated != null:
return taskCreated(_that.task);case TaskUpdated() when taskUpdated != null:
return taskUpdated(_that.task);case TaskDeleted() when taskDeleted != null:
return taskDeleted(_that.taskId);case TaskError() when error != null:
return error(_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Task> tasks)  tasksLoaded,required TResult Function( Task task)  taskLoaded,required TResult Function( Task task)  taskCreated,required TResult Function( Task task)  taskUpdated,required TResult Function( String taskId)  taskDeleted,required TResult Function( TaskFailure failure)  error,}) {final _that = this;
switch (_that) {
case TaskInitial():
return initial();case TaskLoading():
return loading();case TasksLoaded():
return tasksLoaded(_that.tasks);case TaskLoaded():
return taskLoaded(_that.task);case TaskCreated():
return taskCreated(_that.task);case TaskUpdated():
return taskUpdated(_that.task);case TaskDeleted():
return taskDeleted(_that.taskId);case TaskError():
return error(_that.failure);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Task> tasks)?  tasksLoaded,TResult? Function( Task task)?  taskLoaded,TResult? Function( Task task)?  taskCreated,TResult? Function( Task task)?  taskUpdated,TResult? Function( String taskId)?  taskDeleted,TResult? Function( TaskFailure failure)?  error,}) {final _that = this;
switch (_that) {
case TaskInitial() when initial != null:
return initial();case TaskLoading() when loading != null:
return loading();case TasksLoaded() when tasksLoaded != null:
return tasksLoaded(_that.tasks);case TaskLoaded() when taskLoaded != null:
return taskLoaded(_that.task);case TaskCreated() when taskCreated != null:
return taskCreated(_that.task);case TaskUpdated() when taskUpdated != null:
return taskUpdated(_that.task);case TaskDeleted() when taskDeleted != null:
return taskDeleted(_that.taskId);case TaskError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class TaskInitial implements TaskState {
  const TaskInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskState.initial()';
}


}




/// @nodoc


class TaskLoading implements TaskState {
  const TaskLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskState.loading()';
}


}




/// @nodoc


class TasksLoaded implements TaskState {
  const TasksLoaded(final  List<Task> tasks): _tasks = tasks;
  

 final  List<Task> _tasks;
 List<Task> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksLoadedCopyWith<TasksLoaded> get copyWith => _$TasksLoadedCopyWithImpl<TasksLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksLoaded&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'TaskState.tasksLoaded(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $TasksLoadedCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory $TasksLoadedCopyWith(TasksLoaded value, $Res Function(TasksLoaded) _then) = _$TasksLoadedCopyWithImpl;
@useResult
$Res call({
 List<Task> tasks
});




}
/// @nodoc
class _$TasksLoadedCopyWithImpl<$Res>
    implements $TasksLoadedCopyWith<$Res> {
  _$TasksLoadedCopyWithImpl(this._self, this._then);

  final TasksLoaded _self;
  final $Res Function(TasksLoaded) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tasks = null,}) {
  return _then(TasksLoaded(
null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<Task>,
  ));
}


}

/// @nodoc


class TaskLoaded implements TaskState {
  const TaskLoaded(this.task);
  

 final  Task task;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskLoadedCopyWith<TaskLoaded> get copyWith => _$TaskLoadedCopyWithImpl<TaskLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskLoaded&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'TaskState.taskLoaded(task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskLoadedCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory $TaskLoadedCopyWith(TaskLoaded value, $Res Function(TaskLoaded) _then) = _$TaskLoadedCopyWithImpl;
@useResult
$Res call({
 Task task
});


$TaskCopyWith<$Res> get task;

}
/// @nodoc
class _$TaskLoadedCopyWithImpl<$Res>
    implements $TaskLoadedCopyWith<$Res> {
  _$TaskLoadedCopyWithImpl(this._self, this._then);

  final TaskLoaded _self;
  final $Res Function(TaskLoaded) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(TaskLoaded(
null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,
  ));
}

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get task {
  
  return $TaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

/// @nodoc


class TaskCreated implements TaskState {
  const TaskCreated(this.task);
  

 final  Task task;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCreatedCopyWith<TaskCreated> get copyWith => _$TaskCreatedCopyWithImpl<TaskCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskCreated&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'TaskState.taskCreated(task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskCreatedCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory $TaskCreatedCopyWith(TaskCreated value, $Res Function(TaskCreated) _then) = _$TaskCreatedCopyWithImpl;
@useResult
$Res call({
 Task task
});


$TaskCopyWith<$Res> get task;

}
/// @nodoc
class _$TaskCreatedCopyWithImpl<$Res>
    implements $TaskCreatedCopyWith<$Res> {
  _$TaskCreatedCopyWithImpl(this._self, this._then);

  final TaskCreated _self;
  final $Res Function(TaskCreated) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(TaskCreated(
null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,
  ));
}

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get task {
  
  return $TaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

/// @nodoc


class TaskUpdated implements TaskState {
  const TaskUpdated(this.task);
  

 final  Task task;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskUpdatedCopyWith<TaskUpdated> get copyWith => _$TaskUpdatedCopyWithImpl<TaskUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskUpdated&&(identical(other.task, task) || other.task == task));
}


@override
int get hashCode => Object.hash(runtimeType,task);

@override
String toString() {
  return 'TaskState.taskUpdated(task: $task)';
}


}

/// @nodoc
abstract mixin class $TaskUpdatedCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory $TaskUpdatedCopyWith(TaskUpdated value, $Res Function(TaskUpdated) _then) = _$TaskUpdatedCopyWithImpl;
@useResult
$Res call({
 Task task
});


$TaskCopyWith<$Res> get task;

}
/// @nodoc
class _$TaskUpdatedCopyWithImpl<$Res>
    implements $TaskUpdatedCopyWith<$Res> {
  _$TaskUpdatedCopyWithImpl(this._self, this._then);

  final TaskUpdated _self;
  final $Res Function(TaskUpdated) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? task = null,}) {
  return _then(TaskUpdated(
null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,
  ));
}

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get task {
  
  return $TaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}
}

/// @nodoc


class TaskDeleted implements TaskState {
  const TaskDeleted(this.taskId);
  

 final  String taskId;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDeletedCopyWith<TaskDeleted> get copyWith => _$TaskDeletedCopyWithImpl<TaskDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDeleted&&(identical(other.taskId, taskId) || other.taskId == taskId));
}


@override
int get hashCode => Object.hash(runtimeType,taskId);

@override
String toString() {
  return 'TaskState.taskDeleted(taskId: $taskId)';
}


}

/// @nodoc
abstract mixin class $TaskDeletedCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory $TaskDeletedCopyWith(TaskDeleted value, $Res Function(TaskDeleted) _then) = _$TaskDeletedCopyWithImpl;
@useResult
$Res call({
 String taskId
});




}
/// @nodoc
class _$TaskDeletedCopyWithImpl<$Res>
    implements $TaskDeletedCopyWith<$Res> {
  _$TaskDeletedCopyWithImpl(this._self, this._then);

  final TaskDeleted _self;
  final $Res Function(TaskDeleted) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskId = null,}) {
  return _then(TaskDeleted(
null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TaskError implements TaskState {
  const TaskError(this.failure);
  

 final  TaskFailure failure;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskErrorCopyWith<TaskError> get copyWith => _$TaskErrorCopyWithImpl<TaskError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'TaskState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $TaskErrorCopyWith<$Res> implements $TaskStateCopyWith<$Res> {
  factory $TaskErrorCopyWith(TaskError value, $Res Function(TaskError) _then) = _$TaskErrorCopyWithImpl;
@useResult
$Res call({
 TaskFailure failure
});


$TaskFailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$TaskErrorCopyWithImpl<$Res>
    implements $TaskErrorCopyWith<$Res> {
  _$TaskErrorCopyWithImpl(this._self, this._then);

  final TaskError _self;
  final $Res Function(TaskError) _then;

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(TaskError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as TaskFailure,
  ));
}

/// Create a copy of TaskState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskFailureCopyWith<$Res> get failure {
  
  return $TaskFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
