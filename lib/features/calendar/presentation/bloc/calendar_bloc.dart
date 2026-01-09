import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../tasks/domain/entities/task.dart';
import '../../domain/entities/calendar_failure.dart';
import '../../domain/repositories/calendar_repository.dart';

part 'calendar_bloc.freezed.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';

@injectable
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CalendarRepository _calendarRepository;
  StreamSubscription<Map<DateTime, List<Task>>>? _eventsSubscription;

  CalendarBloc(this._calendarRepository) : super(const .initial()) {
    on<LoadMonth>(_onLoadMonth);
    on<ChangeFocusedDay>(_onChangeFocusedDay);
    on<ChangeSelectedDay>(_onChangeSelectedDay);
    on<ToggleCalendarFormat>(_onToggleCalendarFormat);
    on<WatchMonth>(_onWatchMonth);
    on<EventsUpdated>(_onEventsUpdated);
  }

  Future<void> _onLoadMonth(
    LoadMonth event,
    Emitter<CalendarState> emit,
  ) async {
    emit(
      .loading(
        focusedDay: event.month,
        selectedDay: state.selectedDay,
        format: state.format,
      ),
    );

    final result = await _calendarRepository.getEventsForMonth(event.month);

    if (result.failure != null) {
      emit(
        .error(
          result.failure!,
          focusedDay: event.month,
          selectedDay: state.selectedDay,
          format: state.format,
        ),
      );
    } else {
      emit(
        .loaded(
          events: result.events ?? {},
          focusedDay: event.month,
          selectedDay: state.selectedDay,
          format: state.format,
        ),
      );
    }
  }

  void _onChangeFocusedDay(
    ChangeFocusedDay event,
    Emitter<CalendarState> emit,
  ) {
    final currentMonth = state.focusedDay;
    final newMonth = event.focusedDay;

    if (currentMonth.year != newMonth.year ||
        currentMonth.month != newMonth.month) {
      add(.loadMonth(newMonth));
    } else {
      emit(state.copyWithFocusedDay(newMonth));
    }
  }

  void _onChangeSelectedDay(
    ChangeSelectedDay event,
    Emitter<CalendarState> emit,
  ) {
    emit(state.copyWithSelectedDay(event.selectedDay));
  }

  void _onToggleCalendarFormat(
    ToggleCalendarFormat event,
    Emitter<CalendarState> emit,
  ) {
    final newFormat = state.format == .month
        ? CalendarViewFormat.week
        : CalendarViewFormat.month;
    emit(state.copyWithFormat(newFormat));
  }

  void _onWatchMonth(WatchMonth event, Emitter<CalendarState> emit) {
    _eventsSubscription?.cancel();
    _eventsSubscription = _calendarRepository
        .watchEventsForMonth(event.month)
        .listen((events) => add(.eventsUpdated(events)));
  }

  void _onEventsUpdated(EventsUpdated event, Emitter<CalendarState> emit) {
    emit(
      .loaded(
        events: event.events,
        focusedDay: state.focusedDay,
        selectedDay: state.selectedDay,
        format: state.format,
      ),
    );
  }

  @override
  Future<void> close() {
    _eventsSubscription?.cancel();
    return super.close();
  }
}

enum CalendarViewFormat { month, week }

extension CalendarStateX on CalendarState {
  DateTime get focusedDay => when(
    initial: () => DateTime.now(),
    loading: (focusedDay, selectedDay, format) => focusedDay,
    loaded: (events, focusedDay, selectedDay, format) => focusedDay,
    error: (failure, focusedDay, selectedDay, format) => focusedDay,
  );

  DateTime get selectedDay => when(
    initial: () => DateTime.now(),
    loading: (focusedDay, selectedDay, format) => selectedDay,
    loaded: (events, focusedDay, selectedDay, format) => selectedDay,
    error: (failure, focusedDay, selectedDay, format) => selectedDay,
  );

  CalendarViewFormat get format => when(
    initial: () => .month,
    loading: (focusedDay, selectedDay, format) => format,
    loaded: (events, focusedDay, selectedDay, format) => format,
    error: (failure, focusedDay, selectedDay, format) => format,
  );

  Map<DateTime, List<Task>> get events => maybeWhen(
    loaded: (events, focusedDay, selectedDay, format) => events,
    orElse: () => {},
  );

  CalendarState copyWithFocusedDay(DateTime focusedDay) => when(
    initial: () => .loading(
      focusedDay: focusedDay,
      selectedDay: DateTime.now(),
      format: .month,
    ),
    loading: (_, selectedDay, format) => .loading(
      focusedDay: focusedDay,
      selectedDay: selectedDay,
      format: format,
    ),
    loaded: (events, _, selectedDay, format) => .loaded(
      events: events,
      focusedDay: focusedDay,
      selectedDay: selectedDay,
      format: format,
    ),
    error: (failure, _, selectedDay, format) => .error(
      failure,
      focusedDay: focusedDay,
      selectedDay: selectedDay,
      format: format,
    ),
  );

  CalendarState copyWithSelectedDay(DateTime selectedDay) => when(
    initial: () => .loading(
      focusedDay: DateTime.now(),
      selectedDay: selectedDay,
      format: .month,
    ),
    loading: (focusedDay, _, format) => .loading(
      focusedDay: focusedDay,
      selectedDay: selectedDay,
      format: format,
    ),
    loaded: (events, focusedDay, _, format) => .loaded(
      events: events,
      focusedDay: focusedDay,
      selectedDay: selectedDay,
      format: format,
    ),
    error: (failure, focusedDay, _, format) => .error(
      failure,
      focusedDay: focusedDay,
      selectedDay: selectedDay,
      format: format,
    ),
  );

  CalendarState copyWithFormat(CalendarViewFormat format) => when(
    initial: () => .loading(
      focusedDay: DateTime.now(),
      selectedDay: DateTime.now(),
      format: format,
    ),
    loading: (focusedDay, selectedDay, _) => .loading(
      focusedDay: focusedDay,
      selectedDay: selectedDay,
      format: format,
    ),
    loaded: (events, focusedDay, selectedDay, _) => .loaded(
      events: events,
      focusedDay: focusedDay,
      selectedDay: selectedDay,
      format: format,
    ),
    error: (failure, focusedDay, selectedDay, _) => .error(
      failure,
      focusedDay: focusedDay,
      selectedDay: selectedDay,
      format: format,
    ),
  );
}
