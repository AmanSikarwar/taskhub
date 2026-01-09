import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/error_messages.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../bloc/auth_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSendResetEmail() {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      showFToast(
        context: context,
        icon: const Icon(FIcons.triangleAlert),
        title: const Text('Please enter your email'),
        duration: const Duration(seconds: 3),
      );
      return;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      showFToast(
        context: context,
        icon: const Icon(FIcons.triangleAlert),
        title: const Text('Please enter a valid email'),
        duration: const Duration(seconds: 3),
      );
      return;
    }
    context.read<AuthBloc>().add(.sendPasswordResetEmail(email: email));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FScaffold(
      childPad: false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            passwordResetEmailSent: () {
              showFToast(
                context: context,
                icon: const Icon(FIcons.check),
                title: const Text(
                  'Password reset email sent! Check your inbox.',
                ),
                duration: const Duration(seconds: 3),
              );
              Navigator.of(context).pop();
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
            child: Column(
              children: [
                const AppPageHeader(
                  title: 'Reset Password',
                  showBackButton: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const .all(24),
                    child: Column(
                      crossAxisAlignment: .stretch,
                      children: [
                        const Icon(
                          FIcons.keyRound,
                          size: 64,
                          color: AppTheme.primaryYellow,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Enter your email address and we'll send you a link to reset your password.",
                          style: context.theme.typography.base.copyWith(
                            color: colors.textSecondary,
                          ),
                          textAlign: .center,
                        ),
                        const SizedBox(height: 32),
                        const FormLabel('Email Address'),
                        const SizedBox(height: 8),
                        FTextField(
                          control: FTextFieldControl.managed(
                            controller: _emailController,
                          ),
                          hint: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          prefixBuilder: (context, style, states) => Icon(
                            FIcons.mail,
                            color: colors.textSecondary,
                            size: 20,
                          ),
                        ),
                        const SizedBox(height: 24),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            final isLoading = state.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );
                            return FButton(
                              onPress: isLoading ? null : _onSendResetEmail,
                              child: isLoading
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: colors.background,
                                      ),
                                    )
                                  : const Text('Send Reset Link'),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: FTappable(
                            onPress: () => Navigator.of(context).pop(),
                            child: Text(
                              'Back to Login',
                              style: context.theme.typography.sm.copyWith(
                                color: AppTheme.primaryYellow,
                                fontWeight: .w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
