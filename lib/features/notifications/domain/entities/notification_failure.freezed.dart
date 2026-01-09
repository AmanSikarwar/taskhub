// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationFailure()';
}


}

/// @nodoc
class $NotificationFailureCopyWith<$Res>  {
$NotificationFailureCopyWith(NotificationFailure _, $Res Function(NotificationFailure) __);
}


/// Adds pattern-matching-related methods to [NotificationFailure].
extension NotificationFailurePatterns on NotificationFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NotificationServerError value)?  serverError,TResult Function( NotificationNetworkError value)?  networkError,TResult Function( NotificationNotFound value)?  notFound,TResult Function( NotificationUnauthorized value)?  unauthorized,TResult Function( NotificationUnknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NotificationServerError() when serverError != null:
return serverError(_that);case NotificationNetworkError() when networkError != null:
return networkError(_that);case NotificationNotFound() when notFound != null:
return notFound(_that);case NotificationUnauthorized() when unauthorized != null:
return unauthorized(_that);case NotificationUnknown() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NotificationServerError value)  serverError,required TResult Function( NotificationNetworkError value)  networkError,required TResult Function( NotificationNotFound value)  notFound,required TResult Function( NotificationUnauthorized value)  unauthorized,required TResult Function( NotificationUnknown value)  unknown,}){
final _that = this;
switch (_that) {
case NotificationServerError():
return serverError(_that);case NotificationNetworkError():
return networkError(_that);case NotificationNotFound():
return notFound(_that);case NotificationUnauthorized():
return unauthorized(_that);case NotificationUnknown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NotificationServerError value)?  serverError,TResult? Function( NotificationNetworkError value)?  networkError,TResult? Function( NotificationNotFound value)?  notFound,TResult? Function( NotificationUnauthorized value)?  unauthorized,TResult? Function( NotificationUnknown value)?  unknown,}){
final _that = this;
switch (_that) {
case NotificationServerError() when serverError != null:
return serverError(_that);case NotificationNetworkError() when networkError != null:
return networkError(_that);case NotificationNotFound() when notFound != null:
return notFound(_that);case NotificationUnauthorized() when unauthorized != null:
return unauthorized(_that);case NotificationUnknown() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  serverError,TResult Function()?  networkError,TResult Function()?  notFound,TResult Function()?  unauthorized,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NotificationServerError() when serverError != null:
return serverError(_that.message);case NotificationNetworkError() when networkError != null:
return networkError();case NotificationNotFound() when notFound != null:
return notFound();case NotificationUnauthorized() when unauthorized != null:
return unauthorized();case NotificationUnknown() when unknown != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  serverError,required TResult Function()  networkError,required TResult Function()  notFound,required TResult Function()  unauthorized,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case NotificationServerError():
return serverError(_that.message);case NotificationNetworkError():
return networkError();case NotificationNotFound():
return notFound();case NotificationUnauthorized():
return unauthorized();case NotificationUnknown():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  serverError,TResult? Function()?  networkError,TResult? Function()?  notFound,TResult? Function()?  unauthorized,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case NotificationServerError() when serverError != null:
return serverError(_that.message);case NotificationNetworkError() when networkError != null:
return networkError();case NotificationNotFound() when notFound != null:
return notFound();case NotificationUnauthorized() when unauthorized != null:
return unauthorized();case NotificationUnknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class NotificationServerError implements NotificationFailure {
  const NotificationServerError(this.message);
  

 final  String message;

/// Create a copy of NotificationFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationServerErrorCopyWith<NotificationServerError> get copyWith => _$NotificationServerErrorCopyWithImpl<NotificationServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NotificationFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class $NotificationServerErrorCopyWith<$Res> implements $NotificationFailureCopyWith<$Res> {
  factory $NotificationServerErrorCopyWith(NotificationServerError value, $Res Function(NotificationServerError) _then) = _$NotificationServerErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NotificationServerErrorCopyWithImpl<$Res>
    implements $NotificationServerErrorCopyWith<$Res> {
  _$NotificationServerErrorCopyWithImpl(this._self, this._then);

  final NotificationServerError _self;
  final $Res Function(NotificationServerError) _then;

/// Create a copy of NotificationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NotificationServerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NotificationNetworkError implements NotificationFailure {
  const NotificationNetworkError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationNetworkError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationFailure.networkError()';
}


}




/// @nodoc


class NotificationNotFound implements NotificationFailure {
  const NotificationNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationFailure.notFound()';
}


}




/// @nodoc


class NotificationUnauthorized implements NotificationFailure {
  const NotificationUnauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationUnauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationFailure.unauthorized()';
}


}




/// @nodoc


class NotificationUnknown implements NotificationFailure {
  const NotificationUnknown(this.message);
  

 final  String message;

/// Create a copy of NotificationFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationUnknownCopyWith<NotificationUnknown> get copyWith => _$NotificationUnknownCopyWithImpl<NotificationUnknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationUnknown&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NotificationFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class $NotificationUnknownCopyWith<$Res> implements $NotificationFailureCopyWith<$Res> {
  factory $NotificationUnknownCopyWith(NotificationUnknown value, $Res Function(NotificationUnknown) _then) = _$NotificationUnknownCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NotificationUnknownCopyWithImpl<$Res>
    implements $NotificationUnknownCopyWith<$Res> {
  _$NotificationUnknownCopyWithImpl(this._self, this._then);

  final NotificationUnknown _self;
  final $Res Function(NotificationUnknown) _then;

/// Create a copy of NotificationFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NotificationUnknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
