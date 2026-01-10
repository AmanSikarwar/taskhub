import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/pages/email_verification_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/magic_link_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/auth/presentation/pages/update_password_page.dart';
import '../../features/calendar/presentation/pages/calendar_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/widgets/main_shell.dart';
import '../../features/notifications/presentation/pages/notifications_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/onboarding/presentation/pages/splash_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/projects/presentation/pages/project_detail_page.dart';
import '../../features/projects/presentation/pages/projects_page.dart';
import '../../features/tasks/presentation/pages/my_tasks_page.dart';
import '../../features/tasks/presentation/pages/task_detail_page.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

CustomTransitionPage<T> _buildPageWithTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final fadeAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );
      final slideAnimation = Tween<Offset>(
        begin: const Offset(0.03, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

      return FadeTransition(
        opacity: fadeAnimation,
        child: SlideTransition(position: slideAnimation, child: child),
      );
    },
  );
}

CustomTransitionPage<T> _buildSlideUpPageTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 350),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final slideAnimation = Tween<Offset>(
        begin: const Offset(0, 0.05),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));

      return FadeTransition(
        opacity: animation,
        child: SlideTransition(position: slideAnimation, child: child),
      );
    },
  );
}

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData with $SplashRoute {
  const SplashRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithTransition(
      context: context,
      state: state,
      child: const SplashPage(),
    );
  }
}

@TypedGoRoute<OnboardingRoute>(path: '/onboarding')
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  const OnboardingRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithTransition(
      context: context,
      state: state,
      child: const OnboardingPage(),
    );
  }
}

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithTransition(
      context: context,
      state: state,
      child: const LoginPage(),
    );
  }
}

@TypedGoRoute<SignUpRoute>(path: '/signup')
class SignUpRoute extends GoRouteData with $SignUpRoute {
  const SignUpRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithTransition(
      context: context,
      state: state,
      child: const SignUpPage(),
    );
  }
}

@TypedGoRoute<ForgotPasswordRoute>(path: '/forgot-password')
class ForgotPasswordRoute extends GoRouteData with $ForgotPasswordRoute {
  const ForgotPasswordRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithTransition(
      context: context,
      state: state,
      child: const ForgotPasswordPage(),
    );
  }
}

@TypedGoRoute<MagicLinkRoute>(path: '/magic-link')
class MagicLinkRoute extends GoRouteData with $MagicLinkRoute {
  const MagicLinkRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithTransition(
      context: context,
      state: state,
      child: const MagicLinkPage(),
    );
  }
}

@TypedGoRoute<UpdatePasswordRoute>(path: '/update-password')
class UpdatePasswordRoute extends GoRouteData with $UpdatePasswordRoute {
  const UpdatePasswordRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithTransition(
      context: context,
      state: state,
      child: const UpdatePasswordPage(),
    );
  }
}

@TypedGoRoute<EmailVerificationRoute>(path: '/verify-email/:email')
class EmailVerificationRoute extends GoRouteData with $EmailVerificationRoute {
  final String email;

  const EmailVerificationRoute({required this.email});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithTransition(
      context: context,
      state: state,
      child: EmailVerificationPage(email: email),
    );
  }
}

@TypedGoRoute<ProjectsRoute>(
  path: '/projects',
  routes: [TypedGoRoute<ProjectDetailRoute>(path: ':projectId')],
)
class ProjectsRoute extends GoRouteData with $ProjectsRoute {
  const ProjectsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProjectsPage();
  }
}

class ProjectDetailRoute extends GoRouteData with $ProjectDetailRoute {
  final String projectId;

  const ProjectDetailRoute({required this.projectId});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildSlideUpPageTransition(
      context: context,
      state: state,
      child: ProjectDetailPage(projectId: projectId),
    );
  }
}

@TypedGoRoute<MyTasksRoute>(path: '/my-tasks')
class MyTasksRoute extends GoRouteData with $MyTasksRoute {
  const MyTasksRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildSlideUpPageTransition(
      context: context,
      state: state,
      child: const MyTasksPage(),
    );
  }
}

@TypedGoRoute<TaskDetailRoute>(path: '/tasks/:taskId')
class TaskDetailRoute extends GoRouteData with $TaskDetailRoute {
  final String taskId;

  const TaskDetailRoute({required this.taskId});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildSlideUpPageTransition(
      context: context,
      state: state,
      child: TaskDetailPage(taskId: taskId),
    );
  }
}

@TypedGoRoute<CalendarRoute>(path: '/calendar')
class CalendarRoute extends GoRouteData with $CalendarRoute {
  const CalendarRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CalendarPage();
  }
}

@TypedGoRoute<NotificationsRoute>(path: '/notifications')
class NotificationsRoute extends GoRouteData with $NotificationsRoute {
  const NotificationsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NotificationsPage();
  }
}

@TypedGoRoute<ProfileRoute>(path: '/profile')
class ProfileRoute extends GoRouteData with $ProfileRoute {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfilePage();
  }
}

GoRouter createAppRouter(AuthBloc authBloc) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: const SplashRoute().location,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;
      final isAuthenticated = authState is Authenticated;
      final isPasswordResetReady = authState is PasswordResetReady;
      final isAuthRoute =
          state.matchedLocation == const LoginRoute().location ||
          state.matchedLocation == const SignUpRoute().location ||
          state.matchedLocation == const ForgotPasswordRoute().location ||
          state.matchedLocation == const MagicLinkRoute().location ||
          state.matchedLocation.startsWith('/verify-email');

      if (authState is EmailVerificationRequired) {
        if (!state.matchedLocation.startsWith('/verify-email')) {
          return EmailVerificationRoute(email: authState.email).location;
        }
        return null;
      }

      if (isPasswordResetReady) {
        if (state.matchedLocation != const UpdatePasswordRoute().location) {
          return const UpdatePasswordRoute().location;
        }
        return null;
      }

      if (isAuthenticated && isAuthRoute) {
        return const HomeRoute().location;
      }

      if (!isAuthenticated && !isAuthRoute && !isPasswordResetReady) {
        return const LoginRoute().location;
      }

      return null;
    },
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomePage()),
          ),
          GoRoute(
            path: '/projects',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProjectsPage()),
          ),
          GoRoute(
            path: '/calendar',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: CalendarPage()),
          ),
          GoRoute(
            path: '/notifications',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: NotificationsPage()),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ProfilePage()),
          ),
        ],
      ),
      ...$appRoutes.where((route) => route is! ShellRoute),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final dynamic _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
