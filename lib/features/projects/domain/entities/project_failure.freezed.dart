// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFailure()';
}


}

/// @nodoc
class $ProjectFailureCopyWith<$Res>  {
$ProjectFailureCopyWith(ProjectFailure _, $Res Function(ProjectFailure) __);
}


/// Adds pattern-matching-related methods to [ProjectFailure].
extension ProjectFailurePatterns on ProjectFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectServerError value)?  serverError,TResult Function( ProjectNetworkError value)?  networkError,TResult Function( ProjectNotFound value)?  notFound,TResult Function( ProjectUnauthorized value)?  unauthorized,TResult Function( ProjectForbidden value)?  forbidden,TResult Function( ProjectInvalidTitle value)?  invalidTitle,TResult Function( ProjectInvalidColorCode value)?  invalidColorCode,TResult Function( ProjectMemberAlreadyExists value)?  memberAlreadyExists,TResult Function( ProjectMemberNotFound value)?  memberNotFound,TResult Function( ProjectCannotRemoveOwner value)?  cannotRemoveOwner,TResult Function( ProjectUnknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectServerError() when serverError != null:
return serverError(_that);case ProjectNetworkError() when networkError != null:
return networkError(_that);case ProjectNotFound() when notFound != null:
return notFound(_that);case ProjectUnauthorized() when unauthorized != null:
return unauthorized(_that);case ProjectForbidden() when forbidden != null:
return forbidden(_that);case ProjectInvalidTitle() when invalidTitle != null:
return invalidTitle(_that);case ProjectInvalidColorCode() when invalidColorCode != null:
return invalidColorCode(_that);case ProjectMemberAlreadyExists() when memberAlreadyExists != null:
return memberAlreadyExists(_that);case ProjectMemberNotFound() when memberNotFound != null:
return memberNotFound(_that);case ProjectCannotRemoveOwner() when cannotRemoveOwner != null:
return cannotRemoveOwner(_that);case ProjectUnknown() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectServerError value)  serverError,required TResult Function( ProjectNetworkError value)  networkError,required TResult Function( ProjectNotFound value)  notFound,required TResult Function( ProjectUnauthorized value)  unauthorized,required TResult Function( ProjectForbidden value)  forbidden,required TResult Function( ProjectInvalidTitle value)  invalidTitle,required TResult Function( ProjectInvalidColorCode value)  invalidColorCode,required TResult Function( ProjectMemberAlreadyExists value)  memberAlreadyExists,required TResult Function( ProjectMemberNotFound value)  memberNotFound,required TResult Function( ProjectCannotRemoveOwner value)  cannotRemoveOwner,required TResult Function( ProjectUnknown value)  unknown,}){
final _that = this;
switch (_that) {
case ProjectServerError():
return serverError(_that);case ProjectNetworkError():
return networkError(_that);case ProjectNotFound():
return notFound(_that);case ProjectUnauthorized():
return unauthorized(_that);case ProjectForbidden():
return forbidden(_that);case ProjectInvalidTitle():
return invalidTitle(_that);case ProjectInvalidColorCode():
return invalidColorCode(_that);case ProjectMemberAlreadyExists():
return memberAlreadyExists(_that);case ProjectMemberNotFound():
return memberNotFound(_that);case ProjectCannotRemoveOwner():
return cannotRemoveOwner(_that);case ProjectUnknown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectServerError value)?  serverError,TResult? Function( ProjectNetworkError value)?  networkError,TResult? Function( ProjectNotFound value)?  notFound,TResult? Function( ProjectUnauthorized value)?  unauthorized,TResult? Function( ProjectForbidden value)?  forbidden,TResult? Function( ProjectInvalidTitle value)?  invalidTitle,TResult? Function( ProjectInvalidColorCode value)?  invalidColorCode,TResult? Function( ProjectMemberAlreadyExists value)?  memberAlreadyExists,TResult? Function( ProjectMemberNotFound value)?  memberNotFound,TResult? Function( ProjectCannotRemoveOwner value)?  cannotRemoveOwner,TResult? Function( ProjectUnknown value)?  unknown,}){
final _that = this;
switch (_that) {
case ProjectServerError() when serverError != null:
return serverError(_that);case ProjectNetworkError() when networkError != null:
return networkError(_that);case ProjectNotFound() when notFound != null:
return notFound(_that);case ProjectUnauthorized() when unauthorized != null:
return unauthorized(_that);case ProjectForbidden() when forbidden != null:
return forbidden(_that);case ProjectInvalidTitle() when invalidTitle != null:
return invalidTitle(_that);case ProjectInvalidColorCode() when invalidColorCode != null:
return invalidColorCode(_that);case ProjectMemberAlreadyExists() when memberAlreadyExists != null:
return memberAlreadyExists(_that);case ProjectMemberNotFound() when memberNotFound != null:
return memberNotFound(_that);case ProjectCannotRemoveOwner() when cannotRemoveOwner != null:
return cannotRemoveOwner(_that);case ProjectUnknown() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  serverError,TResult Function()?  networkError,TResult Function()?  notFound,TResult Function()?  unauthorized,TResult Function()?  forbidden,TResult Function()?  invalidTitle,TResult Function()?  invalidColorCode,TResult Function()?  memberAlreadyExists,TResult Function()?  memberNotFound,TResult Function()?  cannotRemoveOwner,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectServerError() when serverError != null:
return serverError(_that.message);case ProjectNetworkError() when networkError != null:
return networkError();case ProjectNotFound() when notFound != null:
return notFound();case ProjectUnauthorized() when unauthorized != null:
return unauthorized();case ProjectForbidden() when forbidden != null:
return forbidden();case ProjectInvalidTitle() when invalidTitle != null:
return invalidTitle();case ProjectInvalidColorCode() when invalidColorCode != null:
return invalidColorCode();case ProjectMemberAlreadyExists() when memberAlreadyExists != null:
return memberAlreadyExists();case ProjectMemberNotFound() when memberNotFound != null:
return memberNotFound();case ProjectCannotRemoveOwner() when cannotRemoveOwner != null:
return cannotRemoveOwner();case ProjectUnknown() when unknown != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  serverError,required TResult Function()  networkError,required TResult Function()  notFound,required TResult Function()  unauthorized,required TResult Function()  forbidden,required TResult Function()  invalidTitle,required TResult Function()  invalidColorCode,required TResult Function()  memberAlreadyExists,required TResult Function()  memberNotFound,required TResult Function()  cannotRemoveOwner,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case ProjectServerError():
return serverError(_that.message);case ProjectNetworkError():
return networkError();case ProjectNotFound():
return notFound();case ProjectUnauthorized():
return unauthorized();case ProjectForbidden():
return forbidden();case ProjectInvalidTitle():
return invalidTitle();case ProjectInvalidColorCode():
return invalidColorCode();case ProjectMemberAlreadyExists():
return memberAlreadyExists();case ProjectMemberNotFound():
return memberNotFound();case ProjectCannotRemoveOwner():
return cannotRemoveOwner();case ProjectUnknown():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  serverError,TResult? Function()?  networkError,TResult? Function()?  notFound,TResult? Function()?  unauthorized,TResult? Function()?  forbidden,TResult? Function()?  invalidTitle,TResult? Function()?  invalidColorCode,TResult? Function()?  memberAlreadyExists,TResult? Function()?  memberNotFound,TResult? Function()?  cannotRemoveOwner,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case ProjectServerError() when serverError != null:
return serverError(_that.message);case ProjectNetworkError() when networkError != null:
return networkError();case ProjectNotFound() when notFound != null:
return notFound();case ProjectUnauthorized() when unauthorized != null:
return unauthorized();case ProjectForbidden() when forbidden != null:
return forbidden();case ProjectInvalidTitle() when invalidTitle != null:
return invalidTitle();case ProjectInvalidColorCode() when invalidColorCode != null:
return invalidColorCode();case ProjectMemberAlreadyExists() when memberAlreadyExists != null:
return memberAlreadyExists();case ProjectMemberNotFound() when memberNotFound != null:
return memberNotFound();case ProjectCannotRemoveOwner() when cannotRemoveOwner != null:
return cannotRemoveOwner();case ProjectUnknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ProjectServerError implements ProjectFailure {
  const ProjectServerError(this.message);
  

 final  String message;

/// Create a copy of ProjectFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectServerErrorCopyWith<ProjectServerError> get copyWith => _$ProjectServerErrorCopyWithImpl<ProjectServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProjectFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProjectServerErrorCopyWith<$Res> implements $ProjectFailureCopyWith<$Res> {
  factory $ProjectServerErrorCopyWith(ProjectServerError value, $Res Function(ProjectServerError) _then) = _$ProjectServerErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProjectServerErrorCopyWithImpl<$Res>
    implements $ProjectServerErrorCopyWith<$Res> {
  _$ProjectServerErrorCopyWithImpl(this._self, this._then);

  final ProjectServerError _self;
  final $Res Function(ProjectServerError) _then;

/// Create a copy of ProjectFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProjectServerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProjectNetworkError implements ProjectFailure {
  const ProjectNetworkError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectNetworkError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFailure.networkError()';
}


}




/// @nodoc


class ProjectNotFound implements ProjectFailure {
  const ProjectNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFailure.notFound()';
}


}




/// @nodoc


class ProjectUnauthorized implements ProjectFailure {
  const ProjectUnauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectUnauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFailure.unauthorized()';
}


}




/// @nodoc


class ProjectForbidden implements ProjectFailure {
  const ProjectForbidden();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectForbidden);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFailure.forbidden()';
}


}




/// @nodoc


class ProjectInvalidTitle implements ProjectFailure {
  const ProjectInvalidTitle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectInvalidTitle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFailure.invalidTitle()';
}


}




/// @nodoc


class ProjectInvalidColorCode implements ProjectFailure {
  const ProjectInvalidColorCode();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectInvalidColorCode);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFailure.invalidColorCode()';
}


}




/// @nodoc


class ProjectMemberAlreadyExists implements ProjectFailure {
  const ProjectMemberAlreadyExists();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectMemberAlreadyExists);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFailure.memberAlreadyExists()';
}


}




/// @nodoc


class ProjectMemberNotFound implements ProjectFailure {
  const ProjectMemberNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectMemberNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFailure.memberNotFound()';
}


}




/// @nodoc


class ProjectCannotRemoveOwner implements ProjectFailure {
  const ProjectCannotRemoveOwner();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectCannotRemoveOwner);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectFailure.cannotRemoveOwner()';
}


}




/// @nodoc


class ProjectUnknown implements ProjectFailure {
  const ProjectUnknown(this.message);
  

 final  String message;

/// Create a copy of ProjectFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectUnknownCopyWith<ProjectUnknown> get copyWith => _$ProjectUnknownCopyWithImpl<ProjectUnknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectUnknown&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ProjectFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class $ProjectUnknownCopyWith<$Res> implements $ProjectFailureCopyWith<$Res> {
  factory $ProjectUnknownCopyWith(ProjectUnknown value, $Res Function(ProjectUnknown) _then) = _$ProjectUnknownCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ProjectUnknownCopyWithImpl<$Res>
    implements $ProjectUnknownCopyWith<$Res> {
  _$ProjectUnknownCopyWithImpl(this._self, this._then);

  final ProjectUnknown _self;
  final $Res Function(ProjectUnknown) _then;

/// Create a copy of ProjectFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ProjectUnknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
