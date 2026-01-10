import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/error_messages.dart';
import '../bloc/calendar_bloc.dart';
import '../widgets/calendar_header.dart';
import '../widgets/claendar_content.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CalendarBloc>()
        ..add(.loadMonth(DateTime.now()))
        ..add(.watchMonth(DateTime.now())),
      child: const CalendarView(),
    );
  }
}

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = AppTheme.isDesktop(screenWidth);
    final maxWidth = isDesktop ? 900.0 : double.infinity;

    return FScaffold(
      childPad: false,
      child: Container(
        color: colors.background,
        child: SafeArea(
          bottom: false,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: BlocBuilder<CalendarBloc, CalendarState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      CalendarHeader(
                        focusedDay: state.focusedDay,
                        format: state.format,
                      ),
                      Expanded(
                        child: state.maybeWhen(
                          loading: (_, _, _) => Center(
                            child: CircularProgressIndicator(
                              color: AppTheme.primaryYellow,
                              backgroundColor: colors.backgroundSecondary,
                            ),
                          ),
                          loaded: (events, focusedDay, selectedDay, format) =>
                              CalendarContent(
                                events: events,
                                focusedDay: focusedDay,
                                selectedDay: selectedDay,
                              ),
                          error: (failure, _, _, _) => Center(
                            child: Column(
                              mainAxisSize: .min,
                              children: [
                                Icon(
                                  FIcons.circleAlert,
                                  size: 48,
                                  color: colors.textMuted,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  ErrorMessages.fromCalendarFailure(failure),
                                  style: context.theme.typography.base.copyWith(
                                    color: colors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          orElse: () => Center(
                            child: CircularProgressIndicator(
                              color: AppTheme.primaryYellow,
                              backgroundColor: colors.backgroundSecondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
