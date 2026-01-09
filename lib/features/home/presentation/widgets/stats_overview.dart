import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../tasks/domain/entities/task.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';
import 'stat_card.dart';

class StatsOverview extends StatelessWidget {
  const StatsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        final tasks = state.maybeWhen(
          tasksLoaded: (tasks) => tasks,
          orElse: () => <Task>[],
        );

        final now = DateTime.now();
        final todayTasks = tasks.where((t) {
          if (t.dueDate == null) return false;
          final due = t.dueDate!;
          return due.year == now.year &&
              due.month == now.month &&
              due.day == now.day &&
              t.status != .completed;
        }).length;

        final pendingTasks = tasks.where((t) => t.status != .completed).length;

        final completedTasks = tasks
            .where((t) => t.status == .completed)
            .length;

        return Row(
          children: [
            Expanded(
              child: StatCard(
                label: 'Due Today',
                value: '$todayTasks',
                icon: FIcons.calendarClock,
                color: AppTheme.primaryYellow,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                label: 'Pending',
                value: '$pendingTasks',
                icon: FIcons.listTodo,
                color: AppTheme.infoBlue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: StatCard(
                label: 'Done',
                value: '$completedTasks',
                icon: FIcons.checkCheck,
                color: AppTheme.successGreen,
              ),
            ),
          ],
        );
      },
    );
  }
}
