import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../data/services/onboarding_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkInitialRoute();
  }

  Future<void> _checkInitialRoute() async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    final onboardingService = getIt<OnboardingService>();
    final authBloc = context.read<AuthBloc>();

    if (!onboardingService.isOnboardingComplete) {
      const OnboardingRoute().go(context);
      return;
    }

    final authState = authBloc.state;
    authState.whenOrNull(
      authenticated: (_) => const HomeRoute().go(context),
      unauthenticated: () => const LoginRoute().go(context),
    );

    if (authState.maybeWhen(
      initial: () => true,
      loading: () => true,
      orElse: () => false,
    )) {
      unawaited(
        authBloc.stream
            .firstWhere((state) {
              return state.maybeWhen(
                authenticated: (_) => true,
                unauthenticated: () => true,
                orElse: () => false,
              );
            })
            .then((state) {
              if (!mounted) return;
              state.whenOrNull(
                authenticated: (_) => const HomeRoute().go(context),
                unauthenticated: () => const SignUpRoute().go(context),
              );
            }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FScaffold(
      childPad: false,
      child: Container(
        color: colors.background,
        child: const Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              AppLogo(size: 64),
              SizedBox(height: 32),
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppTheme.primaryYellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
