import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class DayCell extends StatelessWidget {
  final int day;
  final bool isSelected;
  final bool isToday;
  final int taskCount;
  final bool hasCompletedTasks;
  final VoidCallback onTap;

  const DayCell({
    super.key,
    required this.day,
    required this.isSelected,
    required this.isToday,
    required this.taskCount,
    required this.hasCompletedTasks,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FTappable(
      onPress: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primaryYellow
              : isToday
              ? AppTheme.primaryYellow.withValues(alpha: 0.2)
              : colors.backgroundCard,
          borderRadius: .circular(10),
          border: .all(
            color: isToday && !isSelected
                ? AppTheme.primaryYellow
                : colors.border,
          ),
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              '$day',
              style: context.theme.typography.sm.copyWith(
                fontWeight: isToday || isSelected ? .bold : null,
                color: isSelected
                    ? AppTheme.backgroundDark
                    : isToday
                    ? AppTheme.primaryYellow
                    : colors.textPrimary,
              ),
            ),
            if (taskCount > 0) ...[
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.backgroundDark
                          : hasCompletedTasks
                          ? AppTheme.successGreen
                          : AppTheme.primaryYellow,
                      shape: .circle,
                    ),
                  ),
                  if (taskCount > 1) ...[
                    const SizedBox(width: 2),
                    Text(
                      '+${taskCount - 1}',
                      style: context.theme.typography.xs.copyWith(
                        fontSize: 8,
                        color: isSelected
                            ? AppTheme.backgroundDark
                            : colors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
