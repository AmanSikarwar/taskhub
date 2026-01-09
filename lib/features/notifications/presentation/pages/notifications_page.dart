import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/error_messages.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../bloc/notification_bloc.dart';
import '../widgets/notification_header.dart';
import '../widgets/notifications_list.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NotificationBloc>()
        ..add(const .loadNotifications())
        ..add(const .watchNotifications()),
      child: const NotificationsView(),
    );
  }
}

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = AppTheme.isDesktop(screenWidth);
    final maxWidth = isDesktop ? 700.0 : double.infinity;

    return FScaffold(
      childPad: false,
      child: Container(
        color: colors.background,
        child: SafeArea(
          bottom: false,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Column(
                children: [
                  const NotificationHeader(),
                  Expanded(
                    child: BlocBuilder<NotificationBloc, NotificationState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: (_) => Center(
                            child: CircularProgressIndicator(
                              color: AppTheme.primaryYellow,
                              backgroundColor: colors.backgroundSecondary,
                            ),
                          ),
                          loaded: (notifications, unreadCount) =>
                              NotificationsList(notifications: notifications),
                          error: (failure, _) => ErrorState(
                            message: ErrorMessages.fromNotificationFailure(
                              failure,
                            ),
                            onRetry: () {
                              context.read<NotificationBloc>().add(
                                const NotificationEvent.loadNotifications(),
                              );
                            },
                          ),
                          orElse: () => Center(
                            child: CircularProgressIndicator(
                              color: AppTheme.primaryYellow,
                              backgroundColor: colors.backgroundSecondary,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
