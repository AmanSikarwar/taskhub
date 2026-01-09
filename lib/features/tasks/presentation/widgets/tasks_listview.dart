import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/animated_list_item.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../domain/entities/task.dart';
import '../bloc/task_bloc.dart';
import 'task_tile.dart';

class TasksListView extends StatelessWidget {
  final List<Task> tasks;

  const TasksListView({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colors.backgroundCard,
                shape: .circle,
              ),
              child: Icon(
                FIcons.circleCheck,
                size: 40,
                color: colors.textMuted,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'No tasks found',
              style: context.theme.typography.lg.copyWith(
                fontWeight: .w600,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tasks assigned to you will appear here',
              style: context.theme.typography.sm.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    final overdue = <Task>[];
    final today = <Task>[];
    final upcoming = <Task>[];
    final noDueDate = <Task>[];

    final now = DateTime.now();
    final todayDate = DateTime(now.year, now.month, now.day);

    for (final task in tasks) {
      if (task.dueDate == null) {
        noDueDate.add(task);
      } else {
        final dueDate = DateTime(
          task.dueDate!.year,
          task.dueDate!.month,
          task.dueDate!.day,
        );

        if (dueDate.isBefore(todayDate) && task.status != .completed) {
          overdue.add(task);
        } else if (dueDate == todayDate) {
          today.add(task);
        } else {
          upcoming.add(task);
        }
      }
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<TaskBloc>().add(const .loadMyTasks());
      },
      color: AppTheme.primaryYellow,
      backgroundColor: colors.backgroundCard,
      child: ListView(
        padding: const .symmetric(horizontal: 16, vertical: 20),
        children: [
          if (overdue.isNotEmpty) ...[
            SectionTitle(
              title: 'Overdue',
              count: overdue.length,
              color: AppTheme.errorRed,
            ),
            ...overdue.asMap().entries.map(
              (e) => AnimatedListItem(
                index: e.key,
                child: Padding(
                  padding: const .only(bottom: 12),
                  child: TaskTile(task: e.value),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
          if (today.isNotEmpty) ...[
            SectionTitle(
              title: 'Today',
              count: today.length,
              color: AppTheme.warningOrange,
            ),
            ...today.asMap().entries.map(
              (e) => AnimatedListItem(
                index: e.key + overdue.length,
                child: Padding(
                  padding: const .only(bottom: 12),
                  child: TaskTile(task: e.value),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
          if (upcoming.isNotEmpty) ...[
            SectionTitle(
              title: 'Upcoming',
              count: upcoming.length,
              color: AppTheme.infoBlue,
            ),
            ...upcoming.asMap().entries.map(
              (e) => AnimatedListItem(
                index: e.key + overdue.length + today.length,
                child: Padding(
                  padding: const .only(bottom: 12),
                  child: TaskTile(task: e.value),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
          if (noDueDate.isNotEmpty) ...[
            SectionTitle(
              title: 'No Due Date',
              count: noDueDate.length,
              color: AppTheme.textMuted,
            ),
            ...noDueDate.asMap().entries.map(
              (e) => AnimatedListItem(
                index: e.key + overdue.length + today.length + upcoming.length,
                child: Padding(
                  padding: const .only(bottom: 12),
                  child: TaskTile(task: e.value),
                ),
              ),
            ),
          ],
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
