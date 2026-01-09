// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFailure()';
}


}

/// @nodoc
class $TaskFailureCopyWith<$Res>  {
$TaskFailureCopyWith(TaskFailure _, $Res Function(TaskFailure) __);
}


/// Adds pattern-matching-related methods to [TaskFailure].
extension TaskFailurePatterns on TaskFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TaskServerError value)?  serverError,TResult Function( TaskNetworkError value)?  networkError,TResult Function( TaskNotFound value)?  notFound,TResult Function( TaskUnauthorized value)?  unauthorized,TResult Function( TaskForbidden value)?  forbidden,TResult Function( TaskInvalidTitle value)?  invalidTitle,TResult Function( TaskInvalidRecurrenceRule value)?  invalidRecurrenceRule,TResult Function( TaskProjectNotFound value)?  projectNotFound,TResult Function( TaskAssigneeNotFound value)?  assigneeNotFound,TResult Function( TaskUnknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TaskServerError() when serverError != null:
return serverError(_that);case TaskNetworkError() when networkError != null:
return networkError(_that);case TaskNotFound() when notFound != null:
return notFound(_that);case TaskUnauthorized() when unauthorized != null:
return unauthorized(_that);case TaskForbidden() when forbidden != null:
return forbidden(_that);case TaskInvalidTitle() when invalidTitle != null:
return invalidTitle(_that);case TaskInvalidRecurrenceRule() when invalidRecurrenceRule != null:
return invalidRecurrenceRule(_that);case TaskProjectNotFound() when projectNotFound != null:
return projectNotFound(_that);case TaskAssigneeNotFound() when assigneeNotFound != null:
return assigneeNotFound(_that);case TaskUnknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TaskServerError value)  serverError,required TResult Function( TaskNetworkError value)  networkError,required TResult Function( TaskNotFound value)  notFound,required TResult Function( TaskUnauthorized value)  unauthorized,required TResult Function( TaskForbidden value)  forbidden,required TResult Function( TaskInvalidTitle value)  invalidTitle,required TResult Function( TaskInvalidRecurrenceRule value)  invalidRecurrenceRule,required TResult Function( TaskProjectNotFound value)  projectNotFound,required TResult Function( TaskAssigneeNotFound value)  assigneeNotFound,required TResult Function( TaskUnknown value)  unknown,}){
final _that = this;
switch (_that) {
case TaskServerError():
return serverError(_that);case TaskNetworkError():
return networkError(_that);case TaskNotFound():
return notFound(_that);case TaskUnauthorized():
return unauthorized(_that);case TaskForbidden():
return forbidden(_that);case TaskInvalidTitle():
return invalidTitle(_that);case TaskInvalidRecurrenceRule():
return invalidRecurrenceRule(_that);case TaskProjectNotFound():
return projectNotFound(_that);case TaskAssigneeNotFound():
return assigneeNotFound(_that);case TaskUnknown():
return unknown(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TaskServerError value)?  serverError,TResult? Function( TaskNetworkError value)?  networkError,TResult? Function( TaskNotFound value)?  notFound,TResult? Function( TaskUnauthorized value)?  unauthorized,TResult? Function( TaskForbidden value)?  forbidden,TResult? Function( TaskInvalidTitle value)?  invalidTitle,TResult? Function( TaskInvalidRecurrenceRule value)?  invalidRecurrenceRule,TResult? Function( TaskProjectNotFound value)?  projectNotFound,TResult? Function( TaskAssigneeNotFound value)?  assigneeNotFound,TResult? Function( TaskUnknown value)?  unknown,}){
final _that = this;
switch (_that) {
case TaskServerError() when serverError != null:
return serverError(_that);case TaskNetworkError() when networkError != null:
return networkError(_that);case TaskNotFound() when notFound != null:
return notFound(_that);case TaskUnauthorized() when unauthorized != null:
return unauthorized(_that);case TaskForbidden() when forbidden != null:
return forbidden(_that);case TaskInvalidTitle() when invalidTitle != null:
return invalidTitle(_that);case TaskInvalidRecurrenceRule() when invalidRecurrenceRule != null:
return invalidRecurrenceRule(_that);case TaskProjectNotFound() when projectNotFound != null:
return projectNotFound(_that);case TaskAssigneeNotFound() when assigneeNotFound != null:
return assigneeNotFound(_that);case TaskUnknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  serverError,TResult Function()?  networkError,TResult Function()?  notFound,TResult Function()?  unauthorized,TResult Function()?  forbidden,TResult Function()?  invalidTitle,TResult Function()?  invalidRecurrenceRule,TResult Function()?  projectNotFound,TResult Function()?  assigneeNotFound,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TaskServerError() when serverError != null:
return serverError(_that.message);case TaskNetworkError() when networkError != null:
return networkError();case TaskNotFound() when notFound != null:
return notFound();case TaskUnauthorized() when unauthorized != null:
return unauthorized();case TaskForbidden() when forbidden != null:
return forbidden();case TaskInvalidTitle() when invalidTitle != null:
return invalidTitle();case TaskInvalidRecurrenceRule() when invalidRecurrenceRule != null:
return invalidRecurrenceRule();case TaskProjectNotFound() when projectNotFound != null:
return projectNotFound();case TaskAssigneeNotFound() when assigneeNotFound != null:
return assigneeNotFound();case TaskUnknown() when unknown != null:
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  serverError,required TResult Function()  networkError,required TResult Function()  notFound,required TResult Function()  unauthorized,required TResult Function()  forbidden,required TResult Function()  invalidTitle,required TResult Function()  invalidRecurrenceRule,required TResult Function()  projectNotFound,required TResult Function()  assigneeNotFound,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case TaskServerError():
return serverError(_that.message);case TaskNetworkError():
return networkError();case TaskNotFound():
return notFound();case TaskUnauthorized():
return unauthorized();case TaskForbidden():
return forbidden();case TaskInvalidTitle():
return invalidTitle();case TaskInvalidRecurrenceRule():
return invalidRecurrenceRule();case TaskProjectNotFound():
return projectNotFound();case TaskAssigneeNotFound():
return assigneeNotFound();case TaskUnknown():
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  serverError,TResult? Function()?  networkError,TResult? Function()?  notFound,TResult? Function()?  unauthorized,TResult? Function()?  forbidden,TResult? Function()?  invalidTitle,TResult? Function()?  invalidRecurrenceRule,TResult? Function()?  projectNotFound,TResult? Function()?  assigneeNotFound,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case TaskServerError() when serverError != null:
return serverError(_that.message);case TaskNetworkError() when networkError != null:
return networkError();case TaskNotFound() when notFound != null:
return notFound();case TaskUnauthorized() when unauthorized != null:
return unauthorized();case TaskForbidden() when forbidden != null:
return forbidden();case TaskInvalidTitle() when invalidTitle != null:
return invalidTitle();case TaskInvalidRecurrenceRule() when invalidRecurrenceRule != null:
return invalidRecurrenceRule();case TaskProjectNotFound() when projectNotFound != null:
return projectNotFound();case TaskAssigneeNotFound() when assigneeNotFound != null:
return assigneeNotFound();case TaskUnknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TaskServerError implements TaskFailure {
  const TaskServerError(this.message);
  

 final  String message;

/// Create a copy of TaskFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskServerErrorCopyWith<TaskServerError> get copyWith => _$TaskServerErrorCopyWithImpl<TaskServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TaskFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class $TaskServerErrorCopyWith<$Res> implements $TaskFailureCopyWith<$Res> {
  factory $TaskServerErrorCopyWith(TaskServerError value, $Res Function(TaskServerError) _then) = _$TaskServerErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TaskServerErrorCopyWithImpl<$Res>
    implements $TaskServerErrorCopyWith<$Res> {
  _$TaskServerErrorCopyWithImpl(this._self, this._then);

  final TaskServerError _self;
  final $Res Function(TaskServerError) _then;

/// Create a copy of TaskFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TaskServerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TaskNetworkError implements TaskFailure {
  const TaskNetworkError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskNetworkError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFailure.networkError()';
}


}




/// @nodoc


class TaskNotFound implements TaskFailure {
  const TaskNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFailure.notFound()';
}


}




/// @nodoc


class TaskUnauthorized implements TaskFailure {
  const TaskUnauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskUnauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFailure.unauthorized()';
}


}




/// @nodoc


class TaskForbidden implements TaskFailure {
  const TaskForbidden();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskForbidden);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFailure.forbidden()';
}


}




/// @nodoc


class TaskInvalidTitle implements TaskFailure {
  const TaskInvalidTitle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskInvalidTitle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFailure.invalidTitle()';
}


}




/// @nodoc


class TaskInvalidRecurrenceRule implements TaskFailure {
  const TaskInvalidRecurrenceRule();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskInvalidRecurrenceRule);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFailure.invalidRecurrenceRule()';
}


}




/// @nodoc


class TaskProjectNotFound implements TaskFailure {
  const TaskProjectNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskProjectNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFailure.projectNotFound()';
}


}




/// @nodoc


class TaskAssigneeNotFound implements TaskFailure {
  const TaskAssigneeNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskAssigneeNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TaskFailure.assigneeNotFound()';
}


}




/// @nodoc


class TaskUnknown implements TaskFailure {
  const TaskUnknown(this.message);
  

 final  String message;

/// Create a copy of TaskFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskUnknownCopyWith<TaskUnknown> get copyWith => _$TaskUnknownCopyWithImpl<TaskUnknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskUnknown&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TaskFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class $TaskUnknownCopyWith<$Res> implements $TaskFailureCopyWith<$Res> {
  factory $TaskUnknownCopyWith(TaskUnknown value, $Res Function(TaskUnknown) _then) = _$TaskUnknownCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TaskUnknownCopyWithImpl<$Res>
    implements $TaskUnknownCopyWith<$Res> {
  _$TaskUnknownCopyWithImpl(this._self, this._then);

  final TaskUnknown _self;
  final $Res Function(TaskUnknown) _then;

/// Create a copy of TaskFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TaskUnknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
