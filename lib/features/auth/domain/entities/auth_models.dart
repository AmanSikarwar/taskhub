import 'package:taskhub/features/auth/domain/entities/app_user.dart';

class AuthStateChangeEvent {
  final AppUser? user;
  final AuthChangeEventType eventType;

  const AuthStateChangeEvent({required this.user, required this.eventType});
}

enum AuthChangeEventType {
  initialSession,
  signedIn,
  signedOut,
  passwordRecovery,
  tokenRefreshed,
  userUpdated,
  userDeleted,
  mfaChallengeVerified,
}

enum AuthOtpType { signup, recovery, email }
