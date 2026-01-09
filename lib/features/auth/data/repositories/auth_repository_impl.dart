import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taskhub/core/deep_link/deep_link_config.dart';
import 'package:taskhub/features/auth/domain/entities/auth_models.dart';
import '../../../../core/env/env.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/entities/auth_failure.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final GoTrueClient _auth;
  final GoogleSignIn _googleSignIn;
  bool _googleSignInInitialized = false;

  AuthRepositoryImpl(this._auth, this._googleSignIn);

  Future<void> _ensureGoogleSignInInitialized() async {
    if (_googleSignInInitialized) {
      return;
    }

    final googleSignIn = _googleSignIn;

    if (kIsWeb) {
      await googleSignIn.initialize(clientId: Env.googleWebClientId);
    } else {
      await googleSignIn.initialize(
        serverClientId: Env.googleWebClientId,
        clientId: Env.googleIosClientId,
      );
    }

    _googleSignInInitialized = true;
  }

  @override
  Stream<AuthStateChangeEvent> get authStateChanges {
    return _auth.onAuthStateChange.map((event) {
      final user = event.session?.user;
      final appUser = user != null ? _mapSupabaseUser(user) : null;
      return AuthStateChangeEvent(
        user: appUser,
        eventType: _mapAuthChangeEvent(event.event),
      );
    });
  }

  /// Maps Supabase AuthChangeEvent to our AuthChangeEventType.
  AuthChangeEventType _mapAuthChangeEvent(AuthChangeEvent event) {
    return switch (event) {
      .initialSession => .initialSession,
      .signedIn => .signedIn,
      .signedOut => .signedOut,
      .passwordRecovery => .passwordRecovery,
      .tokenRefreshed => .tokenRefreshed,
      .userUpdated => .userUpdated,
      // ignore: deprecated_member_use
      .userDeleted => .userDeleted,
      .mfaChallengeVerified => .mfaChallengeVerified,
    };
  }

  @override
  AppUser? get currentUser {
    final user = _auth.currentUser;
    return user != null ? _mapSupabaseUser(user) : null;
  }

  @override
  bool get isSignedIn => _auth.currentSession != null;

  @override
  Future<({AppUser? user, AuthFailure? failure})> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: DeepLinkConfig.redirectUrl,
      );

      if (response.user != null) {
        return (user: _mapSupabaseUser(response.user!), failure: null);
      }

      return (user: null, failure: const AuthFailure.unknown('Sign up failed'));
    } on AuthException catch (e) {
      developer.log(e.message, name: 'AuthRepository');
      return (user: null, failure: _mapAuthException(e));
    } catch (e) {
      return (user: null, failure: AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({AppUser? user, AuthFailure? failure})> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        return (user: _mapSupabaseUser(response.user!), failure: null);
      }

      return (user: null, failure: const AuthFailure.unknown('Sign in failed'));
    } on AuthException catch (e) {
      return (user: null, failure: _mapAuthException(e));
    } catch (e) {
      return (user: null, failure: AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({AppUser? user, AuthFailure? failure})> signInWithGoogle() async {
    try {
      developer.log('Starting Google Sign-In...', name: 'AuthRepository');

      if (kIsWeb) {
        developer.log(
          'Using Supabase OAuth flow for web',
          name: 'AuthRepository',
        );
        final response = await _auth.signInWithOAuth(
          .google,
          redirectTo: kIsWeb ? null : DeepLinkConfig.redirectUrl,
          authScreenLaunchMode: LaunchMode.externalApplication,
        );

        developer.log('OAuth initiated: $response', name: 'AuthRepository');

        return (user: null, failure: null);
      }

      await _ensureGoogleSignInInitialized();
      developer.log('Google Sign-In initialized', name: 'AuthRepository');

      final googleSignIn = GoogleSignIn.instance;
      const scopes = ['email', 'profile'];

      developer.log(
        'Attempting lightweight authentication...',
        name: 'AuthRepository',
      );
      var googleUser = await googleSignIn.attemptLightweightAuthentication();
      developer.log(
        'Lightweight auth result: ${googleUser != null}',
        name: 'AuthRepository',
      );

      if (googleUser == null) {
        developer.log(
          'Starting full authentication...',
          name: 'AuthRepository',
        );
        googleUser = await googleSignIn.authenticate();
        developer.log('Full auth completed', name: 'AuthRepository');
      }

      final idToken = googleUser.authentication.idToken;
      developer.log(
        'ID Token obtained: ${idToken != null}',
        name: 'AuthRepository',
      );

      if (idToken == null) {
        developer.log('ERROR: No ID token found', name: 'AuthRepository');
        return (
          user: null,
          failure: const AuthFailure.serverError('No ID token found'),
        );
      }

      developer.log(
        'Getting authorization for scopes...',
        name: 'AuthRepository',
      );
      final authorization =
          await googleUser.authorizationClient.authorizationForScopes(scopes) ??
          await googleUser.authorizationClient.authorizeScopes(scopes);
      developer.log(
        'Access token obtained: ${authorization.accessToken}',
        name: 'AuthRepository',
      );

      developer.log('Signing in with Supabase...', name: 'AuthRepository');
      final response = await _auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: authorization.accessToken,
      );
      developer.log(
        'Supabase sign-in completed: ${response.user != null}',
        name: 'AuthRepository',
      );

      if (response.user != null) {
        return (user: _mapSupabaseUser(response.user!), failure: null);
      }

      return (
        user: null,
        failure: const AuthFailure.unknown('Google sign in failed'),
      );
    } on GoogleSignInException catch (e) {
      developer.log(
        'GoogleSignInException: ${e.code} - ${e.description}',
        name: 'AuthRepository',
      );
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return (user: null, failure: const AuthFailure.cancelledByUser());
      }
      return (
        user: null,
        failure: AuthFailure.serverError(
          e.description ?? 'Google sign in error',
        ),
      );
    } on AuthException catch (e) {
      developer.log('AuthException: ${e.message}', name: 'AuthRepository');
      return (user: null, failure: _mapAuthException(e));
    } catch (e, stackTrace) {
      developer.log(
        'Unknown error: $e',
        name: 'AuthRepository',
        error: e,
        stackTrace: stackTrace,
      );
      if (e.toString().contains('canceled') ||
          e.toString().contains('cancelled')) {
        return (user: null, failure: const AuthFailure.cancelledByUser());
      }
      return (user: null, failure: AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<AuthFailure?> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      return null;
    } on AuthException catch (e) {
      return _mapAuthException(e);
    } catch (e) {
      return AuthFailure.unknown(e.toString());
    }
  }

  @override
  Future<AuthFailure?> signInWithMagicLink({required String email}) async {
    try {
      await _auth.signInWithOtp(
        email: email,
        emailRedirectTo: DeepLinkConfig.redirectUrl,
      );
      return null;
    } on AuthException catch (e) {
      return _mapAuthException(e);
    } catch (e) {
      return AuthFailure.unknown(e.toString());
    }
  }

  @override
  Future<AuthFailure?> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.resetPasswordForEmail(
        email,
        redirectTo: DeepLinkConfig.redirectUrl,
      );
      return null;
    } on AuthException catch (e) {
      return _mapAuthException(e);
    } catch (e) {
      return AuthFailure.unknown(e.toString());
    }
  }

  @override
  Future<AuthFailure?> updatePassword({required String newPassword}) async {
    try {
      await _auth.updateUser(UserAttributes(password: newPassword));
      return null;
    } on AuthException catch (e) {
      return _mapAuthException(e);
    } catch (e) {
      return AuthFailure.unknown(e.toString());
    }
  }

  @override
  Future<AuthFailure?> resendVerificationEmail({required String email}) async {
    try {
      await _auth.resend(
        type: .signup,
        email: email,
        emailRedirectTo: DeepLinkConfig.redirectUrl,
      );
      return null;
    } on AuthException catch (e) {
      return _mapAuthException(e);
    } catch (e) {
      return AuthFailure.unknown(e.toString());
    }
  }

  @override
  Future<({AppUser? user, AuthFailure? failure})> verifyOtp({
    required String email,
    required String token,
    required AuthOtpType type,
  }) async {
    try {
      final OtpType otpType = switch (type) {
        .signup => .signup,
        .recovery => .recovery,
        .email => .email,
      };
      final response = await _auth.verifyOTP(
        email: email,
        token: token,
        type: otpType,
      );

      if (response.user != null) {
        return (user: _mapSupabaseUser(response.user!), failure: null);
      }

      return (
        user: null,
        failure: const AuthFailure.unknown('OTP verification failed'),
      );
    } on AuthException catch (e) {
      return (user: null, failure: _mapAuthException(e));
    } catch (e) {
      return (user: null, failure: AuthFailure.unknown(e.toString()));
    }
  }

  AppUser _mapSupabaseUser(User user) {
    return AppUser(
      id: user.id,
      email: user.email ?? '',
      displayName:
          user.userMetadata?['full_name'] as String? ??
          user.userMetadata?['name'] as String?,
      avatarUrl:
          user.userMetadata?['avatar_url'] as String? ??
          user.userMetadata?['picture'] as String?,
      emailConfirmed: user.emailConfirmedAt != null,
      createdAt: DateTime.parse(user.createdAt),
      lastSignInAt: user.lastSignInAt != null
          ? DateTime.parse(user.lastSignInAt!)
          : null,
    );
  }

  AuthFailure _mapAuthException(AuthException e) {
    final message = e.message.toLowerCase();

    if (message.contains('email already registered') ||
        message.contains('user already registered')) {
      return const AuthFailure.emailAlreadyInUse();
    }

    if (message.contains('invalid login credentials') ||
        message.contains('invalid email or password')) {
      return const AuthFailure.invalidEmailAndPasswordCombination();
    }

    if (message.contains('password') && message.contains('weak')) {
      return const AuthFailure.weakPassword();
    }

    if (message.contains('user not found')) {
      return const AuthFailure.userNotFound();
    }

    if (message.contains('email not confirmed')) {
      return const AuthFailure.emailNotVerified();
    }

    if (message.contains('rate limit') || message.contains('too many')) {
      return const AuthFailure.tooManyRequests();
    }

    if (message.contains('network') || message.contains('connection')) {
      return const AuthFailure.networkError();
    }

    return AuthFailure.serverError(e.message);
  }

  @override
  Future<({AppUser? user, AuthFailure? failure})> verifyOtpWithTokenHash({
    required String tokenHash,
    required AuthOtpType type,
  }) async {
    try {
      final OtpType otpType = switch (type) {
        .signup => .signup,
        .recovery => .recovery,
        .email => .email,
      };
      final response = await _auth.verifyOTP(
        tokenHash: tokenHash,
        type: otpType,
      );

      if (response.user != null) {
        return (user: _mapSupabaseUser(response.user!), failure: null);
      }

      return (
        user: null,
        failure: const AuthFailure.unknown('Token verification failed'),
      );
    } on AuthException catch (e) {
      return (user: null, failure: _mapAuthException(e));
    } catch (e) {
      return (user: null, failure: AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({AppUser? user, AuthFailure? failure})> setSessionFromTokens({
    // accessToken is provided by deep links but Supabase's setSession
    // only requires the refreshToken to establish a new session
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      final response = await _auth.setSession(refreshToken);

      if (response.user != null) {
        return (user: _mapSupabaseUser(response.user!), failure: null);
      }

      return (
        user: null,
        failure: const AuthFailure.unknown('Failed to set session from tokens'),
      );
    } on AuthException catch (e) {
      return (user: null, failure: _mapAuthException(e));
    } catch (e) {
      return (user: null, failure: AuthFailure.unknown(e.toString()));
    }
  }

  @override
  Future<({AppUser? user, AuthFailure? failure})> updateProfile({
    String? displayName,
    String? avatarUrl,
  }) async {
    try {
      final Map<String, dynamic> data = {};
      if (displayName != null) {
        data['full_name'] = displayName;
      }
      if (avatarUrl != null) {
        data['avatar_url'] = avatarUrl;
      }

      final response = await _auth.updateUser(UserAttributes(data: data));

      if (response.user != null) {
        return (user: _mapSupabaseUser(response.user!), failure: null);
      }

      return (
        user: null,
        failure: const AuthFailure.unknown('Profile update failed'),
      );
    } on AuthException catch (e) {
      return (user: null, failure: _mapAuthException(e));
    } catch (e) {
      return (user: null, failure: AuthFailure.unknown(e.toString()));
    }
  }
}
