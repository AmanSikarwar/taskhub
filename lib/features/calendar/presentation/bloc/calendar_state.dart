part of 'calendar_bloc.dart';

@freezed
sealed class CalendarState with _$CalendarState {
  const factory CalendarState.initial() = CalendarInitial;

  const factory CalendarState.loading({
    required DateTime focusedDay,
    required DateTime selectedDay,
    required CalendarViewFormat format,
  }) = CalendarLoading;

  const factory CalendarState.loaded({
    required Map<DateTime, List<Task>> events,
    required DateTime focusedDay,
    required DateTime selectedDay,
    required CalendarViewFormat format,
  }) = CalendarLoaded;

  const factory CalendarState.error(
    CalendarFailure failure, {
    required DateTime focusedDay,
    required DateTime selectedDay,
    required CalendarViewFormat format,
  }) = CalendarError;
}
