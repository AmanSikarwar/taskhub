import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class ProfileSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ProfileSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          title,
          style: context.theme.typography.sm.copyWith(
            fontWeight: .w600,
            color: AppTheme.primaryYellow,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: colors.backgroundCard,
            borderRadius: .circular(16),
            border: .all(color: colors.border),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}
