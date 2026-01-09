import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../tasks/domain/entities/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final projectColor = AppUtils.parseColor(
      task.projectColorCode ?? '#FFC107',
    );

    return FTappable(
      onPress: () => TaskDetailRoute(taskId: task.id).push(context),
      child: Container(
        padding: const .all(12),
        decoration: BoxDecoration(
          color: colors.backgroundCard,
          borderRadius: .circular(12),
          border: .all(color: colors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: task.status == .completed
                    ? AppTheme.successGreen.withValues(alpha: 0.2)
                    : colors.backgroundSecondary,
                borderRadius: .circular(6),
              ),
              child: Icon(
                task.status == .completed ? FIcons.check : FIcons.circle,
                size: 14,
                color: task.status == .completed
                    ? AppTheme.successGreen
                    : colors.textSecondary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    task.title,
                    style: context.theme.typography.sm.copyWith(
                      fontWeight: .w500,
                      color: colors.textPrimary,
                      decoration: task.status == .completed
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  if (task.projectTitle != null) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: projectColor,
                            shape: .circle,
                          ),
                        ),
                        const SizedBox(width: 4),
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
            if (task.priority == .high || task.priority == .urgent)
              Container(
                padding: const .symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: task.priority == .urgent
                      ? AppTheme.errorRed.withValues(alpha: 0.2)
                      : AppTheme.warningOrange.withValues(alpha: 0.2),
                  borderRadius: .circular(4),
                ),
                child: Text(
                  task.priority == .urgent ? '!' : 'H',
                  style: context.theme.typography.xs.copyWith(
                    fontWeight: .bold,
                    color: task.priority == .urgent
                        ? AppTheme.errorRed
                        : AppTheme.warningOrange,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
