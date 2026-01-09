import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';

class WeekdayHeader extends StatelessWidget {
  static const _weekdays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  const WeekdayHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Row(
      children: _weekdays
          .map(
            (day) => Expanded(
              child: Center(
                child: Text(
                  day,
                  style: context.theme.typography.xs.copyWith(
                    fontWeight: .w600,
                    color: colors.textSecondary,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
