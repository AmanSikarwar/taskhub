// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectMember {

 String get projectId; String get userId; ProjectRole get role; DateTime get joinedAt; String? get email; String? get displayName; String? get avatarUrl;
/// Create a copy of ProjectMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectMemberCopyWith<ProjectMember> get copyWith => _$ProjectMemberCopyWithImpl<ProjectMember>(this as ProjectMember, _$identity);

  /// Serializes this ProjectMember to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectMember&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectId,userId,role,joinedAt,email,displayName,avatarUrl);

@override
String toString() {
  return 'ProjectMember(projectId: $projectId, userId: $userId, role: $role, joinedAt: $joinedAt, email: $email, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $ProjectMemberCopyWith<$Res>  {
  factory $ProjectMemberCopyWith(ProjectMember value, $Res Function(ProjectMember) _then) = _$ProjectMemberCopyWithImpl;
@useResult
$Res call({
 String projectId, String userId, ProjectRole role, DateTime joinedAt, String? email, String? displayName, String? avatarUrl
});




}
/// @nodoc
class _$ProjectMemberCopyWithImpl<$Res>
    implements $ProjectMemberCopyWith<$Res> {
  _$ProjectMemberCopyWithImpl(this._self, this._then);

  final ProjectMember _self;
  final $Res Function(ProjectMember) _then;

/// Create a copy of ProjectMember
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectId = null,Object? userId = null,Object? role = null,Object? joinedAt = null,Object? email = freezed,Object? displayName = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ProjectRole,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectMember].
extension ProjectMemberPatterns on ProjectMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectMember() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectMember value)  $default,){
final _that = this;
switch (_that) {
case _ProjectMember():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectMember value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectMember() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String projectId,  String userId,  ProjectRole role,  DateTime joinedAt,  String? email,  String? displayName,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectMember() when $default != null:
return $default(_that.projectId,_that.userId,_that.role,_that.joinedAt,_that.email,_that.displayName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String projectId,  String userId,  ProjectRole role,  DateTime joinedAt,  String? email,  String? displayName,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _ProjectMember():
return $default(_that.projectId,_that.userId,_that.role,_that.joinedAt,_that.email,_that.displayName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String projectId,  String userId,  ProjectRole role,  DateTime joinedAt,  String? email,  String? displayName,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _ProjectMember() when $default != null:
return $default(_that.projectId,_that.userId,_that.role,_that.joinedAt,_that.email,_that.displayName,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectMember implements ProjectMember {
  const _ProjectMember({required this.projectId, required this.userId, required this.role, required this.joinedAt, this.email, this.displayName, this.avatarUrl});
  factory _ProjectMember.fromJson(Map<String, dynamic> json) => _$ProjectMemberFromJson(json);

@override final  String projectId;
@override final  String userId;
@override final  ProjectRole role;
@override final  DateTime joinedAt;
@override final  String? email;
@override final  String? displayName;
@override final  String? avatarUrl;

/// Create a copy of ProjectMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectMemberCopyWith<_ProjectMember> get copyWith => __$ProjectMemberCopyWithImpl<_ProjectMember>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectMemberToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectMember&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,projectId,userId,role,joinedAt,email,displayName,avatarUrl);

@override
String toString() {
  return 'ProjectMember(projectId: $projectId, userId: $userId, role: $role, joinedAt: $joinedAt, email: $email, displayName: $displayName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ProjectMemberCopyWith<$Res> implements $ProjectMemberCopyWith<$Res> {
  factory _$ProjectMemberCopyWith(_ProjectMember value, $Res Function(_ProjectMember) _then) = __$ProjectMemberCopyWithImpl;
@override @useResult
$Res call({
 String projectId, String userId, ProjectRole role, DateTime joinedAt, String? email, String? displayName, String? avatarUrl
});




}
/// @nodoc
class __$ProjectMemberCopyWithImpl<$Res>
    implements _$ProjectMemberCopyWith<$Res> {
  __$ProjectMemberCopyWithImpl(this._self, this._then);

  final _ProjectMember _self;
  final $Res Function(_ProjectMember) _then;

/// Create a copy of ProjectMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? userId = null,Object? role = null,Object? joinedAt = null,Object? email = freezed,Object? displayName = freezed,Object? avatarUrl = freezed,}) {
  return _then(_ProjectMember(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ProjectRole,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
