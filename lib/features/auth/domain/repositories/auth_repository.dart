import '../entities/app_user.dart';
import '../entities/auth_failure.dart';
import '../entities/auth_models.dart';

abstract class AuthRepository {
  Stream<AuthStateChangeEvent> get authStateChanges;

  AppUser? get currentUser;

  bool get isSignedIn;

  Future<({AppUser? user, AuthFailure? failure})> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<({AppUser? user, AuthFailure? failure})> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<({AppUser? user, AuthFailure? failure})> signInWithGoogle();

  Future<AuthFailure?> signInWithMagicLink({required String email});

  Future<AuthFailure?> signOut();

  Future<AuthFailure?> sendPasswordResetEmail({required String email});

  Future<AuthFailure?> updatePassword({required String newPassword});

  Future<AuthFailure?> resendVerificationEmail({required String email});

  Future<({AppUser? user, AuthFailure? failure})> verifyOtp({
    required String email,
    required String token,
    required AuthOtpType type,
  });

  Future<({AppUser? user, AuthFailure? failure})> verifyOtpWithTokenHash({
    required String tokenHash,
    required AuthOtpType type,
  });

  Future<({AppUser? user, AuthFailure? failure})> setSessionFromTokens({
    required String accessToken,
    required String refreshToken,
  });
}
