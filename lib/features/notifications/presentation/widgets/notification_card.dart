import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/notification.dart';
import '../bloc/notification_bloc.dart';

class NotificationCard extends StatelessWidget {
  final AppNotification notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final (icon, iconColor) = _getIconForType(notification.type);

    return Dismissible(
      key: Key(notification.id),
      direction: .endToStart,
      onDismissed: (_) {
        context.read<NotificationBloc>().add(
          .deleteNotification(notification.id),
        );
      },
      background: Container(
        alignment: .centerRight,
        padding: const .only(right: 20),
        decoration: BoxDecoration(
          color: AppTheme.errorRed,
          borderRadius: .circular(16),
        ),
        child: const Icon(FIcons.trash2, color: Colors.white),
      ),
      child: FTappable(
        onPress: () {
          if (!notification.isRead) {
            context.read<NotificationBloc>().add(.markAsRead(notification.id));
          }
          _handleNotificationTap(context, notification);
        },
        child: Container(
          padding: const .all(16),
          decoration: BoxDecoration(
            color: notification.isRead
                ? colors.backgroundCard
                : AppTheme.primaryYellow.withValues(alpha: 0.1),
            borderRadius: .circular(16),
            border: .all(
              color: notification.isRead
                  ? colors.border
                  : AppTheme.primaryYellow.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            crossAxisAlignment: .start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.2),
                  borderRadius: .circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      notification.title,
                      style: context.theme.typography.sm.copyWith(
                        fontWeight: notification.isRead ? .w500 : .bold,
                        color: colors.textPrimary,
                      ),
                    ),
                    if (notification.body != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        notification.body!,
                        style: context.theme.typography.xs.copyWith(
                          color: colors.textSecondary,
                        ),
                        maxLines: 2,
                        overflow: .ellipsis,
                      ),
                    ],
                    const SizedBox(height: 6),
                    Text(
                      _formatTime(notification.createdAt),
                      style: context.theme.typography.xs.copyWith(
                        color: colors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              if (!notification.isRead)
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryYellow,
                    shape: .circle,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  (IconData, Color) _getIconForType(NotificationType type) {
    return switch (type) {
      .projectInvite => (FIcons.userPlus, AppTheme.infoBlue),
      .taskAssigned => (FIcons.clipboardList, AppTheme.infoBlue),
      .taskDueSoon => (FIcons.clock, AppTheme.warningOrange),
      .taskCompleted => (FIcons.circleCheck, AppTheme.successGreen),
      .projectUpdated => (FIcons.folder, AppTheme.infoBlue),
      .memberJoined => (FIcons.userPlus, AppTheme.successGreen),
      .reminder => (FIcons.bell, AppTheme.primaryYellow),
    };
  }

  void _handleNotificationTap(
    BuildContext context,
    AppNotification notification,
  ) {
    switch (notification.relatedEntityType) {
      case 'task':
        if (notification.relatedEntityId != null) {
          TaskDetailRoute(taskId: notification.relatedEntityId!).push(context);
        }
        break;
      case 'project':
        if (notification.relatedEntityId != null) {
          ProjectDetailRoute(
            projectId: notification.relatedEntityId!,
          ).push(context);
        }
        break;
    }
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
