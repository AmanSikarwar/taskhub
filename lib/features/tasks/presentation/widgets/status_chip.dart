import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/task.dart';

class StatusChip extends StatelessWidget {
  final TaskStatus status;

  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, label) = switch (status) {
      .todo => (Colors.grey, 'To Do'),
      .inProgress => (AppTheme.infoBlue, 'In Progress'),
      .completed => (AppTheme.successGreen, 'Completed'),
      .cancelled => (AppTheme.errorRed, 'Cancelled'),
    };

    return Container(
      padding: const .symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: .circular(20),
      ),
      child: Text(
        label,
        style: context.theme.typography.xs.copyWith(
          color: color,
          fontWeight: .w600,
        ),
      ),
    );
  }
}
