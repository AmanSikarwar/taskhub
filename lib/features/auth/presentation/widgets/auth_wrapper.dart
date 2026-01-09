import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/utils/error_messages.dart';
import '../bloc/auth_bloc.dart';
import '../pages/login_page.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;

  const AuthWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
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
      builder: (context, state) {
        return state.when(
          initial: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          authenticated: (user) => child,
          profileUpdated: (user) => child,
          unauthenticated: () => const LoginPage(),
          emailVerificationRequired: (email) => const LoginPage(),
          passwordResetEmailSent: () => const LoginPage(),
          passwordUpdated: () => const LoginPage(),
          passwordResetReady: (user) => const LoginPage(),
          error: (failure) => const LoginPage(),
        );
      },
    );
  }
}
