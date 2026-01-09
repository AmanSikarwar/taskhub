import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final Widget? child;
  final Color? valueColor;

  const DetailItem({
    super.key,
    required this.icon,
    required this.label,
    this.value,
    this.child,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: colors.backgroundSecondary,
            borderRadius: .circular(10),
          ),
          child: Icon(icon, size: 18, color: colors.textSecondary),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: context.theme.typography.sm.copyWith(
            color: colors.textSecondary,
          ),
        ),
        const Spacer(),
        if (child != null)
          child!
        else
          Text(
            value ?? '',
            style: context.theme.typography.sm.copyWith(
              fontWeight: .w500,
              color: valueColor ?? colors.textPrimary,
            ),
          ),
      ],
    );
  }
}
