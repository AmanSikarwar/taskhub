import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/theme_notifier.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../../core/utils/error_messages.dart';
import '../../../../core/widgets/app_bottom_sheets.dart';
import '../../../auth/domain/entities/app_user.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_item.dart';
import '../widgets/profile_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = AppTheme.isDesktop(screenWidth);
    final maxWidth = isDesktop ? 600.0 : double.infinity;

    return FScaffold(
      childPad: false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            profileUpdated: (user) {
              showFToast(
                context: context,
                icon: const Icon(FIcons.check),
                title: const Text('Profile updated successfully'),
                duration: const Duration(seconds: 3),
              );
            },
            error: (failure) {
              showFToast(
                context: context,
                icon: const Icon(FIcons.triangleAlert),
                title: Text(ErrorMessages.fromAuthFailure(failure)),
                duration: const Duration(seconds: 4),
              );
            },
          );
        },
        child: Container(
          color: colors.background,
          child: SafeArea(
            bottom: false,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final user = state.maybeWhen(
                      authenticated: (user) => user,
                      profileUpdated: (user) => user,
                      orElse: () => null,
                    );

                    if (user == null) {
                      return Center(
                        child: Column(
                          mainAxisSize: .min,
                          children: [
                            Icon(
                              FIcons.user,
                              size: 48,
                              color: colors.textMuted,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Not signed in',
                              style: context.theme.typography.base.copyWith(
                                color: colors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return SingleChildScrollView(
                      padding: const .all(20),
                      child: Column(
                        children: [
                          ProfileHeader(user: user),
                          const SizedBox(height: 32),
                          ProfileSection(
                            title: 'Account',
                            children: [
                              ProfileItem(
                                icon: FIcons.mail,
                                title: 'Email',
                                value: user.email,
                              ),
                              ProfileItem(
                                icon: FIcons.user,
                                title: 'Display Name',
                                value: user.displayName ?? 'Not set',
                                onTap: () => _showEditNameDialog(context, user),
                              ),
                              ProfileItem(
                                icon: FIcons.calendar,
                                title: 'Member Since',
                                value: _formatDate(user.createdAt),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ProfileSection(
                            title: 'Preferences',
                            children: [
                              _ThemeItem(),
                              ProfileItem(
                                icon: FIcons.bell,
                                title: 'Notifications',
                                value: 'Enabled',
                                onTap: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ProfileSection(
                            title: 'Security',
                            children: [
                              ProfileItem(
                                icon: FIcons.lock,
                                title: 'Change Password',
                                onTap: () =>
                                    const UpdatePasswordRoute().push(context),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            child: FTappable(
                              onPress: () => _showSignOutDialog(context),
                              child: Container(
                                padding: const .symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  color: AppTheme.errorRed.withValues(
                                    alpha: 0.1,
                                  ),
                                  borderRadius: .circular(12),
                                  border: .all(
                                    color: AppTheme.errorRed.withValues(
                                      alpha: 0.3,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: .center,
                                  children: [
                                    const Icon(
                                      FIcons.logOut,
                                      color: AppTheme.errorRed,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Sign Out',
                                      style: context.theme.typography.sm
                                          .copyWith(
                                            color: AppTheme.errorRed,
                                            fontWeight: .w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'TaskHub v0.1.0',
                            style: context.theme.typography.xs.copyWith(
                              color: colors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${AppUtils.getMonthName(date.month)} ${date.day}, ${date.year}';
  }

  void _showEditNameDialog(BuildContext context, AppUser user) {
    final controller = TextEditingController(text: user.displayName);

    showAppBottomSheet(
      context: context,
      builder: (sheetContext) => FormBottomSheet(
        title: 'Edit Display Name',
        fields: [
          FTextField(
            control: FTextFieldControl.managed(controller: controller),
            hint: 'Enter your name',
            label: const Text('Display Name'),
          ),
        ],
        onSave: () {
          final newName = controller.text.trim();
          if (newName.isNotEmpty) {
            context.read<AuthBloc>().add(.updateProfile(displayName: newName));
            Navigator.pop(sheetContext);
          }
        },
        canSave: true,
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showConfirmationBottomSheet(
      context: context,
      title: 'Sign Out',
      message: 'Are you sure you want to sign out?',
      confirmLabel: 'Sign Out',
      icon: FIcons.logOut,
      onConfirm: () {
        context.read<AuthBloc>().add(const .signOut());
      },
    );
  }
}

class _ThemeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final themeNotifier = ThemeProvider.of(context);

    final themeName = themeNotifier.themeMode.name;

    return FTappable(
      onPress: () => _showThemeSheet(context),
      child: Padding(
        padding: const .all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.backgroundSecondary,
                borderRadius: .circular(10),
              ),
              child: Icon(
                context.isDarkMode ? FIcons.moon : FIcons.sun,
                size: 20,
                color: colors.textSecondary,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Theme',
                    style: context.theme.typography.sm.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    themeName,
                    style: context.theme.typography.sm.copyWith(
                      fontWeight: .w500,
                      color: colors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(FIcons.chevronRight, size: 20, color: colors.textSecondary),
          ],
        ),
      ),
    );
  }

  void _showThemeSheet(BuildContext context) {
    final colors = context.appColors;
    final themeNotifier = ThemeProvider.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: colors.backgroundCard,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: .circular(20)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const .symmetric(vertical: 16),
          child: Column(
            mainAxisSize: .min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const .only(bottom: 20),
                decoration: BoxDecoration(
                  color: colors.border,
                  borderRadius: .circular(2),
                ),
              ),
              Text(
                'Choose Theme',
                style: context.theme.typography.lg.copyWith(
                  fontWeight: .bold,
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: 20),
              _ThemeOption(
                icon: FIcons.sun,
                title: 'Light',
                isSelected: themeNotifier.themeMode == .light,
                onTap: () {
                  themeNotifier.setLightMode();
                  Navigator.pop(sheetContext);
                },
              ),
              _ThemeOption(
                icon: FIcons.moon,
                title: 'Dark',
                isSelected: themeNotifier.themeMode == .dark,
                onTap: () {
                  themeNotifier.setDarkMode();
                  Navigator.pop(sheetContext);
                },
              ),
              _ThemeOption(
                icon: FIcons.monitor,
                title: 'System',
                isSelected: themeNotifier.themeMode == .system,
                onTap: () {
                  themeNotifier.setSystemMode();
                  Navigator.pop(sheetContext);
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FTappable(
      onPress: onTap,
      child: Container(
        margin: const .symmetric(horizontal: 20, vertical: 4),
        padding: const .all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primaryYellow.withValues(alpha: 0.1)
              : colors.backgroundSecondary,
          borderRadius: .circular(12),
          border: isSelected ? .all(color: AppTheme.primaryYellow) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: isSelected ? AppTheme.primaryYellow : colors.textSecondary,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: context.theme.typography.base.copyWith(
                  fontWeight: isSelected ? .w600 : .normal,
                  color: isSelected
                      ? AppTheme.primaryYellow
                      : colors.textPrimary,
                ),
              ),
            ),
            if (isSelected)
              const Icon(FIcons.check, size: 20, color: AppTheme.primaryYellow),
          ],
        ),
      ),
    );
  }
}
