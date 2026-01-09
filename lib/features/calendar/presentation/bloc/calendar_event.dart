part of 'calendar_bloc.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.loadMonth(DateTime month) = LoadMonth;

  const factory CalendarEvent.changeFocusedDay(DateTime focusedDay) =
      ChangeFocusedDay;

  const factory CalendarEvent.changeSelectedDay(DateTime selectedDay) =
      ChangeSelectedDay;

  const factory CalendarEvent.toggleCalendarFormat() = ToggleCalendarFormat;

  const factory CalendarEvent.watchMonth(DateTime month) = WatchMonth;

  const factory CalendarEvent.eventsUpdated(Map<DateTime, List<Task>> events) =
      EventsUpdated;
}
