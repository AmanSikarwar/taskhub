import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../tasks/domain/entities/task.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final String projectId;

  const TaskCard({super.key, required this.task, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final isCompleted = task.status == .completed;

    return FTappable(
      onPress: () => TaskDetailRoute(taskId: task.id).push(context),
      child: Container(
        padding: const .all(16),
        decoration: BoxDecoration(
          color: colors.backgroundCard,
          borderRadius: .circular(12),
          border: .all(color: colors.border),
        ),
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
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? AppTheme.successGreen.withValues(alpha: 0.2)
                      : colors.backgroundSecondary,
                  borderRadius: .circular(8),
                  border: .all(
                    color: isCompleted ? AppTheme.successGreen : colors.border,
                  ),
                ),
                child: isCompleted
                    ? const Icon(
                        FIcons.check,
                        size: 16,
                        color: AppTheme.successGreen,
                      )
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
                      fontWeight: .w500,
                      color: colors.textPrimary,
                      decoration: isCompleted ? .lineThrough : null,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  if (task.dueDate != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          FIcons.calendar,
                          size: 12,
                          color: _getDueDateColor(task.dueDate!, task.status),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatDueDate(task.dueDate!),
                          style: context.theme.typography.xs.copyWith(
                            color: _getDueDateColor(task.dueDate!, task.status),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            if (task.priority == .high || task.priority == .urgent)
              Container(
                padding: const .symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: task.priority == .urgent
                      ? AppTheme.errorRed.withValues(alpha: 0.2)
                      : AppTheme.warningOrange.withValues(alpha: 0.2),
                  borderRadius: .circular(6),
                ),
                child: Row(
                  mainAxisSize: .min,
                  children: [
                    Icon(
                      FIcons.flag,
                      size: 12,
                      color: task.priority == .urgent
                          ? AppTheme.errorRed
                          : AppTheme.warningOrange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      task.priority == .urgent ? 'Urgent' : 'High',
                      style: context.theme.typography.xs.copyWith(
                        color: task.priority == .urgent
                            ? AppTheme.errorRed
                            : AppTheme.warningOrange,
                        fontWeight: .w500,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getDueDateColor(DateTime dueDate, TaskStatus status) {
    if (status == .completed) return Colors.grey;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);
    if (due.isBefore(today)) return AppTheme.errorRed;
    if (due == today) return AppTheme.warningOrange;
    return Colors.grey;
  }

  String _formatDueDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(date.year, date.month, date.day);
    final diff = due.difference(today).inDays;
    if (diff < 0) return 'Overdue';
    if (diff == 0) return 'Due today';
    if (diff == 1) return 'Tomorrow';
    return '${date.day}/${date.month}/${date.year}';
  }
}
