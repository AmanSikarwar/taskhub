// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationEvent()';
}


}

/// @nodoc
class $NotificationEventCopyWith<$Res>  {
$NotificationEventCopyWith(NotificationEvent _, $Res Function(NotificationEvent) __);
}


/// Adds pattern-matching-related methods to [NotificationEvent].
extension NotificationEventPatterns on NotificationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadNotifications value)?  loadNotifications,TResult Function( LoadUnreadCount value)?  loadUnreadCount,TResult Function( MarkAsRead value)?  markAsRead,TResult Function( MarkAllAsRead value)?  markAllAsRead,TResult Function( DeleteNotification value)?  deleteNotification,TResult Function( DeleteAllNotifications value)?  deleteAllNotifications,TResult Function( WatchNotifications value)?  watchNotifications,TResult Function( NotificationsUpdated value)?  notificationsUpdated,TResult Function( UnreadCountUpdated value)?  unreadCountUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadNotifications() when loadNotifications != null:
return loadNotifications(_that);case LoadUnreadCount() when loadUnreadCount != null:
return loadUnreadCount(_that);case MarkAsRead() when markAsRead != null:
return markAsRead(_that);case MarkAllAsRead() when markAllAsRead != null:
return markAllAsRead(_that);case DeleteNotification() when deleteNotification != null:
return deleteNotification(_that);case DeleteAllNotifications() when deleteAllNotifications != null:
return deleteAllNotifications(_that);case WatchNotifications() when watchNotifications != null:
return watchNotifications(_that);case NotificationsUpdated() when notificationsUpdated != null:
return notificationsUpdated(_that);case UnreadCountUpdated() when unreadCountUpdated != null:
return unreadCountUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadNotifications value)  loadNotifications,required TResult Function( LoadUnreadCount value)  loadUnreadCount,required TResult Function( MarkAsRead value)  markAsRead,required TResult Function( MarkAllAsRead value)  markAllAsRead,required TResult Function( DeleteNotification value)  deleteNotification,required TResult Function( DeleteAllNotifications value)  deleteAllNotifications,required TResult Function( WatchNotifications value)  watchNotifications,required TResult Function( NotificationsUpdated value)  notificationsUpdated,required TResult Function( UnreadCountUpdated value)  unreadCountUpdated,}){
final _that = this;
switch (_that) {
case LoadNotifications():
return loadNotifications(_that);case LoadUnreadCount():
return loadUnreadCount(_that);case MarkAsRead():
return markAsRead(_that);case MarkAllAsRead():
return markAllAsRead(_that);case DeleteNotification():
return deleteNotification(_that);case DeleteAllNotifications():
return deleteAllNotifications(_that);case WatchNotifications():
return watchNotifications(_that);case NotificationsUpdated():
return notificationsUpdated(_that);case UnreadCountUpdated():
return unreadCountUpdated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadNotifications value)?  loadNotifications,TResult? Function( LoadUnreadCount value)?  loadUnreadCount,TResult? Function( MarkAsRead value)?  markAsRead,TResult? Function( MarkAllAsRead value)?  markAllAsRead,TResult? Function( DeleteNotification value)?  deleteNotification,TResult? Function( DeleteAllNotifications value)?  deleteAllNotifications,TResult? Function( WatchNotifications value)?  watchNotifications,TResult? Function( NotificationsUpdated value)?  notificationsUpdated,TResult? Function( UnreadCountUpdated value)?  unreadCountUpdated,}){
final _that = this;
switch (_that) {
case LoadNotifications() when loadNotifications != null:
return loadNotifications(_that);case LoadUnreadCount() when loadUnreadCount != null:
return loadUnreadCount(_that);case MarkAsRead() when markAsRead != null:
return markAsRead(_that);case MarkAllAsRead() when markAllAsRead != null:
return markAllAsRead(_that);case DeleteNotification() when deleteNotification != null:
return deleteNotification(_that);case DeleteAllNotifications() when deleteAllNotifications != null:
return deleteAllNotifications(_that);case WatchNotifications() when watchNotifications != null:
return watchNotifications(_that);case NotificationsUpdated() when notificationsUpdated != null:
return notificationsUpdated(_that);case UnreadCountUpdated() when unreadCountUpdated != null:
return unreadCountUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int? limit)?  loadNotifications,TResult Function()?  loadUnreadCount,TResult Function( String notificationId)?  markAsRead,TResult Function()?  markAllAsRead,TResult Function( String notificationId)?  deleteNotification,TResult Function()?  deleteAllNotifications,TResult Function()?  watchNotifications,TResult Function( List<AppNotification> notifications)?  notificationsUpdated,TResult Function( int count)?  unreadCountUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadNotifications() when loadNotifications != null:
return loadNotifications(_that.limit);case LoadUnreadCount() when loadUnreadCount != null:
return loadUnreadCount();case MarkAsRead() when markAsRead != null:
return markAsRead(_that.notificationId);case MarkAllAsRead() when markAllAsRead != null:
return markAllAsRead();case DeleteNotification() when deleteNotification != null:
return deleteNotification(_that.notificationId);case DeleteAllNotifications() when deleteAllNotifications != null:
return deleteAllNotifications();case WatchNotifications() when watchNotifications != null:
return watchNotifications();case NotificationsUpdated() when notificationsUpdated != null:
return notificationsUpdated(_that.notifications);case UnreadCountUpdated() when unreadCountUpdated != null:
return unreadCountUpdated(_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int? limit)  loadNotifications,required TResult Function()  loadUnreadCount,required TResult Function( String notificationId)  markAsRead,required TResult Function()  markAllAsRead,required TResult Function( String notificationId)  deleteNotification,required TResult Function()  deleteAllNotifications,required TResult Function()  watchNotifications,required TResult Function( List<AppNotification> notifications)  notificationsUpdated,required TResult Function( int count)  unreadCountUpdated,}) {final _that = this;
switch (_that) {
case LoadNotifications():
return loadNotifications(_that.limit);case LoadUnreadCount():
return loadUnreadCount();case MarkAsRead():
return markAsRead(_that.notificationId);case MarkAllAsRead():
return markAllAsRead();case DeleteNotification():
return deleteNotification(_that.notificationId);case DeleteAllNotifications():
return deleteAllNotifications();case WatchNotifications():
return watchNotifications();case NotificationsUpdated():
return notificationsUpdated(_that.notifications);case UnreadCountUpdated():
return unreadCountUpdated(_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int? limit)?  loadNotifications,TResult? Function()?  loadUnreadCount,TResult? Function( String notificationId)?  markAsRead,TResult? Function()?  markAllAsRead,TResult? Function( String notificationId)?  deleteNotification,TResult? Function()?  deleteAllNotifications,TResult? Function()?  watchNotifications,TResult? Function( List<AppNotification> notifications)?  notificationsUpdated,TResult? Function( int count)?  unreadCountUpdated,}) {final _that = this;
switch (_that) {
case LoadNotifications() when loadNotifications != null:
return loadNotifications(_that.limit);case LoadUnreadCount() when loadUnreadCount != null:
return loadUnreadCount();case MarkAsRead() when markAsRead != null:
return markAsRead(_that.notificationId);case MarkAllAsRead() when markAllAsRead != null:
return markAllAsRead();case DeleteNotification() when deleteNotification != null:
return deleteNotification(_that.notificationId);case DeleteAllNotifications() when deleteAllNotifications != null:
return deleteAllNotifications();case WatchNotifications() when watchNotifications != null:
return watchNotifications();case NotificationsUpdated() when notificationsUpdated != null:
return notificationsUpdated(_that.notifications);case UnreadCountUpdated() when unreadCountUpdated != null:
return unreadCountUpdated(_that.count);case _:
  return null;

}
}

}

/// @nodoc


class LoadNotifications implements NotificationEvent {
  const LoadNotifications({this.limit});
  

 final  int? limit;

/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadNotificationsCopyWith<LoadNotifications> get copyWith => _$LoadNotificationsCopyWithImpl<LoadNotifications>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadNotifications&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString() {
  return 'NotificationEvent.loadNotifications(limit: $limit)';
}


}

/// @nodoc
abstract mixin class $LoadNotificationsCopyWith<$Res> implements $NotificationEventCopyWith<$Res> {
  factory $LoadNotificationsCopyWith(LoadNotifications value, $Res Function(LoadNotifications) _then) = _$LoadNotificationsCopyWithImpl;
@useResult
$Res call({
 int? limit
});




}
/// @nodoc
class _$LoadNotificationsCopyWithImpl<$Res>
    implements $LoadNotificationsCopyWith<$Res> {
  _$LoadNotificationsCopyWithImpl(this._self, this._then);

  final LoadNotifications _self;
  final $Res Function(LoadNotifications) _then;

/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limit = freezed,}) {
  return _then(LoadNotifications(
limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class LoadUnreadCount implements NotificationEvent {
  const LoadUnreadCount();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadUnreadCount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationEvent.loadUnreadCount()';
}


}




/// @nodoc


class MarkAsRead implements NotificationEvent {
  const MarkAsRead(this.notificationId);
  

 final  String notificationId;

/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkAsReadCopyWith<MarkAsRead> get copyWith => _$MarkAsReadCopyWithImpl<MarkAsRead>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkAsRead&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId));
}


@override
int get hashCode => Object.hash(runtimeType,notificationId);

@override
String toString() {
  return 'NotificationEvent.markAsRead(notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class $MarkAsReadCopyWith<$Res> implements $NotificationEventCopyWith<$Res> {
  factory $MarkAsReadCopyWith(MarkAsRead value, $Res Function(MarkAsRead) _then) = _$MarkAsReadCopyWithImpl;
@useResult
$Res call({
 String notificationId
});




}
/// @nodoc
class _$MarkAsReadCopyWithImpl<$Res>
    implements $MarkAsReadCopyWith<$Res> {
  _$MarkAsReadCopyWithImpl(this._self, this._then);

  final MarkAsRead _self;
  final $Res Function(MarkAsRead) _then;

/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationId = null,}) {
  return _then(MarkAsRead(
null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MarkAllAsRead implements NotificationEvent {
  const MarkAllAsRead();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkAllAsRead);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationEvent.markAllAsRead()';
}


}




/// @nodoc


class DeleteNotification implements NotificationEvent {
  const DeleteNotification(this.notificationId);
  

 final  String notificationId;

/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteNotificationCopyWith<DeleteNotification> get copyWith => _$DeleteNotificationCopyWithImpl<DeleteNotification>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteNotification&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId));
}


@override
int get hashCode => Object.hash(runtimeType,notificationId);

@override
String toString() {
  return 'NotificationEvent.deleteNotification(notificationId: $notificationId)';
}


}

/// @nodoc
abstract mixin class $DeleteNotificationCopyWith<$Res> implements $NotificationEventCopyWith<$Res> {
  factory $DeleteNotificationCopyWith(DeleteNotification value, $Res Function(DeleteNotification) _then) = _$DeleteNotificationCopyWithImpl;
@useResult
$Res call({
 String notificationId
});




}
/// @nodoc
class _$DeleteNotificationCopyWithImpl<$Res>
    implements $DeleteNotificationCopyWith<$Res> {
  _$DeleteNotificationCopyWithImpl(this._self, this._then);

  final DeleteNotification _self;
  final $Res Function(DeleteNotification) _then;

/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationId = null,}) {
  return _then(DeleteNotification(
null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DeleteAllNotifications implements NotificationEvent {
  const DeleteAllNotifications();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAllNotifications);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationEvent.deleteAllNotifications()';
}


}




/// @nodoc


class WatchNotifications implements NotificationEvent {
  const WatchNotifications();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchNotifications);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationEvent.watchNotifications()';
}


}




/// @nodoc


class NotificationsUpdated implements NotificationEvent {
  const NotificationsUpdated(final  List<AppNotification> notifications): _notifications = notifications;
  

 final  List<AppNotification> _notifications;
 List<AppNotification> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}


/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsUpdatedCopyWith<NotificationsUpdated> get copyWith => _$NotificationsUpdatedCopyWithImpl<NotificationsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsUpdated&&const DeepCollectionEquality().equals(other._notifications, _notifications));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications));

@override
String toString() {
  return 'NotificationEvent.notificationsUpdated(notifications: $notifications)';
}


}

/// @nodoc
abstract mixin class $NotificationsUpdatedCopyWith<$Res> implements $NotificationEventCopyWith<$Res> {
  factory $NotificationsUpdatedCopyWith(NotificationsUpdated value, $Res Function(NotificationsUpdated) _then) = _$NotificationsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<AppNotification> notifications
});




}
/// @nodoc
class _$NotificationsUpdatedCopyWithImpl<$Res>
    implements $NotificationsUpdatedCopyWith<$Res> {
  _$NotificationsUpdatedCopyWithImpl(this._self, this._then);

  final NotificationsUpdated _self;
  final $Res Function(NotificationsUpdated) _then;

/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notifications = null,}) {
  return _then(NotificationsUpdated(
null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<AppNotification>,
  ));
}


}

/// @nodoc


class UnreadCountUpdated implements NotificationEvent {
  const UnreadCountUpdated(this.count);
  

 final  int count;

/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnreadCountUpdatedCopyWith<UnreadCountUpdated> get copyWith => _$UnreadCountUpdatedCopyWithImpl<UnreadCountUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnreadCountUpdated&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'NotificationEvent.unreadCountUpdated(count: $count)';
}


}

/// @nodoc
abstract mixin class $UnreadCountUpdatedCopyWith<$Res> implements $NotificationEventCopyWith<$Res> {
  factory $UnreadCountUpdatedCopyWith(UnreadCountUpdated value, $Res Function(UnreadCountUpdated) _then) = _$UnreadCountUpdatedCopyWithImpl;
@useResult
$Res call({
 int count
});




}
/// @nodoc
class _$UnreadCountUpdatedCopyWithImpl<$Res>
    implements $UnreadCountUpdatedCopyWith<$Res> {
  _$UnreadCountUpdatedCopyWithImpl(this._self, this._then);

  final UnreadCountUpdated _self;
  final $Res Function(UnreadCountUpdated) _then;

/// Create a copy of NotificationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? count = null,}) {
  return _then(UnreadCountUpdated(
null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$NotificationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationState()';
}


}

/// @nodoc
class $NotificationStateCopyWith<$Res>  {
$NotificationStateCopyWith(NotificationState _, $Res Function(NotificationState) __);
}


/// Adds pattern-matching-related methods to [NotificationState].
extension NotificationStatePatterns on NotificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NotificationInitial value)?  initial,TResult Function( NotificationLoading value)?  loading,TResult Function( NotificationLoaded value)?  loaded,TResult Function( NotificationError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NotificationInitial() when initial != null:
return initial(_that);case NotificationLoading() when loading != null:
return loading(_that);case NotificationLoaded() when loaded != null:
return loaded(_that);case NotificationError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NotificationInitial value)  initial,required TResult Function( NotificationLoading value)  loading,required TResult Function( NotificationLoaded value)  loaded,required TResult Function( NotificationError value)  error,}){
final _that = this;
switch (_that) {
case NotificationInitial():
return initial(_that);case NotificationLoading():
return loading(_that);case NotificationLoaded():
return loaded(_that);case NotificationError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NotificationInitial value)?  initial,TResult? Function( NotificationLoading value)?  loading,TResult? Function( NotificationLoaded value)?  loaded,TResult? Function( NotificationError value)?  error,}){
final _that = this;
switch (_that) {
case NotificationInitial() when initial != null:
return initial(_that);case NotificationLoading() when loading != null:
return loading(_that);case NotificationLoaded() when loaded != null:
return loaded(_that);case NotificationError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int unreadCount)?  loading,TResult Function( List<AppNotification> notifications,  int unreadCount)?  loaded,TResult Function( NotificationFailure failure,  int unreadCount)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NotificationInitial() when initial != null:
return initial();case NotificationLoading() when loading != null:
return loading(_that.unreadCount);case NotificationLoaded() when loaded != null:
return loaded(_that.notifications,_that.unreadCount);case NotificationError() when error != null:
return error(_that.failure,_that.unreadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int unreadCount)  loading,required TResult Function( List<AppNotification> notifications,  int unreadCount)  loaded,required TResult Function( NotificationFailure failure,  int unreadCount)  error,}) {final _that = this;
switch (_that) {
case NotificationInitial():
return initial();case NotificationLoading():
return loading(_that.unreadCount);case NotificationLoaded():
return loaded(_that.notifications,_that.unreadCount);case NotificationError():
return error(_that.failure,_that.unreadCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int unreadCount)?  loading,TResult? Function( List<AppNotification> notifications,  int unreadCount)?  loaded,TResult? Function( NotificationFailure failure,  int unreadCount)?  error,}) {final _that = this;
switch (_that) {
case NotificationInitial() when initial != null:
return initial();case NotificationLoading() when loading != null:
return loading(_that.unreadCount);case NotificationLoaded() when loaded != null:
return loaded(_that.notifications,_that.unreadCount);case NotificationError() when error != null:
return error(_that.failure,_that.unreadCount);case _:
  return null;

}
}

}

/// @nodoc


class NotificationInitial implements NotificationState {
  const NotificationInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationState.initial()';
}


}




/// @nodoc


class NotificationLoading implements NotificationState {
  const NotificationLoading({required this.unreadCount});
  

 final  int unreadCount;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationLoadingCopyWith<NotificationLoading> get copyWith => _$NotificationLoadingCopyWithImpl<NotificationLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationLoading&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,unreadCount);

@override
String toString() {
  return 'NotificationState.loading(unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $NotificationLoadingCopyWith<$Res> implements $NotificationStateCopyWith<$Res> {
  factory $NotificationLoadingCopyWith(NotificationLoading value, $Res Function(NotificationLoading) _then) = _$NotificationLoadingCopyWithImpl;
@useResult
$Res call({
 int unreadCount
});




}
/// @nodoc
class _$NotificationLoadingCopyWithImpl<$Res>
    implements $NotificationLoadingCopyWith<$Res> {
  _$NotificationLoadingCopyWithImpl(this._self, this._then);

  final NotificationLoading _self;
  final $Res Function(NotificationLoading) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unreadCount = null,}) {
  return _then(NotificationLoading(
unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class NotificationLoaded implements NotificationState {
  const NotificationLoaded({required final  List<AppNotification> notifications, required this.unreadCount}): _notifications = notifications;
  

 final  List<AppNotification> _notifications;
 List<AppNotification> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

 final  int unreadCount;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationLoadedCopyWith<NotificationLoaded> get copyWith => _$NotificationLoadedCopyWithImpl<NotificationLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationLoaded&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),unreadCount);

@override
String toString() {
  return 'NotificationState.loaded(notifications: $notifications, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $NotificationLoadedCopyWith<$Res> implements $NotificationStateCopyWith<$Res> {
  factory $NotificationLoadedCopyWith(NotificationLoaded value, $Res Function(NotificationLoaded) _then) = _$NotificationLoadedCopyWithImpl;
@useResult
$Res call({
 List<AppNotification> notifications, int unreadCount
});




}
/// @nodoc
class _$NotificationLoadedCopyWithImpl<$Res>
    implements $NotificationLoadedCopyWith<$Res> {
  _$NotificationLoadedCopyWithImpl(this._self, this._then);

  final NotificationLoaded _self;
  final $Res Function(NotificationLoaded) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? unreadCount = null,}) {
  return _then(NotificationLoaded(
notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<AppNotification>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class NotificationError implements NotificationState {
  const NotificationError(this.failure, {required this.unreadCount});
  

 final  NotificationFailure failure;
 final  int unreadCount;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationErrorCopyWith<NotificationError> get copyWith => _$NotificationErrorCopyWithImpl<NotificationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationError&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,failure,unreadCount);

@override
String toString() {
  return 'NotificationState.error(failure: $failure, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $NotificationErrorCopyWith<$Res> implements $NotificationStateCopyWith<$Res> {
  factory $NotificationErrorCopyWith(NotificationError value, $Res Function(NotificationError) _then) = _$NotificationErrorCopyWithImpl;
@useResult
$Res call({
 NotificationFailure failure, int unreadCount
});


$NotificationFailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$NotificationErrorCopyWithImpl<$Res>
    implements $NotificationErrorCopyWith<$Res> {
  _$NotificationErrorCopyWithImpl(this._self, this._then);

  final NotificationError _self;
  final $Res Function(NotificationError) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? unreadCount = null,}) {
  return _then(NotificationError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as NotificationFailure,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationFailureCopyWith<$Res> get failure {
  
  return $NotificationFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
