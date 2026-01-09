import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/app_utils.dart';
import '../bloc/calendar_bloc.dart';

class CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final CalendarViewFormat format;

  const CalendarHeader({
    super.key,
    required this.focusedDay,
    required this.format,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const .all(20),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Title row
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                'Schedule',
                style: context.theme.typography.xl.copyWith(
                  fontWeight: .bold,
                  color: colors.textPrimary,
                ),
              ),
              Row(
                children: [
                  FTappable(
                    onPress: () {
                      context.read<CalendarBloc>().add(
                        const .toggleCalendarFormat(),
                      );
                    },
                    child: Container(
                      padding: const .all(10),
                      decoration: BoxDecoration(
                        color: colors.backgroundCard,
                        borderRadius: .circular(10),
                        border: .all(color: colors.border),
                      ),
                      child: Icon(
                        format == .month ? FIcons.layoutGrid : FIcons.calendar,
                        color: colors.textSecondary,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FTappable(
                    onPress: () {
                      final now = DateTime.now();
                      context.read<CalendarBloc>()
                        ..add(.changeSelectedDay(now))
                        ..add(.loadMonth(now));
                    },
                    child: Container(
                      padding: const .all(10),
                      decoration: BoxDecoration(
                        color: colors.backgroundCard,
                        borderRadius: .circular(10),
                        border: .all(color: colors.border),
                      ),
                      child: Icon(
                        FIcons.calendarDays,
                        color: colors.textSecondary,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const .symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colors.backgroundCard,
              borderRadius: .circular(12),
              border: .all(color: colors.border),
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                FTappable(
                  onPress: () {
                    final newMonth = DateTime(
                      focusedDay.year,
                      focusedDay.month - 1,
                    );
                    context.read<CalendarBloc>().add(.loadMonth(newMonth));
                  },
                  child: Container(
                    padding: const .all(8),
                    decoration: BoxDecoration(
                      color: colors.backgroundSecondary,
                      borderRadius: .circular(8),
                    ),
                    child: Icon(
                      FIcons.chevronLeft,
                      color: colors.textSecondary,
                      size: 18,
                    ),
                  ),
                ),
                Text(
                  '${AppUtils.getMonthName(focusedDay.month)} ${focusedDay.year}',
                  style: context.theme.typography.base.copyWith(
                    fontWeight: .w600,
                    color: colors.textPrimary,
                  ),
                ),
                FTappable(
                  onPress: () {
                    final newMonth = DateTime(
                      focusedDay.year,
                      focusedDay.month + 1,
                    );
                    context.read<CalendarBloc>().add(.loadMonth(newMonth));
                  },
                  child: Container(
                    padding: const .all(8),
                    decoration: BoxDecoration(
                      color: colors.backgroundSecondary,
                      borderRadius: .circular(8),
                    ),
                    child: Icon(
                      FIcons.chevronRight,
                      color: colors.textSecondary,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
