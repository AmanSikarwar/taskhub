import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:intl/intl.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/domain/entities/app_user.dart';

class DashboardHeader extends StatelessWidget {
  final AppUser? user;

  const DashboardHeader({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final name = user?.displayName ?? user?.email.split('@').first ?? 'User';
    final date = DateFormat('EEEE, MMMM d').format(DateTime.now());

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                date.toUpperCase(),
                style: context.theme.typography.xs.copyWith(
                  color: colors.textSecondary,
                  fontWeight: .w600,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Hello, ${name.split(' ').first}',
                style: context.theme.typography.xl3.copyWith(
                  // Changed from 2xl to xl3 (assuming available) or just use large size
                  fontWeight: .bold,
                  color: colors.textPrimary,
                  fontSize: 32, // explicit fallback
                ),
              ),
            ],
          ),
        ),
        FTappable(
          onPress: () => const ProfileRoute().push(context),
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: .circle,
              border: .all(color: colors.border, width: 2),
              image: user?.avatarUrl != null
                  ? DecorationImage(
                      image: NetworkImage(user!.avatarUrl!),
                      fit: .cover,
                    )
                  : null,
              color: colors.backgroundSecondary,
            ),
            child: user?.avatarUrl == null
                ? Icon(FIcons.user, color: colors.textSecondary, size: 24)
                : null,
          ),
        ),
      ],
    );
  }
}
