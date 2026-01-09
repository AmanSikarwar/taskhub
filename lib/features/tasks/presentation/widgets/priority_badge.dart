import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/task.dart';

class PriorityBadge extends StatelessWidget {
  final TaskPriority priority;

  const PriorityBadge({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (priority) {
      .low => (Colors.grey, 'Low'),
      .medium => (AppTheme.infoBlue, 'Medium'),
      .high => (AppTheme.warningOrange, 'High'),
      .urgent => (AppTheme.errorRed, 'Urgent'),
    };

    return Container(
      padding: const .symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: .circular(8),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          Icon(FIcons.flag, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: context.theme.typography.xs.copyWith(
              color: color,
              fontWeight: .w500,
            ),
          ),
        ],
      ),
    );
  }
}
