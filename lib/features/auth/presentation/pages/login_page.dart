import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/error_messages.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        .signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        ),
      );
    }
  }

  void _onGoogleSignIn() {
    context.read<AuthBloc>().add(const .signInWithGoogle());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isDesktop = AppTheme.isDesktop(screenWidth);
    final contentWidth = isDesktop ? 400.0 : double.infinity;
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
              EmailVerificationRoute(email: email).push(context);
            },
          );
        },
        child: Container(
          color: colors.background,
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const .all(24),
                child: Container(
                  width: contentWidth,
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .stretch,
                      children: [
                        const Center(child: AppLogo(size: 48)),
                        const SizedBox(height: 48),

                        Text(
                          'Welcome Back!',
                          style: context.theme.typography.xl2.copyWith(
                            fontWeight: .bold,
                            color: colors.textPrimary,
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
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            const FormLabel('Password'),
                            FTappable(
                              onPress: () =>
                                  const ForgotPasswordRoute().push(context),
                              child: Text(
                                'Forgot Password?',
                                style: context.theme.typography.sm.copyWith(
                                  color: AppTheme.primaryYellow,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        FTextField(
                          control: FTextFieldControl.managed(
                            controller: _passwordController,
                          ),
                          hint: 'Enter your password',
                          obscureText: _obscurePassword,
                          prefixBuilder: (context, style, states) => Icon(
                            FIcons.lock,
                            color: colors.textSecondary,
                            size: 20,
                          ),
                          suffixBuilder: (context, style, states) => FTappable(
                            onPress: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                            child: Icon(
                              _obscurePassword ? FIcons.eyeOff : FIcons.eye,
                              color: colors.textSecondary,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            final isLoading = state.maybeWhen(
                              loading: () => true,
                              orElse: () => false,
                            );
                            return FButton(
                              onPress: isLoading ? null : _onLogin,
                              child: isLoading
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: colors.background,
                                      ),
                                    )
                                  : const Text('Log In'),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            const Expanded(child: FDivider()),
                            Padding(
                              padding: const .symmetric(horizontal: 16),
                              child: Text(
                                'Or continue with',
                                style: context.theme.typography.sm.copyWith(
                                  color: colors.textSecondary,
                                ),
                              ),
                            ),
                            const Expanded(child: FDivider()),
                          ],
                        ),
                        const SizedBox(height: 24),
                        FButton(
                          onPress: _onGoogleSignIn,
                          style: FButtonStyle.outline(),
                          prefix: Image.network(
                            'https://www.google.com/favicon.ico',
                            width: 20,
                            height: 20,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(FIcons.globe, size: 20),
                          ),
                          child: const Text('Google'),
                        ),
                        const SizedBox(height: 32),
                        FButton(
                          onPress: () => const MagicLinkRoute().push(context),
                          style: FButtonStyle.secondary(),
                          child: const Text('Send Magic Link'),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: context.theme.typography.sm.copyWith(
                                color: colors.textSecondary,
                              ),
                            ),
                            FTappable(
                              onPress: () => const SignUpRoute().push(context),
                              child: Text(
                                'Sign Up',
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
