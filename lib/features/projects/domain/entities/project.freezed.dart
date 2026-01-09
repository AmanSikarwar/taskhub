// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Project {

 String get id; String get ownerId; String get title; String? get description; DateTime? get dueDate; String get colorCode; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectCopyWith<Project> get copyWith => _$ProjectCopyWithImpl<Project>(this as Project, _$identity);

  /// Serializes this Project to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Project&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.colorCode, colorCode) || other.colorCode == colorCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,title,description,dueDate,colorCode,createdAt,updatedAt);

@override
String toString() {
  return 'Project(id: $id, ownerId: $ownerId, title: $title, description: $description, dueDate: $dueDate, colorCode: $colorCode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProjectCopyWith<$Res>  {
  factory $ProjectCopyWith(Project value, $Res Function(Project) _then) = _$ProjectCopyWithImpl;
@useResult
$Res call({
 String id, String ownerId, String title, String? description, DateTime? dueDate, String colorCode, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ProjectCopyWithImpl<$Res>
    implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._self, this._then);

  final Project _self;
  final $Res Function(Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ownerId = null,Object? title = null,Object? description = freezed,Object? dueDate = freezed,Object? colorCode = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,colorCode: null == colorCode ? _self.colorCode : colorCode // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Project].
extension ProjectPatterns on Project {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Project value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Project() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Project value)  $default,){
final _that = this;
switch (_that) {
case _Project():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Project value)?  $default,){
final _that = this;
switch (_that) {
case _Project() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ownerId,  String title,  String? description,  DateTime? dueDate,  String colorCode,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Project() when $default != null:
return $default(_that.id,_that.ownerId,_that.title,_that.description,_that.dueDate,_that.colorCode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ownerId,  String title,  String? description,  DateTime? dueDate,  String colorCode,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Project():
return $default(_that.id,_that.ownerId,_that.title,_that.description,_that.dueDate,_that.colorCode,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ownerId,  String title,  String? description,  DateTime? dueDate,  String colorCode,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Project() when $default != null:
return $default(_that.id,_that.ownerId,_that.title,_that.description,_that.dueDate,_that.colorCode,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Project implements Project {
  const _Project({required this.id, required this.ownerId, required this.title, this.description, this.dueDate, required this.colorCode, required this.createdAt, required this.updatedAt});
  factory _Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

@override final  String id;
@override final  String ownerId;
@override final  String title;
@override final  String? description;
@override final  DateTime? dueDate;
@override final  String colorCode;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectCopyWith<_Project> get copyWith => __$ProjectCopyWithImpl<_Project>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Project&&(identical(other.id, id) || other.id == id)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.colorCode, colorCode) || other.colorCode == colorCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ownerId,title,description,dueDate,colorCode,createdAt,updatedAt);

@override
String toString() {
  return 'Project(id: $id, ownerId: $ownerId, title: $title, description: $description, dueDate: $dueDate, colorCode: $colorCode, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) _then) = __$ProjectCopyWithImpl;
@override @useResult
$Res call({
 String id, String ownerId, String title, String? description, DateTime? dueDate, String colorCode, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(this._self, this._then);

  final _Project _self;
  final $Res Function(_Project) _then;

/// Create a copy of Project
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ownerId = null,Object? title = null,Object? description = freezed,Object? dueDate = freezed,Object? colorCode = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Project(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,colorCode: null == colorCode ? _self.colorCode : colorCode // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ProjectWithRole {

 Project get project; ProjectRole get role; int get taskCount; int get completedTaskCount;
/// Create a copy of ProjectWithRole
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectWithRoleCopyWith<ProjectWithRole> get copyWith => _$ProjectWithRoleCopyWithImpl<ProjectWithRole>(this as ProjectWithRole, _$identity);

  /// Serializes this ProjectWithRole to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectWithRole&&(identical(other.project, project) || other.project == project)&&(identical(other.role, role) || other.role == role)&&(identical(other.taskCount, taskCount) || other.taskCount == taskCount)&&(identical(other.completedTaskCount, completedTaskCount) || other.completedTaskCount == completedTaskCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,project,role,taskCount,completedTaskCount);

@override
String toString() {
  return 'ProjectWithRole(project: $project, role: $role, taskCount: $taskCount, completedTaskCount: $completedTaskCount)';
}


}

/// @nodoc
abstract mixin class $ProjectWithRoleCopyWith<$Res>  {
  factory $ProjectWithRoleCopyWith(ProjectWithRole value, $Res Function(ProjectWithRole) _then) = _$ProjectWithRoleCopyWithImpl;
@useResult
$Res call({
 Project project, ProjectRole role, int taskCount, int completedTaskCount
});


$ProjectCopyWith<$Res> get project;

}
/// @nodoc
class _$ProjectWithRoleCopyWithImpl<$Res>
    implements $ProjectWithRoleCopyWith<$Res> {
  _$ProjectWithRoleCopyWithImpl(this._self, this._then);

  final ProjectWithRole _self;
  final $Res Function(ProjectWithRole) _then;

/// Create a copy of ProjectWithRole
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? project = null,Object? role = null,Object? taskCount = null,Object? completedTaskCount = null,}) {
  return _then(_self.copyWith(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ProjectRole,taskCount: null == taskCount ? _self.taskCount : taskCount // ignore: cast_nullable_to_non_nullable
as int,completedTaskCount: null == completedTaskCount ? _self.completedTaskCount : completedTaskCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ProjectWithRole
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res> get project {
  
  return $ProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectWithRole].
extension ProjectWithRolePatterns on ProjectWithRole {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectWithRole value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectWithRole() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectWithRole value)  $default,){
final _that = this;
switch (_that) {
case _ProjectWithRole():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectWithRole value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectWithRole() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Project project,  ProjectRole role,  int taskCount,  int completedTaskCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectWithRole() when $default != null:
return $default(_that.project,_that.role,_that.taskCount,_that.completedTaskCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Project project,  ProjectRole role,  int taskCount,  int completedTaskCount)  $default,) {final _that = this;
switch (_that) {
case _ProjectWithRole():
return $default(_that.project,_that.role,_that.taskCount,_that.completedTaskCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Project project,  ProjectRole role,  int taskCount,  int completedTaskCount)?  $default,) {final _that = this;
switch (_that) {
case _ProjectWithRole() when $default != null:
return $default(_that.project,_that.role,_that.taskCount,_that.completedTaskCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectWithRole implements ProjectWithRole {
  const _ProjectWithRole({required this.project, required this.role, required this.taskCount, required this.completedTaskCount});
  factory _ProjectWithRole.fromJson(Map<String, dynamic> json) => _$ProjectWithRoleFromJson(json);

@override final  Project project;
@override final  ProjectRole role;
@override final  int taskCount;
@override final  int completedTaskCount;

/// Create a copy of ProjectWithRole
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectWithRoleCopyWith<_ProjectWithRole> get copyWith => __$ProjectWithRoleCopyWithImpl<_ProjectWithRole>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectWithRoleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectWithRole&&(identical(other.project, project) || other.project == project)&&(identical(other.role, role) || other.role == role)&&(identical(other.taskCount, taskCount) || other.taskCount == taskCount)&&(identical(other.completedTaskCount, completedTaskCount) || other.completedTaskCount == completedTaskCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,project,role,taskCount,completedTaskCount);

@override
String toString() {
  return 'ProjectWithRole(project: $project, role: $role, taskCount: $taskCount, completedTaskCount: $completedTaskCount)';
}


}

/// @nodoc
abstract mixin class _$ProjectWithRoleCopyWith<$Res> implements $ProjectWithRoleCopyWith<$Res> {
  factory _$ProjectWithRoleCopyWith(_ProjectWithRole value, $Res Function(_ProjectWithRole) _then) = __$ProjectWithRoleCopyWithImpl;
@override @useResult
$Res call({
 Project project, ProjectRole role, int taskCount, int completedTaskCount
});


@override $ProjectCopyWith<$Res> get project;

}
/// @nodoc
class __$ProjectWithRoleCopyWithImpl<$Res>
    implements _$ProjectWithRoleCopyWith<$Res> {
  __$ProjectWithRoleCopyWithImpl(this._self, this._then);

  final _ProjectWithRole _self;
  final $Res Function(_ProjectWithRole) _then;

/// Create a copy of ProjectWithRole
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? project = null,Object? role = null,Object? taskCount = null,Object? completedTaskCount = null,}) {
  return _then(_ProjectWithRole(
project: null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ProjectRole,taskCount: null == taskCount ? _self.taskCount : taskCount // ignore: cast_nullable_to_non_nullable
as int,completedTaskCount: null == completedTaskCount ? _self.completedTaskCount : completedTaskCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ProjectWithRole
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res> get project {
  
  return $ProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

// dart format on
