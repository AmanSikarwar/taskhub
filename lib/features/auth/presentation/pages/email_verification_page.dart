import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/error_messages.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../bloc/auth_bloc.dart';

class EmailVerificationPage extends StatefulWidget {
  final String email;

  const EmailVerificationPage({super.key, required this.email});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final _otpController = TextEditingController();
  static const _otpLength = 8;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _onVerifyOtp() {
    if (_otpController.text.length == _otpLength) {
      context.read<AuthBloc>().add(
        .verifyOtp(
          email: widget.email,
          token: _otpController.text,
          type: 'signup',
        ),
      );
    }
  }

  void _onResendEmail() {
    context.read<AuthBloc>().add(.resendVerificationEmail(email: widget.email));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FScaffold(
      childPad: false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            authenticated: (user) {
              showFToast(
                context: context,
                icon: const Icon(FIcons.check),
                title: const Text('Email verified successfully!'),
                duration: const Duration(seconds: 3),
              );
            },
            emailVerificationRequired: (_) {
              showFToast(
                context: context,
                icon: const Icon(FIcons.info),
                title: const Text('Verification email sent!'),
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
            child: Column(
              children: [
                const AppPageHeader(
                  title: 'Verify Email',
                  showBackButton: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const .all(24),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .stretch,
                      children: [
                        const Icon(
                          FIcons.mailCheck,
                          size: 80,
                          color: AppTheme.primaryYellow,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Verify Your Email',
                          style: context.theme.typography.xl2.copyWith(
                            fontWeight: .bold,
                            color: colors.textPrimary,
                          ),
                          textAlign: .center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "We've sent a verification code to:",
                          style: context.theme.typography.base.copyWith(
                            color: colors.textSecondary,
                          ),
                          textAlign: .center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.email,
                          style: context.theme.typography.base.copyWith(
                            fontWeight: .bold,
                            color: AppTheme.primaryYellow,
                          ),
                          textAlign: .center,
                        ),
                        const SizedBox(height: 32),
                        const FormLabel('Verification Code'),
                        const SizedBox(height: 8),
                        FTextField(
                          control: FTextFieldControl.managed(
                            controller: _otpController,
                            onChange: (value) {
                              if (value.text.length == _otpLength) {
                                _onVerifyOtp();
                              }
                            },
                          ),
                          hint: '00000000',
                          keyboardType: TextInputType.number,
                          maxLength: _otpLength,
                          textAlign: .center,
                        ),
                        const SizedBox(height: 24),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            final isLoading = state.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );
                            return FButton(
                              onPress: isLoading ? null : _onVerifyOtp,
                              child: isLoading
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: colors.background,
                                      ),
                                    )
                                  : const Text('Verify'),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              "Didn't receive the code? ",
                              style: context.theme.typography.sm.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                final isLoading = state.maybeWhen(
                                  loading: () => true,
                                  orElse: () => false,
                                );
                                return FTappable(
                                  onPress: isLoading ? null : _onResendEmail,
                                  child: Text(
                                    'Resend',
                                    style: context.theme.typography.sm.copyWith(
                                      color: AppTheme.primaryYellow,
                                      fontWeight: .w600,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Container(
                          padding: const .all(16),
                          decoration: BoxDecoration(
                            color: colors.backgroundCard,
                            borderRadius: .circular(12),
                            border: .all(color: colors.border),
                          ),
                          child: Row(
                            children: [
                              Icon(FIcons.info, color: colors.textSecondary),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  "Check your spam folder if you don't see the email in your inbox.",
                                  style: context.theme.typography.sm.copyWith(
                                    color: colors.textSecondary,
                                  ),
                                ),
                              ),
                            ],
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
