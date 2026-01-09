import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class EmptyStateCard extends StatelessWidget {
  final String message;
  final IconData icon;

  const EmptyStateCard({super.key, required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      padding: const .all(32),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.backgroundCard,
        borderRadius: .circular(16),
        border: .all(color: colors.border, style: .solid),
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Icon(icon, size: 32, color: colors.textMuted),
          const SizedBox(height: 12),
          Text(
            message,
            style: context.theme.typography.sm.copyWith(
              color: colors.textMuted,
            ),
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}
