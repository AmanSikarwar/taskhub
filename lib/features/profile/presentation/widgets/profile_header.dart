import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../auth/domain/entities/app_user.dart';

class ProfileHeader extends StatelessWidget {
  final AppUser user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final name = user.displayName ?? user.email.split('@').first;

    return Column(
      children: [
        Row(
          children: [
            Text(
              'Profile',
              style: context.theme.typography.xl.copyWith(
                fontWeight: .bold,
                color: colors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: .circle,
                color: colors.backgroundSecondary,
                border: .all(color: AppTheme.primaryYellow, width: 3),
              ),
              child: user.avatarUrl != null
                  ? ClipOval(
                      child: Image.network(
                        user.avatarUrl!,
                        fit: .cover,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Text(
                            name[0].toUpperCase(),
                            style: context.theme.typography.xl3.copyWith(
                              fontWeight: .bold,
                              color: AppTheme.primaryYellow,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: Text(
                        name[0].toUpperCase(),
                        style: context.theme.typography.xl3.copyWith(
                          fontWeight: .bold,
                          color: AppTheme.primaryYellow,
                        ),
                      ),
                    ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppTheme.primaryYellow,
                  shape: .circle,
                  border: .all(color: colors.background, width: 2),
                ),
                child: const Icon(
                  FIcons.pencil,
                  size: 16,
                  color: AppTheme.backgroundDark,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: context.theme.typography.xl.copyWith(
            fontWeight: .bold,
            color: colors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          user.email,
          style: context.theme.typography.sm.copyWith(
            color: colors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        if (user.emailConfirmed)
          Container(
            padding: const .symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.successGreen.withValues(alpha: 0.2),
              borderRadius: .circular(20),
            ),
            child: Row(
              mainAxisSize: .min,
              children: [
                const Icon(
                  FIcons.badgeCheck,
                  color: AppTheme.successGreen,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  'Verified',
                  style: context.theme.typography.xs.copyWith(
                    color: AppTheme.successGreen,
                    fontWeight: .w600,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
