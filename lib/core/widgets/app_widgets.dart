import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';
import 'animated_list_item.dart';

/// Consistent page header for all app pages
///
/// Provides a unified header with title, optional back button, and action buttons.
class AppPageHeader extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBack;
  final List<Widget>? actions;

  const AppPageHeader({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBack,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const .symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          if (showBackButton) ...[
            FTappable(
              onPress: onBack ?? () => context.pop(),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colors.backgroundCard,
                  borderRadius: .circular(10),
                  border: .all(color: colors.border),
                ),
                child: Icon(
                  FIcons.chevronLeft,
                  color: colors.textPrimary,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
          Expanded(
            child: Text(
              title,
              style: context.theme.typography.xl.copyWith(
                fontWeight: .bold,
                color: colors.textPrimary,
              ),
            ),
          ),
          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}

/// Header action button (icon in a rounded container)
class AppHeaderAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? badge;

  const AppHeaderAction({
    super.key,
    required this.icon,
    this.onTap,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FTappable(
      onPress: onTap,
      child: Stack(
        children: [
          Container(
            padding: const .all(10),
            decoration: BoxDecoration(
              color: colors.backgroundCard,
              borderRadius: .circular(10),
              border: .all(color: colors.border),
            ),
            child: Icon(icon, color: colors.textSecondary, size: 20),
          ),
          if (badge != null) Positioned(right: 0, top: 0, child: badge!),
        ],
      ),
    );
  }
}

/// Consistent interactive card wrapper with tap feedback
///
/// Use this for list items, project cards, task cards, etc.
class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final Color? backgroundColor;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const .all(16),
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    final card = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.backgroundCard,
        borderRadius: .circular(16),
        border: .all(color: colors.border),
      ),
      child: child,
    );

    if (onTap == null) return card;

    return TapScaleAnimation(onTap: onTap, child: card);
  }
}

class ProjectProgressCircle extends StatelessWidget {
  final double progress;
  final double size;
  final Color? color;

  const ProjectProgressCircle({
    super.key,
    required this.progress,
    this.size = 40,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final progressColor = color ?? AppTheme.primaryYellow;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: progress),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return CircularProgressIndicator(
                value: value,
                strokeWidth: 3,
                backgroundColor: colors.backgroundSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              );
            },
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: progress * 100),
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Text(
                '${value.toInt()}%',
                style: context.theme.typography.xs.copyWith(
                  fontWeight: .bold,
                  color: colors.textPrimary,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TaskStatusChip extends StatelessWidget {
  final String status;
  final Color? color;

  const TaskStatusChip({super.key, required this.status, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: (color ?? AppTheme.primaryYellow).withValues(alpha: 0.2),
        borderRadius: .circular(20),
      ),
      child: Text(
        status,
        style: context.theme.typography.xs.copyWith(
          color: color ?? AppTheme.primaryYellow,
          fontWeight: .w600,
        ),
      ),
    );
  }
}

class TeamMemberAvatars extends StatelessWidget {
  final List<String?> avatarUrls;
  final int maxDisplay;
  final double size;

  const TeamMemberAvatars({
    super.key,
    required this.avatarUrls,
    this.maxDisplay = 4,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final displayCount = avatarUrls.length > maxDisplay
        ? maxDisplay
        : avatarUrls.length;
    final remaining = avatarUrls.length - maxDisplay;

    return SizedBox(
      height: size,
      child: Stack(
        children: [
          for (int i = 0; i < displayCount; i++)
            Positioned(
              left: i * (size * 0.7),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: .circle,
                  border: .all(color: colors.background, width: 2),
                ),
                child: avatarUrls[i] != null
                    ? ClipOval(
                        child: Image.network(
                          avatarUrls[i]!,
                          fit: .cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildPlaceholder(i),
                        ),
                      )
                    : _buildPlaceholder(i),
              ),
            ),
          if (remaining > 0)
            Positioned(
              left: displayCount * (size * 0.7),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: colors.backgroundSecondary,
                  border: .all(color: colors.background, width: 2),
                ),
                child: Center(
                  child: Text(
                    '+$remaining',
                    style: context.theme.typography.xs.copyWith(
                      color: colors.textSecondary,
                      fontWeight: .bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(int index) {
    final colors = [
      AppTheme.primaryYellow,
      Colors.blue,
      Colors.green,
      Colors.purple,
    ];
    return Container(
      decoration: BoxDecoration(
        shape: .circle,
        color: colors[index % colors.length],
      ),
      child: const Icon(FIcons.user, color: Colors.white, size: 16),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionHeader({super.key, required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          title,
          style: context.theme.typography.base.copyWith(
            fontWeight: .w600,
            color: colors.textPrimary,
          ),
        ),
        if (onSeeAll != null)
          FTappable(
            onPress: onSeeAll,
            child: Text(
              'See all',
              style: context.theme.typography.sm.copyWith(
                color: AppTheme.primaryYellow,
              ),
            ),
          ),
      ],
    );
  }
}

class AppSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const AppSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Search tasks',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textControl = FTextFieldControl.managed(
      controller: controller,
      onChange: onChanged != null ? (value) => onChanged!(value.text) : null,
    );

    return Container(
      decoration: BoxDecoration(
        color: context.appColors.backgroundCard,
        borderRadius: .circular(12),
      ),
      child: FTextField(
        control: textControl,
        hint: hintText,
        prefixBuilder: (context, style, states) => Padding(
          padding: const .all(12.0),
          child: Icon(
            FIcons.search,
            color: context.appColors.textSecondary,
            size: 16,
          ),
        ),
      ),
    );
  }
}

/// Badge displaying a project role (Admin, Editor, Viewer)
class RoleBadge extends StatelessWidget {
  final String role;
  final Color? color;

  const RoleBadge({super.key, required this.role, this.color});

  @override
  Widget build(BuildContext context) {
    final badgeColor = color ?? _getDefaultColor();

    return Container(
      padding: const .symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: 0.1),
        borderRadius: .circular(12),
      ),
      child: Text(
        role,
        style: context.theme.typography.xs.copyWith(
          color: badgeColor,
          fontWeight: .w500,
        ),
      ),
    );
  }

  Color _getDefaultColor() {
    return switch (role.toLowerCase()) {
      'admin' => Colors.purple,
      'editor' => Colors.blue,
      'viewer' => Colors.grey,
      _ => AppTheme.primaryYellow,
    };
  }
}

/// Icon widget for task priority display
class PriorityIcon extends StatelessWidget {
  final String priority;
  final double size;

  const PriorityIcon({super.key, required this.priority, this.size = 20});

  @override
  Widget build(BuildContext context) {
    final (color, icon) = _getPriorityInfo();

    if (icon == null) return const SizedBox.shrink();

    return Icon(icon, color: color, size: size);
  }

  (Color?, IconData?) _getPriorityInfo() {
    return switch (priority.toLowerCase()) {
      'urgent' => (Colors.red, Icons.priority_high),
      'high' => (Colors.orange, Icons.arrow_upward),
      _ => (null, null),
    };
  }
}

/// Section title with optional count badge
class SectionTitle extends StatelessWidget {
  final String title;
  final int? count;
  final Color color;

  const SectionTitle({
    super.key,
    required this.title,
    this.count,
    this.color = AppTheme.primaryYellow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(color: color, borderRadius: .circular(2)),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: context.theme.typography.base.copyWith(fontWeight: .bold),
          ),
          if (count != null) ...[
            const SizedBox(width: 8),
            Container(
              padding: const .symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: .circular(12),
              ),
              child: Text(
                '$count',
                style: TextStyle(color: color, fontWeight: .bold, fontSize: 12),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Generic empty state widget
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? action;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Icon(icon, size: 64, color: colors.textMuted),
          const SizedBox(height: 16),
          Text(
            title,
            style: context.theme.typography.base.copyWith(fontWeight: .w600),
            textAlign: .center,
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: context.theme.typography.sm.copyWith(
                color: colors.textMuted,
              ),
              textAlign: .center,
            ),
          ],
          if (action != null) ...[const SizedBox(height: 16), action!],
        ],
      ),
    );
  }
}

/// Form field label widget for consistent styling
class FormLabel extends StatelessWidget {
  final String text;

  const FormLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Text(
      text,
      style: context.theme.typography.sm.copyWith(color: colors.textSecondary),
    );
  }
}

/// Loading state widget with centered spinner
class LoadingState extends StatelessWidget {
  final String? message;

  const LoadingState({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          const CircularProgressIndicator(color: AppTheme.primaryYellow),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: context.theme.typography.sm.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Error state widget with retry option
class ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorState({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Center(
      child: Padding(
        padding: const .all(24),
        child: Column(
          mainAxisSize: .min,
          children: [
            Icon(FIcons.triangleAlert, size: 48, color: colors.textMuted),
            const SizedBox(height: 16),
            Text(
              message,
              style: context.theme.typography.base.copyWith(
                color: colors.textSecondary,
              ),
              textAlign: .center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              FButton(
                onPress: onRetry,
                style: FButtonStyle.outline(),
                child: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
