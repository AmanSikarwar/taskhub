import '../../../tasks/domain/entities/task.dart';
import '../entities/calendar_failure.dart';

abstract class CalendarRepository {
  Future<({Map<DateTime, List<Task>>? events, CalendarFailure? failure})>
  getEventsForMonth(DateTime month);

  Future<({Map<DateTime, List<Task>>? events, CalendarFailure? failure})>
  getEventsForDateRange({required DateTime start, required DateTime end});

  Stream<Map<DateTime, List<Task>>> watchEventsForMonth(DateTime month);
}
