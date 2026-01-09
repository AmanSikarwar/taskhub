import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/widgets/app_bottom_sheets.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../domain/entities/task.dart';
import '../bloc/task_bloc.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final projectColor = AppUtils.parseColor(
      task.projectColorCode ?? '#6366F1',
    );
    final isCompleted = task.status == .completed;

    return Dismissible(
      key: Key(task.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        return await showConfirmationBottomSheet(
          context: context,
          title: 'Delete Task',
          message: 'Are you sure you want to delete "${task.title}"?',
          confirmLabel: 'Delete',
          icon: FIcons.trash2,
        );
      },
      onDismissed: (_) {
        context.read<TaskBloc>().add(.deleteTask(task.id));
      },
      background: Container(
        alignment: .centerRight,
        padding: const .only(right: 20),
        decoration: BoxDecoration(
          color: AppTheme.errorRed,
          borderRadius: .circular(16),
        ),
        child: const Icon(FIcons.trash2, color: Colors.white),
      ),
      child: AppCard(
        onTap: () => TaskDetailRoute(taskId: task.id).push(context),
        child: Row(
          children: [
            FTappable(
              onPress: () {
                if (isCompleted) {
                  context.read<TaskBloc>().add(.reopenTask(task.id));
                } else {
                  context.read<TaskBloc>().add(.completeTask(task.id));
                }
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: isCompleted
                      ? AppTheme.successGreen
                      : Colors.transparent,
                  border: .all(
                    color: isCompleted ? AppTheme.successGreen : colors.border,
                    width: 2,
                  ),
                ),
                child: isCompleted
                    ? const Icon(FIcons.check, size: 14, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    task.title,
                    style: context.theme.typography.sm.copyWith(
                      fontWeight: .w600,
                      color: isCompleted
                          ? colors.textMuted
                          : colors.textPrimary,
                      decoration: isCompleted ? .lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: projectColor,
                          shape: .circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          task.projectTitle ?? 'Personal',
                          maxLines: 1,
                          overflow: .ellipsis,
                          style: context.theme.typography.xs.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ),
                      if (task.dueDate != null) ...[
                        const SizedBox(width: 8),
                        Icon(
                          FIcons.calendar,
                          size: 12,
                          color: AppUtils.getDueDateColor(
                            task.dueDate!,
                            isCompleted: isCompleted,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          AppUtils.formatShortDueDate(task.dueDate!),
                          style: context.theme.typography.xs.copyWith(
                            color: AppUtils.getDueDateColor(
                              task.dueDate!,
                              isCompleted: isCompleted,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            _buildPriorityBadge(context, task.priority),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityBadge(BuildContext context, TaskPriority priority) {
    final (color, icon) = switch (priority) {
      .urgent => (Colors.red, FIcons.triangleAlert),
      .high => (Colors.orange, FIcons.arrowUp),
      .medium => (null, null),
      .low => (null, null),
    };

    if (icon == null) return const SizedBox.shrink();

    return Container(
      padding: const .all(6),
      decoration: BoxDecoration(
        color: color!.withValues(alpha: 0.15),
        borderRadius: .circular(8),
      ),
      child: Icon(icon, color: color, size: 16),
    );
  }
}
