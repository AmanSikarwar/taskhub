import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../../domain/entities/notification.dart';
import '../bloc/notification_bloc.dart';
import 'notification_card.dart';

class NotificationsList extends StatelessWidget {
  final List<AppNotification> notifications;

  const NotificationsList({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    if (notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: colors.backgroundCard,
                shape: .circle,
              ),
              child: Icon(FIcons.bell, size: 40, color: colors.textMuted),
            ),
            const SizedBox(height: 20),
            Text(
              'No notifications',
              style: context.theme.typography.lg.copyWith(
                fontWeight: .w600,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "You're all caught up!",
              style: context.theme.typography.sm.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
        ),
      );
    }

    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    final todayNotifications = <AppNotification>[];
    final yesterdayNotifications = <AppNotification>[];
    final olderNotifications = <AppNotification>[];

    for (final notification in notifications) {
      if (_isSameDay(notification.createdAt, today)) {
        todayNotifications.add(notification);
      } else if (_isSameDay(notification.createdAt, yesterday)) {
        yesterdayNotifications.add(notification);
      } else {
        olderNotifications.add(notification);
      }
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<NotificationBloc>().add(const .loadNotifications());
      },
      color: AppTheme.primaryYellow,
      backgroundColor: colors.backgroundCard,
      child: ListView(
        padding: const .symmetric(horizontal: 20),
        children: [
          if (todayNotifications.isNotEmpty) ...[
            const SectionHeader(title: 'Today'),
            const SizedBox(height: 12),
            ...todayNotifications.map(
              (n) => Padding(
                padding: const .only(bottom: 12),
                child: NotificationCard(notification: n),
              ),
            ),
          ],
          if (yesterdayNotifications.isNotEmpty) ...[
            const SizedBox(height: 8),
            const SectionHeader(title: 'Yesterday'),
            const SizedBox(height: 12),
            ...yesterdayNotifications.map(
              (n) => Padding(
                padding: const .only(bottom: 12),
                child: NotificationCard(notification: n),
              ),
            ),
          ],
          if (olderNotifications.isNotEmpty) ...[
            const SizedBox(height: 8),
            const SectionHeader(title: 'Earlier'),
            const SizedBox(height: 12),
            ...olderNotifications.map(
              (n) => Padding(
                padding: const .only(bottom: 12),
                child: NotificationCard(notification: n),
              ),
            ),
          ],
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
