import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../tasks/domain/entities/task.dart';
import 'task_item.dart';

class SelectedDayTasks extends StatelessWidget {
  final DateTime selectedDay;
  final List<Task> tasks;

  const SelectedDayTasks({
    super.key,
    required this.selectedDay,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const .all(20),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                '${AppUtils.getMonthName(selectedDay.month, short: true)} ${selectedDay.day}, ${selectedDay.year}',
                style: context.theme.typography.base.copyWith(
                  fontWeight: .w600,
                  color: colors.textPrimary,
                ),
              ),
              Text(
                '${tasks.length} ${tasks.length == 1 ? 'task' : 'tasks'}',
                style: context.theme.typography.sm.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (tasks.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    Icon(FIcons.calendar, size: 32, color: colors.textMuted),
                    const SizedBox(height: 8),
                    Text(
                      'No tasks for this day',
                      style: context.theme.typography.sm.copyWith(
                        color: colors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.separated(
                itemCount: tasks.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskItem(task: task);
                },
              ),
            ),
        ],
      ),
    );
  }
}
