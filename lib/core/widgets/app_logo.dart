import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import '../theme/app_theme.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool showText;

  const AppLogo({super.key, this.size = 40, this.showText = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppTheme.primaryYellow,
            borderRadius: .circular(size * 0.25),
          ),
          child: Icon(
            FIcons.circleCheck,
            color: AppTheme.backgroundDark,
            size: size * 0.6,
          ),
        ),
        if (showText) ...[
          const SizedBox(width: 12),
          Text(
            'TaskHub',
            style: context.theme.typography.xl.copyWith(
              fontWeight: .bold,
              color: context.appColors.textPrimary,
            ),
          ),
        ],
      ],
    );
  }
}
