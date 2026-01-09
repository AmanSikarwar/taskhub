import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:intl/intl.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../tasks/domain/entities/task.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final projectColor = _parseColor(task.projectColorCode ?? '#71717A');

    return FTappable(
      onPress: () => TaskDetailRoute(taskId: task.id).push(context),
      child: Container(
        padding: const .all(16),
        decoration: BoxDecoration(
          color: colors.backgroundCard,
          borderRadius: .circular(16),
          border: .all(color: colors.border),
        ),
        child: Row(
          children: [
            // Checkbox area
            FTappable(
              onPress: () {
                context.read<TaskBloc>().add(.completeTask(task.id));
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: .circle,
                  border: .all(color: colors.textSecondary, width: 2),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    task.title,
                    style: context.theme.typography.base.copyWith(
                      fontWeight: .w600,
                      color: colors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  if (task.projectTitle != null) ...[
                    const SizedBox(height: 4),
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
                        Text(
                          task.projectTitle!,
                          style: context.theme.typography.xs.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            if (task.dueDate != null)
              Container(
                padding: const .symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colors.backgroundSecondary,
                  borderRadius: .circular(8),
                ),
                child: Text(
                  DateFormat('MMM d').format(task.dueDate!),
                  style: context.theme.typography.xs.copyWith(
                    color: _getDueDateColor(task.dueDate!),
                    fontWeight: .w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _parseColor(String colorCode) {
    try {
      return Color(int.parse(colorCode.replaceFirst('#', '0xFF')));
    } catch (_) {
      return Colors.grey;
    }
  }

  Color _getDueDateColor(DateTime date) {
    final now = DateTime.now();
    if (date.isBefore(now.subtract(const Duration(days: 1)))) {
      return AppTheme.errorRed;
    }
    return AppTheme.textSecondary;
  }
}
