import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class StatusOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const StatusOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FTappable(
      onPress: onTap,
      child: Container(
        padding: const .symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.2)
              : colors.backgroundSecondary,
          borderRadius: .circular(20),
          border: isSelected ? .all(color: color) : null,
        ),
        child: Text(
          label,
          style: context.theme.typography.sm.copyWith(
            color: isSelected ? color : colors.textSecondary,
            fontWeight: isSelected ? .w600 : .normal,
          ),
        ),
      ),
    );
  }
}
