import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../tasks/domain/entities/task.dart';
import 'calendar_grid.dart';
import 'selected_day_tasks.dart';
import 'weekday_header.dart';

class CalendarContent extends StatelessWidget {
  final Map<DateTime, List<Task>> events;
  final DateTime focusedDay;
  final DateTime selectedDay;

  const CalendarContent({
    super.key,
    required this.events,
    required this.focusedDay,
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      children: [
        const Padding(
          padding: .symmetric(horizontal: 20),
          child: WeekdayHeader(),
        ),
        const SizedBox(height: 8),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const .symmetric(horizontal: 20),
            child: CalendarGrid(
              events: events,
              focusedDay: focusedDay,
              selectedDay: selectedDay,
            ),
          ),
        ),
        Container(
          height: 1,
          margin: const .symmetric(horizontal: 20),
          color: colors.border,
        ),
        Expanded(
          flex: 3,
          child: SelectedDayTasks(
            selectedDay: selectedDay,
            tasks: events[_normalizeDate(selectedDay)] ?? [],
          ),
        ),
      ],
    );
  }

  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}
