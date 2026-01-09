// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarFailure()';
}


}

/// @nodoc
class $CalendarFailureCopyWith<$Res>  {
$CalendarFailureCopyWith(CalendarFailure _, $Res Function(CalendarFailure) __);
}


/// Adds pattern-matching-related methods to [CalendarFailure].
extension CalendarFailurePatterns on CalendarFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CalendarServerError value)?  serverError,TResult Function( CalendarNetworkError value)?  networkError,TResult Function( CalendarUnauthorized value)?  unauthorized,TResult Function( CalendarUnknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CalendarServerError() when serverError != null:
return serverError(_that);case CalendarNetworkError() when networkError != null:
return networkError(_that);case CalendarUnauthorized() when unauthorized != null:
return unauthorized(_that);case CalendarUnknown() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CalendarServerError value)  serverError,required TResult Function( CalendarNetworkError value)  networkError,required TResult Function( CalendarUnauthorized value)  unauthorized,required TResult Function( CalendarUnknown value)  unknown,}){
final _that = this;
switch (_that) {
case CalendarServerError():
return serverError(_that);case CalendarNetworkError():
return networkError(_that);case CalendarUnauthorized():
return unauthorized(_that);case CalendarUnknown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CalendarServerError value)?  serverError,TResult? Function( CalendarNetworkError value)?  networkError,TResult? Function( CalendarUnauthorized value)?  unauthorized,TResult? Function( CalendarUnknown value)?  unknown,}){
final _that = this;
switch (_that) {
case CalendarServerError() when serverError != null:
return serverError(_that);case CalendarNetworkError() when networkError != null:
return networkError(_that);case CalendarUnauthorized() when unauthorized != null:
return unauthorized(_that);case CalendarUnknown() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  serverError,TResult Function()?  networkError,TResult Function()?  unauthorized,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CalendarServerError() when serverError != null:
return serverError(_that.message);case CalendarNetworkError() when networkError != null:
return networkError();case CalendarUnauthorized() when unauthorized != null:
return unauthorized();case CalendarUnknown() when unknown != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  serverError,required TResult Function()  networkError,required TResult Function()  unauthorized,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case CalendarServerError():
return serverError(_that.message);case CalendarNetworkError():
return networkError();case CalendarUnauthorized():
return unauthorized();case CalendarUnknown():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  serverError,TResult? Function()?  networkError,TResult? Function()?  unauthorized,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case CalendarServerError() when serverError != null:
return serverError(_that.message);case CalendarNetworkError() when networkError != null:
return networkError();case CalendarUnauthorized() when unauthorized != null:
return unauthorized();case CalendarUnknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CalendarServerError implements CalendarFailure {
  const CalendarServerError(this.message);
  

 final  String message;

/// Create a copy of CalendarFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarServerErrorCopyWith<CalendarServerError> get copyWith => _$CalendarServerErrorCopyWithImpl<CalendarServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CalendarFailure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class $CalendarServerErrorCopyWith<$Res> implements $CalendarFailureCopyWith<$Res> {
  factory $CalendarServerErrorCopyWith(CalendarServerError value, $Res Function(CalendarServerError) _then) = _$CalendarServerErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CalendarServerErrorCopyWithImpl<$Res>
    implements $CalendarServerErrorCopyWith<$Res> {
  _$CalendarServerErrorCopyWithImpl(this._self, this._then);

  final CalendarServerError _self;
  final $Res Function(CalendarServerError) _then;

/// Create a copy of CalendarFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CalendarServerError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CalendarNetworkError implements CalendarFailure {
  const CalendarNetworkError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarNetworkError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarFailure.networkError()';
}


}




/// @nodoc


class CalendarUnauthorized implements CalendarFailure {
  const CalendarUnauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarUnauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarFailure.unauthorized()';
}


}




/// @nodoc


class CalendarUnknown implements CalendarFailure {
  const CalendarUnknown(this.message);
  

 final  String message;

/// Create a copy of CalendarFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarUnknownCopyWith<CalendarUnknown> get copyWith => _$CalendarUnknownCopyWithImpl<CalendarUnknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarUnknown&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CalendarFailure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class $CalendarUnknownCopyWith<$Res> implements $CalendarFailureCopyWith<$Res> {
  factory $CalendarUnknownCopyWith(CalendarUnknown value, $Res Function(CalendarUnknown) _then) = _$CalendarUnknownCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CalendarUnknownCopyWithImpl<$Res>
    implements $CalendarUnknownCopyWith<$Res> {
  _$CalendarUnknownCopyWithImpl(this._self, this._then);

  final CalendarUnknown _self;
  final $Res Function(CalendarUnknown) _then;

/// Create a copy of CalendarFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CalendarUnknown(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
