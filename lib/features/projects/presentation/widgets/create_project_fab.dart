import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class CreateProjectFab extends StatelessWidget {
  final VoidCallback onTap;

  const CreateProjectFab({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FTappable(
      onPress: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppTheme.primaryYellow,
          borderRadius: .circular(16),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryYellow.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          FIcons.plus,
          color: AppTheme.backgroundDark,
          size: 24,
        ),
      ),
    );
  }
}
