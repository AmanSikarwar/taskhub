import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class RoleOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Expanded(
      child: FTappable(
        onPress: onTap,
        child: Container(
          padding: const .symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.primaryYellow
                : colors.backgroundSecondary,
            borderRadius: .circular(10),
          ),
          child: Center(
            child: Text(
              label,
              style: context.theme.typography.sm.copyWith(
                color: isSelected
                    ? AppTheme.backgroundDark
                    : colors.textSecondary,
                fontWeight: isSelected ? .w600 : .normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
