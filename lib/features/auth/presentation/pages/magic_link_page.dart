import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/router/app_router.dart';
import '../../domain/entities/auth_failure.dart';
import '../bloc/auth_bloc.dart';

class MagicLinkPage extends StatefulWidget {
  const MagicLinkPage({super.key});

  @override
  State<MagicLinkPage> createState() => _MagicLinkPageState();
}

class _MagicLinkPageState extends State<MagicLinkPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSendMagicLink() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        .signInWithMagicLink(email: _emailController.text.trim()),
      );
    }
  }

  String _getErrorMessage(AuthFailure failure) {
    return failure.when(
      serverError: (message) => message,
      emailAlreadyInUse: () => 'This email is already registered',
      invalidEmailAndPasswordCombination: () => 'Invalid email',
      weakPassword: () => 'Password is too weak',
      userNotFound: () => 'No user found with this email',
      emailNotVerified: () => 'Please verify your email first',
      tooManyRequests: () => 'Too many attempts. Please try again later',
      networkError: () => 'Network error. Please check your connection',
      cancelledByUser: () => 'Operation was cancelled',
      unknown: (message) => message,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(_getErrorMessage(state.failure)),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          } else if (state is EmailVerificationRequired) {
            EmailVerificationRoute(email: state.email).go(context);
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .stretch,
                  children: [
                    Icon(
                      Icons.link,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Passwordless Sign In',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(fontWeight: .bold),
                      textAlign: .center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Enter your email and we\'ll send you a magic link to sign in',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      textAlign: .center,
                    ),
                    const SizedBox(height: 48),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: .emailAddress,
                      textInputAction: .done,
                      onFieldSubmitted: (_) => _onSendMagicLink(),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        final isLoading = state is AuthLoading;
                        return FilledButton.icon(
                          onPressed: isLoading ? null : _onSendMagicLink,
                          style: FilledButton.styleFrom(
                            padding: const .symmetric(vertical: 16),
                          ),
                          icon: isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.send),
                          label: const Text('Send Magic Link'),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          'Prefer password? ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            const LoginRoute().go(context);
                          },
                          child: const Text('Sign In'),
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
    );
  }
}
