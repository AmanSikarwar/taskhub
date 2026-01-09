import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../tasks/domain/entities/task.dart';
import '../bloc/calendar_bloc.dart';
import 'day_cell.dart';

class CalendarGrid extends StatelessWidget {
  final Map<DateTime, List<Task>> events;
  final DateTime focusedDay;
  final DateTime selectedDay;

  const CalendarGrid({
    super.key,
    required this.events,
    required this.focusedDay,
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(focusedDay.year, focusedDay.month + 1, 0).day;
    final firstDayOfMonth = DateTime(focusedDay.year, focusedDay.month, 1);
    final startingWeekday = firstDayOfMonth.weekday % 7;

    final days = <Widget>[];
    for (var i = 0; i < startingWeekday; i++) {
      days.add(const SizedBox.shrink());
    }

    for (var day = 1; day <= daysInMonth; day++) {
      final date = DateTime(focusedDay.year, focusedDay.month, day);
      final normalizedDate = DateTime(date.year, date.month, date.day);
      final tasksForDay = events[normalizedDate] ?? [];
      final isSelected = _isSameDay(date, selectedDay);
      final isToday = _isSameDay(date, DateTime.now());

      days.add(
        DayCell(
          day: day,
          isSelected: isSelected,
          isToday: isToday,
          taskCount: tasksForDay.length,
          hasCompletedTasks: tasksForDay.any((t) => t.status == .completed),
          onTap: () {
            context.read<CalendarBloc>().add(.changeSelectedDay(date));
          },
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 7,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      childAspectRatio: 1.2,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: days,
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
