import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/error_messages.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../bloc/auth_bloc.dart';

class MagicLinkPage extends StatefulWidget {
  const MagicLinkPage({super.key});

  @override
  State<MagicLinkPage> createState() => _MagicLinkPageState();
}

class _MagicLinkPageState extends State<MagicLinkPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSendMagicLink() {
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
    context.read<AuthBloc>().add(.signInWithMagicLink(email: email));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FScaffold(
      childPad: false,
      child: BlocListener<AuthBloc, AuthState>(
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
            emailVerificationRequired: (email) {
              EmailVerificationRoute(email: email).go(context);
            },
          );
        },
        child: Container(
          color: colors.background,
          child: SafeArea(
            child: Column(
              children: [
                const AppPageHeader(title: 'Magic Link', showBackButton: true),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const .all(24),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .stretch,
                      children: [
                        const Icon(
                          FIcons.wand,
                          size: 80,
                          color: AppTheme.primaryYellow,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Passwordless Sign In',
                          style: context.theme.typography.xl2.copyWith(
                            fontWeight: .bold,
                            color: colors.textPrimary,
                          ),
                          textAlign: .center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Enter your email and we'll send you a magic link to sign in",
                          style: context.theme.typography.base.copyWith(
                            color: colors.textSecondary,
                          ),
                          textAlign: .center,
                        ),
                        const SizedBox(height: 48),
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
                              onPress: isLoading ? null : _onSendMagicLink,
                              prefix: isLoading
                                  ? null
                                  : const Icon(FIcons.send, size: 16),
                              child: isLoading
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: colors.background,
                                      ),
                                    )
                                  : const Text('Send Magic Link'),
                            );
                          },
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              'Prefer password? ',
                              style: context.theme.typography.sm.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                            FTappable(
                              onPress: () => const LoginRoute().go(context),
                              child: Text(
                                'Sign In',
                                style: context.theme.typography.sm.copyWith(
                                  color: AppTheme.primaryYellow,
                                  fontWeight: .w600,
                                ),
                              ),
                            ),
                          ],
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
