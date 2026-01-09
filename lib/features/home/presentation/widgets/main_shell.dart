import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../notifications/presentation/bloc/notification_bloc.dart';
import '../../../projects/presentation/bloc/project_bloc.dart';
import '../../../tasks/presentation/bloc/task_bloc.dart';
import '../../../projects/presentation/widgets/create_project_dialog.dart';
import '../../../tasks/presentation/widgets/create_task_dialog.dart';

class MainShell extends StatefulWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateIndexFromLocation();
  }

  void _updateIndexFromLocation() {
    final location = GoRouterState.of(context).matchedLocation;
    if (location == '/' || location.startsWith('/home')) {
      _currentIndex = 0;
    } else if (location.startsWith('/projects')) {
      _currentIndex = 1;
    } else if (location.startsWith('/calendar')) {
      _currentIndex = 2;
    } else if (location.startsWith('/notifications')) {
      _currentIndex = 3;
    } else if (location.startsWith('/profile')) {
      _currentIndex = 4;
    }
  }

  void _onTabTapped(int index) {
    if (_currentIndex == index) return;

    setState(() => _currentIndex = index);

    switch (index) {
      case 0:
        const HomeRoute().go(context);
        break;
      case 1:
        const ProjectsRoute().go(context);
        break;
      case 2:
        const CalendarRoute().go(context);
        break;
      case 3:
        const NotificationsRoute().go(context);
        break;
      case 4:
        const ProfileRoute().go(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = AppTheme.isDesktop(screenWidth);
    final isTablet = AppTheme.isTablet(screenWidth);

    return BlocProvider(
      create: (_) => getIt<NotificationBloc>()
        ..add(const NotificationEvent.loadUnreadCount())
        ..add(const NotificationEvent.watchNotifications()),
      child: FScaffold(
        childPad: false,
        child: isDesktop
            ? _DesktopLayout(
                currentIndex: _currentIndex,
                onTabTapped: _onTabTapped,
                child: widget.child,
              )
            : isTablet
            ? _TabletLayout(
                currentIndex: _currentIndex,
                onTabTapped: _onTabTapped,
                child: widget.child,
              )
            : _MobileLayout(
                currentIndex: _currentIndex,
                onTabTapped: _onTabTapped,
                child: widget.child,
              ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabTapped;
  final Widget child;

  const _MobileLayout({
    required this.currentIndex,
    required this.onTabTapped,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, notificationState) {
              final unreadCount = notificationState.unreadCount;

              return SafeArea(
                child: _CustomBottomNavBar(
                  currentIndex: currentIndex,
                  onTap: onTabTapped,
                  unreadCount: unreadCount,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TabletLayout extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabTapped;
  final Widget child;

  const _TabletLayout({
    required this.currentIndex,
    required this.onTabTapped,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Row(
      children: [
        BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, notificationState) {
            final unreadCount = notificationState.unreadCount;

            return Container(
              width: 80,
              decoration: BoxDecoration(
                color: colors.backgroundCard,
                border: Border(
                  right: BorderSide(color: colors.border, width: 1),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryYellow,
                        borderRadius: .circular(12),
                      ),
                      child: const Icon(
                        FIcons.circleCheck,
                        color: AppTheme.backgroundDark,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: .start,
                        children: [
                          _NavRailItem(
                            icon: FIcons.house,
                            label: 'Home',
                            isSelected: currentIndex == 0,
                            onTap: () => onTabTapped(0),
                          ),
                          _NavRailItem(
                            icon: FIcons.folder,
                            label: 'Projects',
                            isSelected: currentIndex == 1,
                            onTap: () => onTabTapped(1),
                          ),
                          _NavRailItem(
                            icon: FIcons.calendar,
                            label: 'Calendar',
                            isSelected: currentIndex == 2,
                            onTap: () => onTabTapped(2),
                          ),
                          _NavRailItem(
                            icon: FIcons.bell,
                            label: 'Alerts',
                            isSelected: currentIndex == 3,
                            onTap: () => onTabTapped(3),
                            badgeCount: unreadCount,
                          ),
                          _NavRailItem(
                            icon: FIcons.user,
                            label: 'Profile',
                            isSelected: currentIndex == 4,
                            onTap: () => onTabTapped(4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Expanded(child: child),
      ],
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabTapped;
  final Widget child;

  const _DesktopLayout({
    required this.currentIndex,
    required this.onTabTapped,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Row(
      children: [
        BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, notificationState) {
            final unreadCount = notificationState.unreadCount;

            return Container(
              width: 240,
              decoration: BoxDecoration(
                color: colors.backgroundCard,
                border: Border(
                  right: BorderSide(color: colors.border, width: 1),
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Padding(
                      padding: const .all(24),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryYellow,
                              borderRadius: .circular(10),
                            ),
                            child: const Icon(
                              FIcons.circleCheck,
                              color: AppTheme.backgroundDark,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'TaskHub',
                            style: context.theme.typography.xl.copyWith(
                              fontWeight: .bold,
                              color: colors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Padding(
                        padding: const .symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            _NavSideItem(
                              icon: FIcons.house,
                              label: 'Home',
                              isSelected: currentIndex == 0,
                              onTap: () => onTabTapped(0),
                            ),
                            _NavSideItem(
                              icon: FIcons.folder,
                              label: 'Projects',
                              isSelected: currentIndex == 1,
                              onTap: () => onTabTapped(1),
                            ),
                            _NavSideItem(
                              icon: FIcons.calendar,
                              label: 'Calendar',
                              isSelected: currentIndex == 2,
                              onTap: () => onTabTapped(2),
                            ),
                            _NavSideItem(
                              icon: FIcons.bell,
                              label: 'Notifications',
                              isSelected: currentIndex == 3,
                              onTap: () => onTabTapped(3),
                              badgeCount: unreadCount,
                            ),
                            const Spacer(),
                            const FDivider(),
                            const SizedBox(height: 8),
                            _NavSideItem(
                              icon: FIcons.user,
                              label: 'Profile',
                              isSelected: currentIndex == 4,
                              onTap: () => onTabTapped(4),
                            ),
                            _NavSideItem(
                              icon: FIcons.settings,
                              label: 'Settings',
                              isSelected: false,
                              onTap: () => onTabTapped(4),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        // Main content
        Expanded(child: child),
      ],
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final int unreadCount;

  const _CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: context.appColors.backgroundSecondary,
        borderRadius: .circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      margin: const .symmetric(vertical: 4, horizontal: 8),
      padding: const .symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: .spaceAround,
        children: [
          _NavBarItem(
            icon: FIcons.house,
            label: 'Home',
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _NavBarItem(
            icon: FIcons.folder,
            label: 'Projects',
            isSelected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          _AddButton(onTap: () => _showAddSheet(context)),
          _NavBarItem(
            icon: FIcons.bell,
            label: 'Alerts',
            isSelected: currentIndex == 3,
            onTap: () => onTap(3),
            badgeCount: unreadCount,
          ),
          _NavBarItem(
            icon: FIcons.calendar,
            label: 'Calendar',
            isSelected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
        ],
      ),
    );
  }

  void _showAddSheet(BuildContext context) {
    final colors = context.appColors;

    showModalBottomSheet(
      context: context,
      backgroundColor: colors.backgroundCard,
      shape: const RoundedRectangleBorder(
        borderRadius: .vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const .all(20),
          child: Column(
            mainAxisSize: .min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const .only(bottom: 24),
                decoration: BoxDecoration(
                  color: colors.border,
                  borderRadius: .circular(2),
                ),
              ),
              Text(
                'Create New',
                style: context.theme.typography.lg.copyWith(
                  fontWeight: .bold,
                  color: colors.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _AddOption(
                      icon: FIcons.clipboardList,
                      label: 'New Task',
                      color: AppTheme.infoBlue,
                      onTap: () {
                        Navigator.pop(sheetContext);
                        _showCreateTaskDialog(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _AddOption(
                      icon: FIcons.folder,
                      label: 'New Project',
                      color: AppTheme.successGreen,
                      onTap: () {
                        Navigator.pop(sheetContext);
                        _showCreateProjectDialog(context);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _showCreateTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<ProjectBloc>()..add(const .loadProjects()),
          ),
          BlocProvider(create: (_) => getIt<TaskBloc>()),
        ],
        child: const CreateTaskDialog(),
      ),
    );
  }

  void _showCreateProjectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider(
        create: (_) => getIt<ProjectBloc>(),
        child: const CreateProjectDialog(),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final int badgeCount;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FTappable(
      onPress: onTap,
      child: SizedBox(
        width: 56,
        child: Column(
          mainAxisSize: .min,
          children: [
            Stack(
              clipBehavior: .none,
              children: [
                Container(
                  width: 40,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppTheme.primaryYellow.withValues(alpha: 0.2)
                        : Colors.transparent,
                    borderRadius: .circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 22,
                    color: isSelected
                        ? AppTheme.primaryYellow
                        : colors.textSecondary,
                  ),
                ),
                if (badgeCount > 0)
                  Positioned(
                    right: 2,
                    top: -2,
                    child: Container(
                      padding: const .symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryYellow,
                        borderRadius: .circular(8),
                      ),
                      child: Text(
                        badgeCount > 99 ? '99+' : '$badgeCount',
                        style: const TextStyle(
                          fontSize: 9,
                          fontWeight: .bold,
                          color: AppTheme.backgroundDark,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: context.theme.typography.xs.copyWith(
                color: isSelected
                    ? AppTheme.primaryYellow
                    : colors.textSecondary,
                fontWeight: isSelected ? .w600 : .normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FTappable(
      onPress: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppTheme.primaryYellow,
          shape: .circle,
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryYellow.withValues(alpha: 0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          FIcons.plus,
          size: 28,
          color: AppTheme.backgroundDark,
        ),
      ),
    );
  }
}

class _AddOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _AddOption({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FTappable(
      onPress: onTap,
      child: Container(
        padding: const .all(20),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: .circular(16),
          border: .all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                shape: .circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: context.theme.typography.sm.copyWith(
                fontWeight: .w600,
                color: colors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavRailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final int badgeCount;

  const _NavRailItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const .symmetric(vertical: 4),
      child: FTappable(
        onPress: onTap,
        child: Container(
          width: 64,
          padding: const .symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.primaryYellow.withValues(alpha: 0.2)
                : Colors.transparent,
            borderRadius: .circular(12),
          ),
          child: Column(
            mainAxisSize: .min,
            children: [
              Stack(
                clipBehavior: .none,
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color: isSelected
                        ? AppTheme.primaryYellow
                        : colors.textSecondary,
                  ),
                  if (badgeCount > 0)
                    Positioned(
                      right: -8,
                      top: -4,
                      child: Container(
                        padding: const .symmetric(horizontal: 4, vertical: 1),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryYellow,
                          borderRadius: .circular(8),
                        ),
                        child: Text(
                          badgeCount > 99 ? '99+' : '$badgeCount',
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: .bold,
                            color: AppTheme.backgroundDark,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                label,
                style: context.theme.typography.xs.copyWith(
                  color: isSelected
                      ? AppTheme.primaryYellow
                      : colors.textSecondary,
                  fontWeight: isSelected ? .w600 : .normal,
                ),
                textAlign: .center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavSideItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final int badgeCount;

  const _NavSideItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Padding(
      padding: const .symmetric(vertical: 2),
      child: FTappable(
        onPress: onTap,
        child: Container(
          padding: const .symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.primaryYellow.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: .circular(12),
            border: isSelected
                ? .all(color: AppTheme.primaryYellow.withValues(alpha: 0.3))
                : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 22,
                color: isSelected
                    ? AppTheme.primaryYellow
                    : colors.textSecondary,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  style: context.theme.typography.sm.copyWith(
                    color: isSelected
                        ? AppTheme.primaryYellow
                        : colors.textPrimary,
                    fontWeight: isSelected ? .w600 : .normal,
                  ),
                ),
              ),
              if (badgeCount > 0)
                Container(
                  padding: const .symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryYellow,
                    borderRadius: .circular(10),
                  ),
                  child: Text(
                    badgeCount > 99 ? '99+' : '$badgeCount',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: .bold,
                      color: AppTheme.backgroundDark,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
