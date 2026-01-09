import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/error_messages.dart';
import '../../../../core/widgets/app_widgets.dart';
import '../bloc/auth_bloc.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onUpdatePassword() {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password.isEmpty) {
      showFToast(
        context: context,
        icon: const Icon(FIcons.triangleAlert),
        title: const Text('Please enter a password'),
        duration: const Duration(seconds: 3),
      );
      return;
    }
    if (password.length < 6) {
      showFToast(
        context: context,
        icon: const Icon(FIcons.triangleAlert),
        title: const Text('Password must be at least 6 characters'),
        duration: const Duration(seconds: 3),
      );
      return;
    }
    if (password != confirmPassword) {
      showFToast(
        context: context,
        icon: const Icon(FIcons.triangleAlert),
        title: const Text('Passwords do not match'),
        duration: const Duration(seconds: 3),
      );
      return;
    }

    context.read<AuthBloc>().add(.updatePassword(newPassword: password));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return FScaffold(
      childPad: false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            passwordUpdated: () {
              showFToast(
                context: context,
                icon: const Icon(FIcons.check),
                title: const Text('Password updated successfully!'),
                duration: const Duration(seconds: 3),
              );
              const HomeRoute().go(context);
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
                  title: 'Update Password',
                  showBackButton: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const .all(24),
                    child: Column(
                      crossAxisAlignment: .stretch,
                      children: [
                        const Icon(
                          FIcons.lock,
                          size: 64,
                          color: AppTheme.primaryYellow,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Enter your new password below.',
                          style: context.theme.typography.base.copyWith(
                            color: colors.textSecondary,
                          ),
                          textAlign: .center,
                        ),
                        const SizedBox(height: 32),
                        const FormLabel('New Password'),
                        const SizedBox(height: 8),
                        FTextField(
                          control: FTextFieldControl.managed(
                            controller: _passwordController,
                          ),
                          hint: 'Enter your new password',
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
                        const SizedBox(height: 16),
                        const FormLabel('Confirm New Password'),
                        const SizedBox(height: 8),
                        FTextField(
                          control: FTextFieldControl.managed(
                            controller: _confirmPasswordController,
                          ),
                          hint: 'Confirm your new password',
                          obscureText: _obscureConfirmPassword,
                          prefixBuilder: (context, style, states) => Icon(
                            FIcons.lock,
                            color: colors.textSecondary,
                            size: 20,
                          ),
                          suffixBuilder: (context, style, states) => FTappable(
                            onPress: () => setState(
                              () => _obscureConfirmPassword =
                                  !_obscureConfirmPassword,
                            ),
                            child: Icon(
                              _obscureConfirmPassword
                                  ? FIcons.eyeOff
                                  : FIcons.eye,
                              color: colors.textSecondary,
                              size: 20,
                            ),
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
                              onPress: isLoading ? null : _onUpdatePassword,
                              child: isLoading
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: colors.background,
                                      ),
                                    )
                                  : const Text('Update Password'),
                            );
                          },
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
