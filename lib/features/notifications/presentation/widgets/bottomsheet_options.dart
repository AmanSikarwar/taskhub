import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class BottomSheetOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  const BottomSheetOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final color = isDestructive ? AppTheme.errorRed : colors.textPrimary;

    return FTappable(
      onPress: onTap,
      child: Padding(
        padding: const .symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 22, color: color),
            const SizedBox(width: 16),
            Text(
              label,
              style: context.theme.typography.base.copyWith(
                color: color,
                fontWeight: .w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
