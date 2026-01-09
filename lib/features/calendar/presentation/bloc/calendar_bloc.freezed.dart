// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalendarEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent()';
}


}

/// @nodoc
class $CalendarEventCopyWith<$Res>  {
$CalendarEventCopyWith(CalendarEvent _, $Res Function(CalendarEvent) __);
}


/// Adds pattern-matching-related methods to [CalendarEvent].
extension CalendarEventPatterns on CalendarEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadMonth value)?  loadMonth,TResult Function( ChangeFocusedDay value)?  changeFocusedDay,TResult Function( ChangeSelectedDay value)?  changeSelectedDay,TResult Function( ToggleCalendarFormat value)?  toggleCalendarFormat,TResult Function( WatchMonth value)?  watchMonth,TResult Function( EventsUpdated value)?  eventsUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadMonth() when loadMonth != null:
return loadMonth(_that);case ChangeFocusedDay() when changeFocusedDay != null:
return changeFocusedDay(_that);case ChangeSelectedDay() when changeSelectedDay != null:
return changeSelectedDay(_that);case ToggleCalendarFormat() when toggleCalendarFormat != null:
return toggleCalendarFormat(_that);case WatchMonth() when watchMonth != null:
return watchMonth(_that);case EventsUpdated() when eventsUpdated != null:
return eventsUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadMonth value)  loadMonth,required TResult Function( ChangeFocusedDay value)  changeFocusedDay,required TResult Function( ChangeSelectedDay value)  changeSelectedDay,required TResult Function( ToggleCalendarFormat value)  toggleCalendarFormat,required TResult Function( WatchMonth value)  watchMonth,required TResult Function( EventsUpdated value)  eventsUpdated,}){
final _that = this;
switch (_that) {
case LoadMonth():
return loadMonth(_that);case ChangeFocusedDay():
return changeFocusedDay(_that);case ChangeSelectedDay():
return changeSelectedDay(_that);case ToggleCalendarFormat():
return toggleCalendarFormat(_that);case WatchMonth():
return watchMonth(_that);case EventsUpdated():
return eventsUpdated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadMonth value)?  loadMonth,TResult? Function( ChangeFocusedDay value)?  changeFocusedDay,TResult? Function( ChangeSelectedDay value)?  changeSelectedDay,TResult? Function( ToggleCalendarFormat value)?  toggleCalendarFormat,TResult? Function( WatchMonth value)?  watchMonth,TResult? Function( EventsUpdated value)?  eventsUpdated,}){
final _that = this;
switch (_that) {
case LoadMonth() when loadMonth != null:
return loadMonth(_that);case ChangeFocusedDay() when changeFocusedDay != null:
return changeFocusedDay(_that);case ChangeSelectedDay() when changeSelectedDay != null:
return changeSelectedDay(_that);case ToggleCalendarFormat() when toggleCalendarFormat != null:
return toggleCalendarFormat(_that);case WatchMonth() when watchMonth != null:
return watchMonth(_that);case EventsUpdated() when eventsUpdated != null:
return eventsUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime month)?  loadMonth,TResult Function( DateTime focusedDay)?  changeFocusedDay,TResult Function( DateTime selectedDay)?  changeSelectedDay,TResult Function()?  toggleCalendarFormat,TResult Function( DateTime month)?  watchMonth,TResult Function( Map<DateTime, List<Task>> events)?  eventsUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadMonth() when loadMonth != null:
return loadMonth(_that.month);case ChangeFocusedDay() when changeFocusedDay != null:
return changeFocusedDay(_that.focusedDay);case ChangeSelectedDay() when changeSelectedDay != null:
return changeSelectedDay(_that.selectedDay);case ToggleCalendarFormat() when toggleCalendarFormat != null:
return toggleCalendarFormat();case WatchMonth() when watchMonth != null:
return watchMonth(_that.month);case EventsUpdated() when eventsUpdated != null:
return eventsUpdated(_that.events);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime month)  loadMonth,required TResult Function( DateTime focusedDay)  changeFocusedDay,required TResult Function( DateTime selectedDay)  changeSelectedDay,required TResult Function()  toggleCalendarFormat,required TResult Function( DateTime month)  watchMonth,required TResult Function( Map<DateTime, List<Task>> events)  eventsUpdated,}) {final _that = this;
switch (_that) {
case LoadMonth():
return loadMonth(_that.month);case ChangeFocusedDay():
return changeFocusedDay(_that.focusedDay);case ChangeSelectedDay():
return changeSelectedDay(_that.selectedDay);case ToggleCalendarFormat():
return toggleCalendarFormat();case WatchMonth():
return watchMonth(_that.month);case EventsUpdated():
return eventsUpdated(_that.events);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime month)?  loadMonth,TResult? Function( DateTime focusedDay)?  changeFocusedDay,TResult? Function( DateTime selectedDay)?  changeSelectedDay,TResult? Function()?  toggleCalendarFormat,TResult? Function( DateTime month)?  watchMonth,TResult? Function( Map<DateTime, List<Task>> events)?  eventsUpdated,}) {final _that = this;
switch (_that) {
case LoadMonth() when loadMonth != null:
return loadMonth(_that.month);case ChangeFocusedDay() when changeFocusedDay != null:
return changeFocusedDay(_that.focusedDay);case ChangeSelectedDay() when changeSelectedDay != null:
return changeSelectedDay(_that.selectedDay);case ToggleCalendarFormat() when toggleCalendarFormat != null:
return toggleCalendarFormat();case WatchMonth() when watchMonth != null:
return watchMonth(_that.month);case EventsUpdated() when eventsUpdated != null:
return eventsUpdated(_that.events);case _:
  return null;

}
}

}

/// @nodoc


class LoadMonth implements CalendarEvent {
  const LoadMonth(this.month);
  

 final  DateTime month;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadMonthCopyWith<LoadMonth> get copyWith => _$LoadMonthCopyWithImpl<LoadMonth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMonth&&(identical(other.month, month) || other.month == month));
}


@override
int get hashCode => Object.hash(runtimeType,month);

@override
String toString() {
  return 'CalendarEvent.loadMonth(month: $month)';
}


}

/// @nodoc
abstract mixin class $LoadMonthCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $LoadMonthCopyWith(LoadMonth value, $Res Function(LoadMonth) _then) = _$LoadMonthCopyWithImpl;
@useResult
$Res call({
 DateTime month
});




}
/// @nodoc
class _$LoadMonthCopyWithImpl<$Res>
    implements $LoadMonthCopyWith<$Res> {
  _$LoadMonthCopyWithImpl(this._self, this._then);

  final LoadMonth _self;
  final $Res Function(LoadMonth) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? month = null,}) {
  return _then(LoadMonth(
null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class ChangeFocusedDay implements CalendarEvent {
  const ChangeFocusedDay(this.focusedDay);
  

 final  DateTime focusedDay;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeFocusedDayCopyWith<ChangeFocusedDay> get copyWith => _$ChangeFocusedDayCopyWithImpl<ChangeFocusedDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeFocusedDay&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay));
}


@override
int get hashCode => Object.hash(runtimeType,focusedDay);

@override
String toString() {
  return 'CalendarEvent.changeFocusedDay(focusedDay: $focusedDay)';
}


}

/// @nodoc
abstract mixin class $ChangeFocusedDayCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $ChangeFocusedDayCopyWith(ChangeFocusedDay value, $Res Function(ChangeFocusedDay) _then) = _$ChangeFocusedDayCopyWithImpl;
@useResult
$Res call({
 DateTime focusedDay
});




}
/// @nodoc
class _$ChangeFocusedDayCopyWithImpl<$Res>
    implements $ChangeFocusedDayCopyWith<$Res> {
  _$ChangeFocusedDayCopyWithImpl(this._self, this._then);

  final ChangeFocusedDay _self;
  final $Res Function(ChangeFocusedDay) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? focusedDay = null,}) {
  return _then(ChangeFocusedDay(
null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class ChangeSelectedDay implements CalendarEvent {
  const ChangeSelectedDay(this.selectedDay);
  

 final  DateTime selectedDay;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeSelectedDayCopyWith<ChangeSelectedDay> get copyWith => _$ChangeSelectedDayCopyWithImpl<ChangeSelectedDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeSelectedDay&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay));
}


@override
int get hashCode => Object.hash(runtimeType,selectedDay);

@override
String toString() {
  return 'CalendarEvent.changeSelectedDay(selectedDay: $selectedDay)';
}


}

/// @nodoc
abstract mixin class $ChangeSelectedDayCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $ChangeSelectedDayCopyWith(ChangeSelectedDay value, $Res Function(ChangeSelectedDay) _then) = _$ChangeSelectedDayCopyWithImpl;
@useResult
$Res call({
 DateTime selectedDay
});




}
/// @nodoc
class _$ChangeSelectedDayCopyWithImpl<$Res>
    implements $ChangeSelectedDayCopyWith<$Res> {
  _$ChangeSelectedDayCopyWithImpl(this._self, this._then);

  final ChangeSelectedDay _self;
  final $Res Function(ChangeSelectedDay) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedDay = null,}) {
  return _then(ChangeSelectedDay(
null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class ToggleCalendarFormat implements CalendarEvent {
  const ToggleCalendarFormat();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleCalendarFormat);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarEvent.toggleCalendarFormat()';
}


}




/// @nodoc


class WatchMonth implements CalendarEvent {
  const WatchMonth(this.month);
  

 final  DateTime month;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchMonthCopyWith<WatchMonth> get copyWith => _$WatchMonthCopyWithImpl<WatchMonth>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchMonth&&(identical(other.month, month) || other.month == month));
}


@override
int get hashCode => Object.hash(runtimeType,month);

@override
String toString() {
  return 'CalendarEvent.watchMonth(month: $month)';
}


}

/// @nodoc
abstract mixin class $WatchMonthCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $WatchMonthCopyWith(WatchMonth value, $Res Function(WatchMonth) _then) = _$WatchMonthCopyWithImpl;
@useResult
$Res call({
 DateTime month
});




}
/// @nodoc
class _$WatchMonthCopyWithImpl<$Res>
    implements $WatchMonthCopyWith<$Res> {
  _$WatchMonthCopyWithImpl(this._self, this._then);

  final WatchMonth _self;
  final $Res Function(WatchMonth) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? month = null,}) {
  return _then(WatchMonth(
null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class EventsUpdated implements CalendarEvent {
  const EventsUpdated(final  Map<DateTime, List<Task>> events): _events = events;
  

 final  Map<DateTime, List<Task>> _events;
 Map<DateTime, List<Task>> get events {
  if (_events is EqualUnmodifiableMapView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_events);
}


/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventsUpdatedCopyWith<EventsUpdated> get copyWith => _$EventsUpdatedCopyWithImpl<EventsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventsUpdated&&const DeepCollectionEquality().equals(other._events, _events));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events));

@override
String toString() {
  return 'CalendarEvent.eventsUpdated(events: $events)';
}


}

/// @nodoc
abstract mixin class $EventsUpdatedCopyWith<$Res> implements $CalendarEventCopyWith<$Res> {
  factory $EventsUpdatedCopyWith(EventsUpdated value, $Res Function(EventsUpdated) _then) = _$EventsUpdatedCopyWithImpl;
@useResult
$Res call({
 Map<DateTime, List<Task>> events
});




}
/// @nodoc
class _$EventsUpdatedCopyWithImpl<$Res>
    implements $EventsUpdatedCopyWith<$Res> {
  _$EventsUpdatedCopyWithImpl(this._self, this._then);

  final EventsUpdated _self;
  final $Res Function(EventsUpdated) _then;

/// Create a copy of CalendarEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? events = null,}) {
  return _then(EventsUpdated(
null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as Map<DateTime, List<Task>>,
  ));
}


}

/// @nodoc
mixin _$CalendarState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarState()';
}


}

/// @nodoc
class $CalendarStateCopyWith<$Res>  {
$CalendarStateCopyWith(CalendarState _, $Res Function(CalendarState) __);
}


/// Adds pattern-matching-related methods to [CalendarState].
extension CalendarStatePatterns on CalendarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CalendarInitial value)?  initial,TResult Function( CalendarLoading value)?  loading,TResult Function( CalendarLoaded value)?  loaded,TResult Function( CalendarError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CalendarInitial() when initial != null:
return initial(_that);case CalendarLoading() when loading != null:
return loading(_that);case CalendarLoaded() when loaded != null:
return loaded(_that);case CalendarError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CalendarInitial value)  initial,required TResult Function( CalendarLoading value)  loading,required TResult Function( CalendarLoaded value)  loaded,required TResult Function( CalendarError value)  error,}){
final _that = this;
switch (_that) {
case CalendarInitial():
return initial(_that);case CalendarLoading():
return loading(_that);case CalendarLoaded():
return loaded(_that);case CalendarError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CalendarInitial value)?  initial,TResult? Function( CalendarLoading value)?  loading,TResult? Function( CalendarLoaded value)?  loaded,TResult? Function( CalendarError value)?  error,}){
final _that = this;
switch (_that) {
case CalendarInitial() when initial != null:
return initial(_that);case CalendarLoading() when loading != null:
return loading(_that);case CalendarLoaded() when loaded != null:
return loaded(_that);case CalendarError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( DateTime focusedDay,  DateTime selectedDay,  CalendarViewFormat format)?  loading,TResult Function( Map<DateTime, List<Task>> events,  DateTime focusedDay,  DateTime selectedDay,  CalendarViewFormat format)?  loaded,TResult Function( CalendarFailure failure,  DateTime focusedDay,  DateTime selectedDay,  CalendarViewFormat format)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CalendarInitial() when initial != null:
return initial();case CalendarLoading() when loading != null:
return loading(_that.focusedDay,_that.selectedDay,_that.format);case CalendarLoaded() when loaded != null:
return loaded(_that.events,_that.focusedDay,_that.selectedDay,_that.format);case CalendarError() when error != null:
return error(_that.failure,_that.focusedDay,_that.selectedDay,_that.format);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( DateTime focusedDay,  DateTime selectedDay,  CalendarViewFormat format)  loading,required TResult Function( Map<DateTime, List<Task>> events,  DateTime focusedDay,  DateTime selectedDay,  CalendarViewFormat format)  loaded,required TResult Function( CalendarFailure failure,  DateTime focusedDay,  DateTime selectedDay,  CalendarViewFormat format)  error,}) {final _that = this;
switch (_that) {
case CalendarInitial():
return initial();case CalendarLoading():
return loading(_that.focusedDay,_that.selectedDay,_that.format);case CalendarLoaded():
return loaded(_that.events,_that.focusedDay,_that.selectedDay,_that.format);case CalendarError():
return error(_that.failure,_that.focusedDay,_that.selectedDay,_that.format);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( DateTime focusedDay,  DateTime selectedDay,  CalendarViewFormat format)?  loading,TResult? Function( Map<DateTime, List<Task>> events,  DateTime focusedDay,  DateTime selectedDay,  CalendarViewFormat format)?  loaded,TResult? Function( CalendarFailure failure,  DateTime focusedDay,  DateTime selectedDay,  CalendarViewFormat format)?  error,}) {final _that = this;
switch (_that) {
case CalendarInitial() when initial != null:
return initial();case CalendarLoading() when loading != null:
return loading(_that.focusedDay,_that.selectedDay,_that.format);case CalendarLoaded() when loaded != null:
return loaded(_that.events,_that.focusedDay,_that.selectedDay,_that.format);case CalendarError() when error != null:
return error(_that.failure,_that.focusedDay,_that.selectedDay,_that.format);case _:
  return null;

}
}

}

/// @nodoc


class CalendarInitial implements CalendarState {
  const CalendarInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CalendarState.initial()';
}


}




/// @nodoc


class CalendarLoading implements CalendarState {
  const CalendarLoading({required this.focusedDay, required this.selectedDay, required this.format});
  

 final  DateTime focusedDay;
 final  DateTime selectedDay;
 final  CalendarViewFormat format;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarLoadingCopyWith<CalendarLoading> get copyWith => _$CalendarLoadingCopyWithImpl<CalendarLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarLoading&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.format, format) || other.format == format));
}


@override
int get hashCode => Object.hash(runtimeType,focusedDay,selectedDay,format);

@override
String toString() {
  return 'CalendarState.loading(focusedDay: $focusedDay, selectedDay: $selectedDay, format: $format)';
}


}

/// @nodoc
abstract mixin class $CalendarLoadingCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory $CalendarLoadingCopyWith(CalendarLoading value, $Res Function(CalendarLoading) _then) = _$CalendarLoadingCopyWithImpl;
@useResult
$Res call({
 DateTime focusedDay, DateTime selectedDay, CalendarViewFormat format
});




}
/// @nodoc
class _$CalendarLoadingCopyWithImpl<$Res>
    implements $CalendarLoadingCopyWith<$Res> {
  _$CalendarLoadingCopyWithImpl(this._self, this._then);

  final CalendarLoading _self;
  final $Res Function(CalendarLoading) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? focusedDay = null,Object? selectedDay = null,Object? format = null,}) {
  return _then(CalendarLoading(
focusedDay: null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as CalendarViewFormat,
  ));
}


}

/// @nodoc


class CalendarLoaded implements CalendarState {
  const CalendarLoaded({required final  Map<DateTime, List<Task>> events, required this.focusedDay, required this.selectedDay, required this.format}): _events = events;
  

 final  Map<DateTime, List<Task>> _events;
 Map<DateTime, List<Task>> get events {
  if (_events is EqualUnmodifiableMapView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_events);
}

 final  DateTime focusedDay;
 final  DateTime selectedDay;
 final  CalendarViewFormat format;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarLoadedCopyWith<CalendarLoaded> get copyWith => _$CalendarLoadedCopyWithImpl<CalendarLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarLoaded&&const DeepCollectionEquality().equals(other._events, _events)&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.format, format) || other.format == format));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events),focusedDay,selectedDay,format);

@override
String toString() {
  return 'CalendarState.loaded(events: $events, focusedDay: $focusedDay, selectedDay: $selectedDay, format: $format)';
}


}

/// @nodoc
abstract mixin class $CalendarLoadedCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory $CalendarLoadedCopyWith(CalendarLoaded value, $Res Function(CalendarLoaded) _then) = _$CalendarLoadedCopyWithImpl;
@useResult
$Res call({
 Map<DateTime, List<Task>> events, DateTime focusedDay, DateTime selectedDay, CalendarViewFormat format
});




}
/// @nodoc
class _$CalendarLoadedCopyWithImpl<$Res>
    implements $CalendarLoadedCopyWith<$Res> {
  _$CalendarLoadedCopyWithImpl(this._self, this._then);

  final CalendarLoaded _self;
  final $Res Function(CalendarLoaded) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? events = null,Object? focusedDay = null,Object? selectedDay = null,Object? format = null,}) {
  return _then(CalendarLoaded(
events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as Map<DateTime, List<Task>>,focusedDay: null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as CalendarViewFormat,
  ));
}


}

/// @nodoc


class CalendarError implements CalendarState {
  const CalendarError(this.failure, {required this.focusedDay, required this.selectedDay, required this.format});
  

 final  CalendarFailure failure;
 final  DateTime focusedDay;
 final  DateTime selectedDay;
 final  CalendarViewFormat format;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalendarErrorCopyWith<CalendarError> get copyWith => _$CalendarErrorCopyWithImpl<CalendarError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalendarError&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.focusedDay, focusedDay) || other.focusedDay == focusedDay)&&(identical(other.selectedDay, selectedDay) || other.selectedDay == selectedDay)&&(identical(other.format, format) || other.format == format));
}


@override
int get hashCode => Object.hash(runtimeType,failure,focusedDay,selectedDay,format);

@override
String toString() {
  return 'CalendarState.error(failure: $failure, focusedDay: $focusedDay, selectedDay: $selectedDay, format: $format)';
}


}

/// @nodoc
abstract mixin class $CalendarErrorCopyWith<$Res> implements $CalendarStateCopyWith<$Res> {
  factory $CalendarErrorCopyWith(CalendarError value, $Res Function(CalendarError) _then) = _$CalendarErrorCopyWithImpl;
@useResult
$Res call({
 CalendarFailure failure, DateTime focusedDay, DateTime selectedDay, CalendarViewFormat format
});


$CalendarFailureCopyWith<$Res> get failure;

}
/// @nodoc
class _$CalendarErrorCopyWithImpl<$Res>
    implements $CalendarErrorCopyWith<$Res> {
  _$CalendarErrorCopyWithImpl(this._self, this._then);

  final CalendarError _self;
  final $Res Function(CalendarError) _then;

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? focusedDay = null,Object? selectedDay = null,Object? format = null,}) {
  return _then(CalendarError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as CalendarFailure,focusedDay: null == focusedDay ? _self.focusedDay : focusedDay // ignore: cast_nullable_to_non_nullable
as DateTime,selectedDay: null == selectedDay ? _self.selectedDay : selectedDay // ignore: cast_nullable_to_non_nullable
as DateTime,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as CalendarViewFormat,
  ));
}

/// Create a copy of CalendarState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalendarFailureCopyWith<$Res> get failure {
  
  return $CalendarFailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
