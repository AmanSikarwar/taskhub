// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvent()';
}


}

/// @nodoc
class $ProjectEventCopyWith<$Res>  {
$ProjectEventCopyWith(ProjectEvent _, $Res Function(ProjectEvent) __);
}


/// Adds pattern-matching-related methods to [ProjectEvent].
extension ProjectEventPatterns on ProjectEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadProjects value)?  loadProjects,TResult Function( LoadProject value)?  loadProject,TResult Function( LoadProjectMembers value)?  loadProjectMembers,TResult Function( CreateProject value)?  createProject,TResult Function( UpdateProject value)?  updateProject,TResult Function( DeleteProject value)?  deleteProject,TResult Function( AddMember value)?  addMember,TResult Function( UpdateMemberRole value)?  updateMemberRole,TResult Function( RemoveMember value)?  removeMember,TResult Function( LeaveProject value)?  leaveProject,TResult Function( WatchProjects value)?  watchProjects,TResult Function( ProjectsUpdated value)?  projectsUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadProjects() when loadProjects != null:
return loadProjects(_that);case LoadProject() when loadProject != null:
return loadProject(_that);case LoadProjectMembers() when loadProjectMembers != null:
return loadProjectMembers(_that);case CreateProject() when createProject != null:
return createProject(_that);case UpdateProject() when updateProject != null:
return updateProject(_that);case DeleteProject() when deleteProject != null:
return deleteProject(_that);case AddMember() when addMember != null:
return addMember(_that);case UpdateMemberRole() when updateMemberRole != null:
return updateMemberRole(_that);case RemoveMember() when removeMember != null:
return removeMember(_that);case LeaveProject() when leaveProject != null:
return leaveProject(_that);case WatchProjects() when watchProjects != null:
return watchProjects(_that);case ProjectsUpdated() when projectsUpdated != null:
return projectsUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadProjects value)  loadProjects,required TResult Function( LoadProject value)  loadProject,required TResult Function( LoadProjectMembers value)  loadProjectMembers,required TResult Function( CreateProject value)  createProject,required TResult Function( UpdateProject value)  updateProject,required TResult Function( DeleteProject value)  deleteProject,required TResult Function( AddMember value)  addMember,required TResult Function( UpdateMemberRole value)  updateMemberRole,required TResult Function( RemoveMember value)  removeMember,required TResult Function( LeaveProject value)  leaveProject,required TResult Function( WatchProjects value)  watchProjects,required TResult Function( ProjectsUpdated value)  projectsUpdated,}){
final _that = this;
switch (_that) {
case LoadProjects():
return loadProjects(_that);case LoadProject():
return loadProject(_that);case LoadProjectMembers():
return loadProjectMembers(_that);case CreateProject():
return createProject(_that);case UpdateProject():
return updateProject(_that);case DeleteProject():
return deleteProject(_that);case AddMember():
return addMember(_that);case UpdateMemberRole():
return updateMemberRole(_that);case RemoveMember():
return removeMember(_that);case LeaveProject():
return leaveProject(_that);case WatchProjects():
return watchProjects(_that);case ProjectsUpdated():
return projectsUpdated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadProjects value)?  loadProjects,TResult? Function( LoadProject value)?  loadProject,TResult? Function( LoadProjectMembers value)?  loadProjectMembers,TResult? Function( CreateProject value)?  createProject,TResult? Function( UpdateProject value)?  updateProject,TResult? Function( DeleteProject value)?  deleteProject,TResult? Function( AddMember value)?  addMember,TResult? Function( UpdateMemberRole value)?  updateMemberRole,TResult? Function( RemoveMember value)?  removeMember,TResult? Function( LeaveProject value)?  leaveProject,TResult? Function( WatchProjects value)?  watchProjects,TResult? Function( ProjectsUpdated value)?  projectsUpdated,}){
final _that = this;
switch (_that) {
case LoadProjects() when loadProjects != null:
return loadProjects(_that);case LoadProject() when loadProject != null:
return loadProject(_that);case LoadProjectMembers() when loadProjectMembers != null:
return loadProjectMembers(_that);case CreateProject() when createProject != null:
return createProject(_that);case UpdateProject() when updateProject != null:
return updateProject(_that);case DeleteProject() when deleteProject != null:
return deleteProject(_that);case AddMember() when addMember != null:
return addMember(_that);case UpdateMemberRole() when updateMemberRole != null:
return updateMemberRole(_that);case RemoveMember() when removeMember != null:
return removeMember(_that);case LeaveProject() when leaveProject != null:
return leaveProject(_that);case WatchProjects() when watchProjects != null:
return watchProjects(_that);case ProjectsUpdated() when projectsUpdated != null:
return projectsUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadProjects,TResult Function( String projectId)?  loadProject,TResult Function( String projectId)?  loadProjectMembers,TResult Function( String title,  String? description,  DateTime? dueDate,  String? colorCode)?  createProject,TResult Function( String projectId,  String? title,  String? description,  DateTime? dueDate,  String? colorCode)?  updateProject,TResult Function( String projectId)?  deleteProject,TResult Function( String projectId,  String userId,  ProjectRole role)?  addMember,TResult Function( String projectId,  String userId,  ProjectRole role)?  updateMemberRole,TResult Function( String projectId,  String userId)?  removeMember,TResult Function( String projectId)?  leaveProject,TResult Function()?  watchProjects,TResult Function( List<ProjectWithRole> projects)?  projectsUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadProjects() when loadProjects != null:
return loadProjects();case LoadProject() when loadProject != null:
return loadProject(_that.projectId);case LoadProjectMembers() when loadProjectMembers != null:
return loadProjectMembers(_that.projectId);case CreateProject() when createProject != null:
return createProject(_that.title,_that.description,_that.dueDate,_that.colorCode);case UpdateProject() when updateProject != null:
return updateProject(_that.projectId,_that.title,_that.description,_that.dueDate,_that.colorCode);case DeleteProject() when deleteProject != null:
return deleteProject(_that.projectId);case AddMember() when addMember != null:
return addMember(_that.projectId,_that.userId,_that.role);case UpdateMemberRole() when updateMemberRole != null:
return updateMemberRole(_that.projectId,_that.userId,_that.role);case RemoveMember() when removeMember != null:
return removeMember(_that.projectId,_that.userId);case LeaveProject() when leaveProject != null:
return leaveProject(_that.projectId);case WatchProjects() when watchProjects != null:
return watchProjects();case ProjectsUpdated() when projectsUpdated != null:
return projectsUpdated(_that.projects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadProjects,required TResult Function( String projectId)  loadProject,required TResult Function( String projectId)  loadProjectMembers,required TResult Function( String title,  String? description,  DateTime? dueDate,  String? colorCode)  createProject,required TResult Function( String projectId,  String? title,  String? description,  DateTime? dueDate,  String? colorCode)  updateProject,required TResult Function( String projectId)  deleteProject,required TResult Function( String projectId,  String userId,  ProjectRole role)  addMember,required TResult Function( String projectId,  String userId,  ProjectRole role)  updateMemberRole,required TResult Function( String projectId,  String userId)  removeMember,required TResult Function( String projectId)  leaveProject,required TResult Function()  watchProjects,required TResult Function( List<ProjectWithRole> projects)  projectsUpdated,}) {final _that = this;
switch (_that) {
case LoadProjects():
return loadProjects();case LoadProject():
return loadProject(_that.projectId);case LoadProjectMembers():
return loadProjectMembers(_that.projectId);case CreateProject():
return createProject(_that.title,_that.description,_that.dueDate,_that.colorCode);case UpdateProject():
return updateProject(_that.projectId,_that.title,_that.description,_that.dueDate,_that.colorCode);case DeleteProject():
return deleteProject(_that.projectId);case AddMember():
return addMember(_that.projectId,_that.userId,_that.role);case UpdateMemberRole():
return updateMemberRole(_that.projectId,_that.userId,_that.role);case RemoveMember():
return removeMember(_that.projectId,_that.userId);case LeaveProject():
return leaveProject(_that.projectId);case WatchProjects():
return watchProjects();case ProjectsUpdated():
return projectsUpdated(_that.projects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadProjects,TResult? Function( String projectId)?  loadProject,TResult? Function( String projectId)?  loadProjectMembers,TResult? Function( String title,  String? description,  DateTime? dueDate,  String? colorCode)?  createProject,TResult? Function( String projectId,  String? title,  String? description,  DateTime? dueDate,  String? colorCode)?  updateProject,TResult? Function( String projectId)?  deleteProject,TResult? Function( String projectId,  String userId,  ProjectRole role)?  addMember,TResult? Function( String projectId,  String userId,  ProjectRole role)?  updateMemberRole,TResult? Function( String projectId,  String userId)?  removeMember,TResult? Function( String projectId)?  leaveProject,TResult? Function()?  watchProjects,TResult? Function( List<ProjectWithRole> projects)?  projectsUpdated,}) {final _that = this;
switch (_that) {
case LoadProjects() when loadProjects != null:
return loadProjects();case LoadProject() when loadProject != null:
return loadProject(_that.projectId);case LoadProjectMembers() when loadProjectMembers != null:
return loadProjectMembers(_that.projectId);case CreateProject() when createProject != null:
return createProject(_that.title,_that.description,_that.dueDate,_that.colorCode);case UpdateProject() when updateProject != null:
return updateProject(_that.projectId,_that.title,_that.description,_that.dueDate,_that.colorCode);case DeleteProject() when deleteProject != null:
return deleteProject(_that.projectId);case AddMember() when addMember != null:
return addMember(_that.projectId,_that.userId,_that.role);case UpdateMemberRole() when updateMemberRole != null:
return updateMemberRole(_that.projectId,_that.userId,_that.role);case RemoveMember() when removeMember != null:
return removeMember(_that.projectId,_that.userId);case LeaveProject() when leaveProject != null:
return leaveProject(_that.projectId);case WatchProjects() when watchProjects != null:
return watchProjects();case ProjectsUpdated() when projectsUpdated != null:
return projectsUpdated(_that.projects);case _:
  return null;

}
}

}

/// @nodoc


class LoadProjects implements ProjectEvent {
  const LoadProjects();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProjects);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvent.loadProjects()';
}


}




/// @nodoc


class LoadProject implements ProjectEvent {
  const LoadProject(this.projectId);
  

 final  String projectId;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadProjectCopyWith<LoadProject> get copyWith => _$LoadProjectCopyWithImpl<LoadProject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProject&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'ProjectEvent.loadProject(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $LoadProjectCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $LoadProjectCopyWith(LoadProject value, $Res Function(LoadProject) _then) = _$LoadProjectCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$LoadProjectCopyWithImpl<$Res>
    implements $LoadProjectCopyWith<$Res> {
  _$LoadProjectCopyWithImpl(this._self, this._then);

  final LoadProject _self;
  final $Res Function(LoadProject) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(LoadProject(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoadProjectMembers implements ProjectEvent {
  const LoadProjectMembers(this.projectId);
  

 final  String projectId;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadProjectMembersCopyWith<LoadProjectMembers> get copyWith => _$LoadProjectMembersCopyWithImpl<LoadProjectMembers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadProjectMembers&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'ProjectEvent.loadProjectMembers(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $LoadProjectMembersCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $LoadProjectMembersCopyWith(LoadProjectMembers value, $Res Function(LoadProjectMembers) _then) = _$LoadProjectMembersCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$LoadProjectMembersCopyWithImpl<$Res>
    implements $LoadProjectMembersCopyWith<$Res> {
  _$LoadProjectMembersCopyWithImpl(this._self, this._then);

  final LoadProjectMembers _self;
  final $Res Function(LoadProjectMembers) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(LoadProjectMembers(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateProject implements ProjectEvent {
  const CreateProject({required this.title, this.description, this.dueDate, this.colorCode});
  

 final  String title;
 final  String? description;
 final  DateTime? dueDate;
 final  String? colorCode;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateProjectCopyWith<CreateProject> get copyWith => _$CreateProjectCopyWithImpl<CreateProject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateProject&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.colorCode, colorCode) || other.colorCode == colorCode));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,dueDate,colorCode);

@override
String toString() {
  return 'ProjectEvent.createProject(title: $title, description: $description, dueDate: $dueDate, colorCode: $colorCode)';
}


}

/// @nodoc
abstract mixin class $CreateProjectCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $CreateProjectCopyWith(CreateProject value, $Res Function(CreateProject) _then) = _$CreateProjectCopyWithImpl;
@useResult
$Res call({
 String title, String? description, DateTime? dueDate, String? colorCode
});




}
/// @nodoc
class _$CreateProjectCopyWithImpl<$Res>
    implements $CreateProjectCopyWith<$Res> {
  _$CreateProjectCopyWithImpl(this._self, this._then);

  final CreateProject _self;
  final $Res Function(CreateProject) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? dueDate = freezed,Object? colorCode = freezed,}) {
  return _then(CreateProject(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,colorCode: freezed == colorCode ? _self.colorCode : colorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UpdateProject implements ProjectEvent {
  const UpdateProject({required this.projectId, this.title, this.description, this.dueDate, this.colorCode});
  

 final  String projectId;
 final  String? title;
 final  String? description;
 final  DateTime? dueDate;
 final  String? colorCode;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProjectCopyWith<UpdateProject> get copyWith => _$UpdateProjectCopyWithImpl<UpdateProject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProject&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.colorCode, colorCode) || other.colorCode == colorCode));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,title,description,dueDate,colorCode);

@override
String toString() {
  return 'ProjectEvent.updateProject(projectId: $projectId, title: $title, description: $description, dueDate: $dueDate, colorCode: $colorCode)';
}


}

/// @nodoc
abstract mixin class $UpdateProjectCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $UpdateProjectCopyWith(UpdateProject value, $Res Function(UpdateProject) _then) = _$UpdateProjectCopyWithImpl;
@useResult
$Res call({
 String projectId, String? title, String? description, DateTime? dueDate, String? colorCode
});




}
/// @nodoc
class _$UpdateProjectCopyWithImpl<$Res>
    implements $UpdateProjectCopyWith<$Res> {
  _$UpdateProjectCopyWithImpl(this._self, this._then);

  final UpdateProject _self;
  final $Res Function(UpdateProject) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? title = freezed,Object? description = freezed,Object? dueDate = freezed,Object? colorCode = freezed,}) {
  return _then(UpdateProject(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,colorCode: freezed == colorCode ? _self.colorCode : colorCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DeleteProject implements ProjectEvent {
  const DeleteProject(this.projectId);
  

 final  String projectId;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteProjectCopyWith<DeleteProject> get copyWith => _$DeleteProjectCopyWithImpl<DeleteProject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteProject&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'ProjectEvent.deleteProject(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $DeleteProjectCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $DeleteProjectCopyWith(DeleteProject value, $Res Function(DeleteProject) _then) = _$DeleteProjectCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$DeleteProjectCopyWithImpl<$Res>
    implements $DeleteProjectCopyWith<$Res> {
  _$DeleteProjectCopyWithImpl(this._self, this._then);

  final DeleteProject _self;
  final $Res Function(DeleteProject) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(DeleteProject(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AddMember implements ProjectEvent {
  const AddMember({required this.projectId, required this.userId, required this.role});
  

 final  String projectId;
 final  String userId;
 final  ProjectRole role;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddMemberCopyWith<AddMember> get copyWith => _$AddMemberCopyWithImpl<AddMember>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddMember&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,userId,role);

@override
String toString() {
  return 'ProjectEvent.addMember(projectId: $projectId, userId: $userId, role: $role)';
}


}

/// @nodoc
abstract mixin class $AddMemberCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $AddMemberCopyWith(AddMember value, $Res Function(AddMember) _then) = _$AddMemberCopyWithImpl;
@useResult
$Res call({
 String projectId, String userId, ProjectRole role
});




}
/// @nodoc
class _$AddMemberCopyWithImpl<$Res>
    implements $AddMemberCopyWith<$Res> {
  _$AddMemberCopyWithImpl(this._self, this._then);

  final AddMember _self;
  final $Res Function(AddMember) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? userId = null,Object? role = null,}) {
  return _then(AddMember(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ProjectRole,
  ));
}


}

/// @nodoc


class UpdateMemberRole implements ProjectEvent {
  const UpdateMemberRole({required this.projectId, required this.userId, required this.role});
  

 final  String projectId;
 final  String userId;
 final  ProjectRole role;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateMemberRoleCopyWith<UpdateMemberRole> get copyWith => _$UpdateMemberRoleCopyWithImpl<UpdateMemberRole>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateMemberRole&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,userId,role);

@override
String toString() {
  return 'ProjectEvent.updateMemberRole(projectId: $projectId, userId: $userId, role: $role)';
}


}

/// @nodoc
abstract mixin class $UpdateMemberRoleCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $UpdateMemberRoleCopyWith(UpdateMemberRole value, $Res Function(UpdateMemberRole) _then) = _$UpdateMemberRoleCopyWithImpl;
@useResult
$Res call({
 String projectId, String userId, ProjectRole role
});




}
/// @nodoc
class _$UpdateMemberRoleCopyWithImpl<$Res>
    implements $UpdateMemberRoleCopyWith<$Res> {
  _$UpdateMemberRoleCopyWithImpl(this._self, this._then);

  final UpdateMemberRole _self;
  final $Res Function(UpdateMemberRole) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? userId = null,Object? role = null,}) {
  return _then(UpdateMemberRole(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ProjectRole,
  ));
}


}

/// @nodoc


class RemoveMember implements ProjectEvent {
  const RemoveMember({required this.projectId, required this.userId});
  

 final  String projectId;
 final  String userId;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveMemberCopyWith<RemoveMember> get copyWith => _$RemoveMemberCopyWithImpl<RemoveMember>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveMember&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,userId);

@override
String toString() {
  return 'ProjectEvent.removeMember(projectId: $projectId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $RemoveMemberCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $RemoveMemberCopyWith(RemoveMember value, $Res Function(RemoveMember) _then) = _$RemoveMemberCopyWithImpl;
@useResult
$Res call({
 String projectId, String userId
});




}
/// @nodoc
class _$RemoveMemberCopyWithImpl<$Res>
    implements $RemoveMemberCopyWith<$Res> {
  _$RemoveMemberCopyWithImpl(this._self, this._then);

  final RemoveMember _self;
  final $Res Function(RemoveMember) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? userId = null,}) {
  return _then(RemoveMember(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LeaveProject implements ProjectEvent {
  const LeaveProject(this.projectId);
  

 final  String projectId;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveProjectCopyWith<LeaveProject> get copyWith => _$LeaveProjectCopyWithImpl<LeaveProject>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveProject&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'ProjectEvent.leaveProject(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $LeaveProjectCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $LeaveProjectCopyWith(LeaveProject value, $Res Function(LeaveProject) _then) = _$LeaveProjectCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$LeaveProjectCopyWithImpl<$Res>
    implements $LeaveProjectCopyWith<$Res> {
  _$LeaveProjectCopyWithImpl(this._self, this._then);

  final LeaveProject _self;
  final $Res Function(LeaveProject) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(LeaveProject(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WatchProjects implements ProjectEvent {
  const WatchProjects();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchProjects);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectEvent.watchProjects()';
}


}




/// @nodoc


class ProjectsUpdated implements ProjectEvent {
  const ProjectsUpdated(final  List<ProjectWithRole> projects): _projects = projects;
  

 final  List<ProjectWithRole> _projects;
 List<ProjectWithRole> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsUpdatedCopyWith<ProjectsUpdated> get copyWith => _$ProjectsUpdatedCopyWithImpl<ProjectsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsUpdated&&const DeepCollectionEquality().equals(other._projects, _projects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects));

@override
String toString() {
  return 'ProjectEvent.projectsUpdated(projects: $projects)';
}


}

/// @nodoc
abstract mixin class $ProjectsUpdatedCopyWith<$Res> implements $ProjectEventCopyWith<$Res> {
  factory $ProjectsUpdatedCopyWith(ProjectsUpdated value, $Res Function(ProjectsUpdated) _then) = _$ProjectsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<ProjectWithRole> projects
});




}
/// @nodoc
class _$ProjectsUpdatedCopyWithImpl<$Res>
    implements $ProjectsUpdatedCopyWith<$Res> {
  _$ProjectsUpdatedCopyWithImpl(this._self, this._then);

  final ProjectsUpdated _self;
  final $Res Function(ProjectsUpdated) _then;

/// Create a copy of ProjectEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projects = null,}) {
  return _then(ProjectsUpdated(
null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectWithRole>,
  ));
}


}

/// @nodoc
mixin _$ProjectState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectState()';
}


}

/// @nodoc
class $ProjectStateCopyWith<$Res>  {
$ProjectStateCopyWith(ProjectState _, $Res Function(ProjectState) __);
}


/// Adds pattern-matching-related methods to [ProjectState].
extension ProjectStatePatterns on ProjectState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectInitial value)?  initial,TResult Function( ProjectLoading value)?  loading,TResult Function( ProjectsLoaded value)?  projectsLoaded,TResult Function( ProjectLoaded value)?  projectLoaded,TResult Function( MembersLoaded value)?  membersLoaded,TResult Function( ProjectCreated value)?  projectCreated,TResult Function( ProjectUpdated value)?  projectUpdated,TResult Function( ProjectDeleted value)?  projectDeleted,TResult Function( MemberAdded value)?  memberAdded,TResult Function( MemberUpdated value)?  memberUpdated,TResult Function( MemberRemoved value)?  memberRemoved,TResult Function( ProjectLeft value)?  projectLeft,TResult Function( ProjectError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectInitial() when initial != null:
return initial(_that);case ProjectLoading() when loading != null:
return loading(_that);case ProjectsLoaded() when projectsLoaded != null:
return projectsLoaded(_that);case ProjectLoaded() when projectLoaded != null:
return projectLoaded(_that);case MembersLoaded() when membersLoaded != null:
return membersLoaded(_that);case ProjectCreated() when projectCreated != null:
return projectCreated(_that);case ProjectUpdated() when projectUpdated != null:
return projectUpdated(_that);case ProjectDeleted() when projectDeleted != null:
return projectDeleted(_that);case MemberAdded() when memberAdded != null:
return memberAdded(_that);case MemberUpdated() when memberUpdated != null:
return memberUpdated(_that);case MemberRemoved() when memberRemoved != null:
return memberRemoved(_that);case ProjectLeft() when projectLeft != null:
return projectLeft(_that);case ProjectError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectInitial value)  initial,required TResult Function( ProjectLoading value)  loading,required TResult Function( ProjectsLoaded value)  projectsLoaded,required TResult Function( ProjectLoaded value)  projectLoaded,required TResult Function( MembersLoaded value)  membersLoaded,required TResult Function( ProjectCreated value)  projectCreated,required TResult Function( ProjectUpdated value)  projectUpdated,required TResult Function( ProjectDeleted value)  projectDeleted,required TResult Function( MemberAdded value)  memberAdded,required TResult Function( MemberUpdated value)  memberUpdated,required TResult Function( MemberRemoved value)  memberRemoved,required TResult Function( ProjectLeft value)  projectLeft,required TResult Function( ProjectError value)  error,}){
final _that = this;
switch (_that) {
case ProjectInitial():
return initial(_that);case ProjectLoading():
return loading(_that);case ProjectsLoaded():
return projectsLoaded(_that);case ProjectLoaded():
return projectLoaded(_that);case MembersLoaded():
return membersLoaded(_that);case ProjectCreated():
return projectCreated(_that);case ProjectUpdated():
return projectUpdated(_that);case ProjectDeleted():
return projectDeleted(_that);case MemberAdded():
return memberAdded(_that);case MemberUpdated():
return memberUpdated(_that);case MemberRemoved():
return memberRemoved(_that);case ProjectLeft():
return projectLeft(_that);case ProjectError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectInitial value)?  initial,TResult? Function( ProjectLoading value)?  loading,TResult? Function( ProjectsLoaded value)?  projectsLoaded,TResult? Function( ProjectLoaded value)?  projectLoaded,TResult? Function( MembersLoaded value)?  membersLoaded,TResult? Function( ProjectCreated value)?  projectCreated,TResult? Function( ProjectUpdated value)?  projectUpdated,TResult? Function( ProjectDeleted value)?  projectDeleted,TResult? Function( MemberAdded value)?  memberAdded,TResult? Function( MemberUpdated value)?  memberUpdated,TResult? Function( MemberRemoved value)?  memberRemoved,TResult? Function( ProjectLeft value)?  projectLeft,TResult? Function( ProjectError value)?  error,}){
final _that = this;
switch (_that) {
case ProjectInitial() when initial != null:
return initial(_that);case ProjectLoading() when loading != null:
return loading(_that);case ProjectsLoaded() when projectsLoaded != null:
return projectsLoaded(_that);case ProjectLoaded() when projectLoaded != null:
return projectLoaded(_that);case MembersLoaded() when membersLoaded != null:
return membersLoaded(_that);case ProjectCreated() when projectCreated != null:
return projectCreated(_that);case ProjectUpdated() when projectUpdated != null:
return projectUpdated(_that);case ProjectDeleted() when projectDeleted != null:
return projectDeleted(_that);case MemberAdded() when memberAdded != null:
return memberAdded(_that);case MemberUpdated() when memberUpdated != null:
return memberUpdated(_that);case MemberRemoved() when memberRemoved != null:
return memberRemoved(_that);case ProjectLeft() when projectLeft != null:
return projectLeft(_that);case ProjectError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProjectWithRole> projects)?  projectsLoaded,TResult Function( Project project)?  projectLoaded,TResult Function( List<ProjectMember> members)?  membersLoaded,TResult Function( Project project)?  projectCreated,TResult Function( Project project)?  projectUpdated,TResult Function( String projectId)?  projectDeleted,TResult Function( ProjectMember member)?  memberAdded,TResult Function( ProjectMember member)?  memberUpdated,TResult Function( String userId)?  memberRemoved,TResult Function( String projectId)?  projectLeft,TResult Function( ProjectFailure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectInitial() when initial != null:
return initial();case ProjectLoading() when loading != null:
return loading();case ProjectsLoaded() when projectsLoaded != null:
return projectsLoaded(_that.projects);case ProjectLoaded() when projectLoaded != null:
return projectLoaded(_that.project);case MembersLoaded() when membersLoaded != null:
return membersLoaded(_that.members);case ProjectCreated() when projectCreated != null:
return projectCreated(_that.project);case ProjectUpdated() when projectUpdated != null:
return projectUpdated(_that.project);case ProjectDeleted() when projectDeleted != null:
return projectDeleted(_that.projectId);case MemberAdded() when memberAdded != null:
return memberAdded(_that.member);case MemberUpdated() when memberUpdated != null:
return memberUpdated(_that.member);case MemberRemoved() when memberRemoved != null:
return memberRemoved(_that.userId);case ProjectLeft() when projectLeft != null:
return projectLeft(_that.projectId);case ProjectError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProjectWithRole> projects)  projectsLoaded,required TResult Function( Project project)  projectLoaded,required TResult Function( List<ProjectMember> members)  membersLoaded,required TResult Function( Project project)  projectCreated,required TResult Function( Project project)  projectUpdated,required TResult Function( String projectId)  projectDeleted,required TResult Function( ProjectMember member)  memberAdded,required TResult Function( ProjectMember member)  memberUpdated,required TResult Function( String userId)  memberRemoved,required TResult Function( String projectId)  projectLeft,required TResult Function( ProjectFailure failure)  error,}) {final _that = this;
switch (_that) {
case ProjectInitial():
return initial();case ProjectLoading():
return loading();case ProjectsLoaded():
return projectsLoaded(_that.projects);case ProjectLoaded():
return projectLoaded(_that.project);case MembersLoaded():
return membersLoaded(_that.members);case ProjectCreated():
return projectCreated(_that.project);case ProjectUpdated():
return projectUpdated(_that.project);case ProjectDeleted():
return projectDeleted(_that.projectId);case MemberAdded():
return memberAdded(_that.member);case MemberUpdated():
return memberUpdated(_that.member);case MemberRemoved():
return memberRemoved(_that.userId);case ProjectLeft():
return projectLeft(_that.projectId);case ProjectError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProjectWithRole> projects)?  projectsLoaded,TResult? Function( Project project)?  projectLoaded,TResult? Function( List<ProjectMember> members)?  membersLoaded,TResult? Function( Project project)?  projectCreated,TResult? Function( Project project)?  projectUpdated,TResult? Function( String projectId)?  projectDeleted,TResult? Function( ProjectMember member)?  memberAdded,TResult? Function( ProjectMember member)?  memberUpdated,TResult? Function( String userId)?  memberRemoved,TResult? Function( String projectId)?  projectLeft,TResult? Function( ProjectFailure failure)?  error,}) {final _that = this;
switch (_that) {
case ProjectInitial() when initial != null:
return initial();case ProjectLoading() when loading != null:
return loading();case ProjectsLoaded() when projectsLoaded != null:
return projectsLoaded(_that.projects);case ProjectLoaded() when projectLoaded != null:
return projectLoaded(_that.project);case MembersLoaded() when membersLoaded != null:
return membersLoaded(_that.members);case ProjectCreated() when projectCreated != null:
return projectCreated(_that.project);case ProjectUpdated() when projectUpdated != null:
return projectUpdated(_that.project);case ProjectDeleted() when projectDeleted != null:
return projectDeleted(_that.projectId);case MemberAdded() when memberAdded != null:
return memberAdded(_that.member);case MemberUpdated() when memberUpdated != null:
return memberUpdated(_that.member);case MemberRemoved() when memberRemoved != null:
return memberRemoved(_that.userId);case ProjectLeft() when projectLeft != null:
return projectLeft(_that.projectId);case ProjectError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ProjectInitial implements ProjectState {
  const ProjectInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectState.initial()';
}


}




/// @nodoc


class ProjectLoading implements ProjectState {
  const ProjectLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProjectState.loading()';
}


}




/// @nodoc


class ProjectsLoaded implements ProjectState {
  const ProjectsLoaded(final  List<ProjectWithRole> projects): _projects = projects;
  

 final  List<ProjectWithRole> _projects;
 List<ProjectWithRole> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsLoadedCopyWith<ProjectsLoaded> get copyWith => _$ProjectsLoadedCopyWithImpl<ProjectsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsLoaded&&const DeepCollectionEquality().equals(other._projects, _projects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects));

@override
String toString() {
  return 'ProjectState.projectsLoaded(projects: $projects)';
}


}

/// @nodoc
abstract mixin class $ProjectsLoadedCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $ProjectsLoadedCopyWith(ProjectsLoaded value, $Res Function(ProjectsLoaded) _then) = _$ProjectsLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProjectWithRole> projects
});




}
/// @nodoc
class _$ProjectsLoadedCopyWithImpl<$Res>
    implements $ProjectsLoadedCopyWith<$Res> {
  _$ProjectsLoadedCopyWithImpl(this._self, this._then);

  final ProjectsLoaded _self;
  final $Res Function(ProjectsLoaded) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projects = null,}) {
  return _then(ProjectsLoaded(
null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<ProjectWithRole>,
  ));
}


}

/// @nodoc


class ProjectLoaded implements ProjectState {
  const ProjectLoaded(this.project);
  

 final  Project project;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectLoadedCopyWith<ProjectLoaded> get copyWith => _$ProjectLoadedCopyWithImpl<ProjectLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectLoaded&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectState.projectLoaded(project: $project)';
}


}

/// @nodoc
abstract mixin class $ProjectLoadedCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $ProjectLoadedCopyWith(ProjectLoaded value, $Res Function(ProjectLoaded) _then) = _$ProjectLoadedCopyWithImpl;
@useResult
$Res call({
 Project project
});


$ProjectCopyWith<$Res> get project;

}
/// @nodoc
class _$ProjectLoadedCopyWithImpl<$Res>
    implements $ProjectLoadedCopyWith<$Res> {
  _$ProjectLoadedCopyWithImpl(this._self, this._then);

  final ProjectLoaded _self;
  final $Res Function(ProjectLoaded) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(ProjectLoaded(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res> get project {
  
  return $ProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

/// @nodoc


class MembersLoaded implements ProjectState {
  const MembersLoaded(final  List<ProjectMember> members): _members = members;
  

 final  List<ProjectMember> _members;
 List<ProjectMember> get members {
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_members);
}


/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MembersLoadedCopyWith<MembersLoaded> get copyWith => _$MembersLoadedCopyWithImpl<MembersLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MembersLoaded&&const DeepCollectionEquality().equals(other._members, _members));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_members));

@override
String toString() {
  return 'ProjectState.membersLoaded(members: $members)';
}


}

/// @nodoc
abstract mixin class $MembersLoadedCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $MembersLoadedCopyWith(MembersLoaded value, $Res Function(MembersLoaded) _then) = _$MembersLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProjectMember> members
});




}
/// @nodoc
class _$MembersLoadedCopyWithImpl<$Res>
    implements $MembersLoadedCopyWith<$Res> {
  _$MembersLoadedCopyWithImpl(this._self, this._then);

  final MembersLoaded _self;
  final $Res Function(MembersLoaded) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? members = null,}) {
  return _then(MembersLoaded(
null == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<ProjectMember>,
  ));
}


}

/// @nodoc


class ProjectCreated implements ProjectState {
  const ProjectCreated(this.project);
  

 final  Project project;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectCreatedCopyWith<ProjectCreated> get copyWith => _$ProjectCreatedCopyWithImpl<ProjectCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectCreated&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectState.projectCreated(project: $project)';
}


}

/// @nodoc
abstract mixin class $ProjectCreatedCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $ProjectCreatedCopyWith(ProjectCreated value, $Res Function(ProjectCreated) _then) = _$ProjectCreatedCopyWithImpl;
@useResult
$Res call({
 Project project
});


$ProjectCopyWith<$Res> get project;

}
/// @nodoc
class _$ProjectCreatedCopyWithImpl<$Res>
    implements $ProjectCreatedCopyWith<$Res> {
  _$ProjectCreatedCopyWithImpl(this._self, this._then);

  final ProjectCreated _self;
  final $Res Function(ProjectCreated) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(ProjectCreated(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res> get project {
  
  return $ProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

/// @nodoc


class ProjectUpdated implements ProjectState {
  const ProjectUpdated(this.project);
  

 final  Project project;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectUpdatedCopyWith<ProjectUpdated> get copyWith => _$ProjectUpdatedCopyWithImpl<ProjectUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectUpdated&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,project);

@override
String toString() {
  return 'ProjectState.projectUpdated(project: $project)';
}


}

/// @nodoc
abstract mixin class $ProjectUpdatedCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $ProjectUpdatedCopyWith(ProjectUpdated value, $Res Function(ProjectUpdated) _then) = _$ProjectUpdatedCopyWithImpl;
@useResult
$Res call({
 Project project
});


$ProjectCopyWith<$Res> get project;

}
/// @nodoc
class _$ProjectUpdatedCopyWithImpl<$Res>
    implements $ProjectUpdatedCopyWith<$Res> {
  _$ProjectUpdatedCopyWithImpl(this._self, this._then);

  final ProjectUpdated _self;
  final $Res Function(ProjectUpdated) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? project = null,}) {
  return _then(ProjectUpdated(
null == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as Project,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectCopyWith<$Res> get project {
  
  return $ProjectCopyWith<$Res>(_self.project, (value) {
    return _then(_self.copyWith(project: value));
  });
}
}

/// @nodoc


class ProjectDeleted implements ProjectState {
  const ProjectDeleted(this.projectId);
  

 final  String projectId;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectDeletedCopyWith<ProjectDeleted> get copyWith => _$ProjectDeletedCopyWithImpl<ProjectDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectDeleted&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'ProjectState.projectDeleted(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $ProjectDeletedCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $ProjectDeletedCopyWith(ProjectDeleted value, $Res Function(ProjectDeleted) _then) = _$ProjectDeletedCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$ProjectDeletedCopyWithImpl<$Res>
    implements $ProjectDeletedCopyWith<$Res> {
  _$ProjectDeletedCopyWithImpl(this._self, this._then);

  final ProjectDeleted _self;
  final $Res Function(ProjectDeleted) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(ProjectDeleted(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MemberAdded implements ProjectState {
  const MemberAdded(this.member);
  

 final  ProjectMember member;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberAddedCopyWith<MemberAdded> get copyWith => _$MemberAddedCopyWithImpl<MemberAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberAdded&&(identical(other.member, member) || other.member == member));
}


@override
int get hashCode => Object.hash(runtimeType,member);

@override
String toString() {
  return 'ProjectState.memberAdded(member: $member)';
}


}

/// @nodoc
abstract mixin class $MemberAddedCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $MemberAddedCopyWith(MemberAdded value, $Res Function(MemberAdded) _then) = _$MemberAddedCopyWithImpl;
@useResult
$Res call({
 ProjectMember member
});


$ProjectMemberCopyWith<$Res> get member;

}
/// @nodoc
class _$MemberAddedCopyWithImpl<$Res>
    implements $MemberAddedCopyWith<$Res> {
  _$MemberAddedCopyWithImpl(this._self, this._then);

  final MemberAdded _self;
  final $Res Function(MemberAdded) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? member = null,}) {
  return _then(MemberAdded(
null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as ProjectMember,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectMemberCopyWith<$Res> get member {
  
  return $ProjectMemberCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}

/// @nodoc


class MemberUpdated implements ProjectState {
  const MemberUpdated(this.member);
  

 final  ProjectMember member;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberUpdatedCopyWith<MemberUpdated> get copyWith => _$MemberUpdatedCopyWithImpl<MemberUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberUpdated&&(identical(other.member, member) || other.member == member));
}


@override
int get hashCode => Object.hash(runtimeType,member);

@override
String toString() {
  return 'ProjectState.memberUpdated(member: $member)';
}


}

/// @nodoc
abstract mixin class $MemberUpdatedCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $MemberUpdatedCopyWith(MemberUpdated value, $Res Function(MemberUpdated) _then) = _$MemberUpdatedCopyWithImpl;
@useResult
$Res call({
 ProjectMember member
});


$ProjectMemberCopyWith<$Res> get member;

}
/// @nodoc
class _$MemberUpdatedCopyWithImpl<$Res>
    implements $MemberUpdatedCopyWith<$Res> {
  _$MemberUpdatedCopyWithImpl(this._self, this._then);

  final MemberUpdated _self;
  final $Res Function(MemberUpdated) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? member = null,}) {
  return _then(MemberUpdated(
null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as ProjectMember,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectMemberCopyWith<$Res> get member {
  
  return $ProjectMemberCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}

/// @nodoc


class MemberRemoved implements ProjectState {
  const MemberRemoved(this.userId);
  

 final  String userId;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberRemovedCopyWith<MemberRemoved> get copyWith => _$MemberRemovedCopyWithImpl<MemberRemoved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberRemoved&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ProjectState.memberRemoved(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $MemberRemovedCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $MemberRemovedCopyWith(MemberRemoved value, $Res Function(MemberRemoved) _then) = _$MemberRemovedCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$MemberRemovedCopyWithImpl<$Res>
    implements $MemberRemovedCopyWith<$Res> {
  _$MemberRemovedCopyWithImpl(this._self, this._then);

  final MemberRemoved _self;
  final $Res Function(MemberRemoved) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(MemberRemoved(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProjectLeft implements ProjectState {
  const ProjectLeft(this.projectId);
  

 final  String projectId;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectLeftCopyWith<ProjectLeft> get copyWith => _$ProjectLeftCopyWithImpl<ProjectLeft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectLeft&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'ProjectState.projectLeft(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $ProjectLeftCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $ProjectLeftCopyWith(ProjectLeft value, $Res Function(ProjectLeft) _then) = _$ProjectLeftCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$ProjectLeftCopyWithImpl<$Res>
    implements $ProjectLeftCopyWith<$Res> {
  _$ProjectLeftCopyWithImpl(this._self, this._then);

  final ProjectLeft _self;
  final $Res Function(ProjectLeft) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(ProjectLeft(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProjectError implements ProjectState {
  const ProjectError(this.failure);
  

 final  ProjectFailure failure;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectErrorCopyWith<ProjectError> get copyWith => _$ProjectErrorCopyWithImpl<ProjectError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ProjectState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ProjectErrorCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory $ProjectErrorCopyWith(ProjectError value, $Res Function(ProjectError) _then) = _$ProjectErrorCopyWithImpl;
@useResult
$Res call({
 ProjectFailure failure
});


$ProjectFailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$ProjectErrorCopyWithImpl<$Res>
    implements $ProjectErrorCopyWith<$Res> {
  _$ProjectErrorCopyWithImpl(this._self, this._then);

  final ProjectError _self;
  final $Res Function(ProjectError) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ProjectError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as ProjectFailure,
  ));
}

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProjectFailureCopyWith<$Res> get failure {
  
  return $ProjectFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
