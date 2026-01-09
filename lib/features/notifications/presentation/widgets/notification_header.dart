import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../bloc/notification_bloc.dart';
import 'bottomsheet_options.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const .all(20),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(
            'Notifications',
            style: context.theme.typography.xl.copyWith(
              fontWeight: .bold,
              color: colors.textPrimary,
            ),
          ),
          Row(
            children: [
              FTappable(
                onPress: () {
                  context.read<NotificationBloc>().add(const .markAllAsRead());
                },
                child: Container(
                  padding: const .all(10),
                  decoration: BoxDecoration(
                    color: colors.backgroundCard,
                    borderRadius: .circular(10),
                    border: .all(color: colors.border),
                  ),
                  child: Icon(
                    FIcons.checkCheck,
                    color: colors.textSecondary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              FTappable(
                onPress: () => _showOptionsSheet(context),
                child: Container(
                  padding: const .all(10),
                  decoration: BoxDecoration(
                    color: colors.backgroundCard,
                    borderRadius: .circular(10),
                    border: .all(color: colors.border),
                  ),
                  child: Icon(
                    FIcons.ellipsisVertical,
                    color: colors.textSecondary,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showOptionsSheet(BuildContext context) {
    final colors = context.appColors;

    showModalBottomSheet(
      context: context,
      backgroundColor: colors.backgroundCard,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: .circular(20)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const .symmetric(vertical: 8),
          child: Column(
            mainAxisSize: .min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const .only(bottom: 16),
                decoration: BoxDecoration(
                  color: colors.border,
                  borderRadius: .circular(2),
                ),
              ),
              BottomSheetOption(
                icon: FIcons.checkCheck,
                label: 'Mark all as read',
                onTap: () {
                  Navigator.pop(sheetContext);
                  context.read<NotificationBloc>().add(const .markAllAsRead());
                },
              ),
              BottomSheetOption(
                icon: FIcons.trash2,
                label: 'Delete all notifications',
                isDestructive: true,
                onTap: () {
                  Navigator.pop(sheetContext);
                  _showDeleteAllConfirmation(context);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteAllConfirmation(BuildContext context) {
    final colors = context.appColors;

    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: colors.backgroundCard,
        shape: RoundedRectangleBorder(borderRadius: .circular(20)),
        child: Padding(
          padding: const .all(24),
          child: Column(
            mainAxisSize: .min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppTheme.errorRed.withValues(alpha: 0.2),
                  shape: .circle,
                ),
                child: const Icon(
                  FIcons.trash2,
                  color: AppTheme.errorRed,
                  size: 32,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Delete All',
                style: context.theme.typography.lg.copyWith(
                  fontWeight: .bold,
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Are you sure you want to delete all notifications?',
                textAlign: .center,
                style: context.theme.typography.sm.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: FButton(
                      onPress: () => Navigator.pop(dialogContext),
                      style: FButtonStyle.outline(),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FTappable(
                      onPress: () {
                        context.read<NotificationBloc>().add(
                          const .deleteAllNotifications(),
                        );
                        Navigator.pop(dialogContext);
                      },
                      child: Container(
                        padding: const .symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: AppTheme.errorRed,
                          borderRadius: .circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Delete',
                            style: context.theme.typography.sm.copyWith(
                              fontWeight: .w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
