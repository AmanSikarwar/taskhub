import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      padding: const .all(16),
      decoration: BoxDecoration(
        color: colors.backgroundCard,
        borderRadius: .circular(16),
        border: .all(color: colors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Container(
            padding: const .all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: .circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: context.theme.typography.xl.copyWith(
              fontWeight: .bold,
              color: colors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: context.theme.typography.xs.copyWith(
              color: colors.textSecondary,
              fontWeight: .w500,
            ),
          ),
        ],
      ),
    );
  }
}
