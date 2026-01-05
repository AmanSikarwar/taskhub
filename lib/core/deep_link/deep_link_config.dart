abstract class DeepLinkConfig {
  static const String scheme = 'io.taskhub';
  static const String authHost = 'auth-callback';
  static String get redirectUrl => '$scheme://$authHost';
}

class AuthDeepLink {
  final String? accessToken;
  final String? refreshToken;
  final String? tokenHash;
  final String? type;
  final String? error;
  final String? errorCode;
  final String? errorDescription;

  const AuthDeepLink({
    this.accessToken,
    this.refreshToken,
    this.tokenHash,
    this.type,
    this.error,
    this.errorCode,
    this.errorDescription,
  });

  bool get hasSessionTokens =>
      accessToken != null &&
      accessToken!.isNotEmpty &&
      refreshToken != null &&
      refreshToken!.isNotEmpty;

  bool get hasTokenHash => tokenHash != null && tokenHash!.isNotEmpty;

  bool get hasError => error != null || errorCode != null;

  bool get isRecovery => type == 'recovery';

  bool get isEmailVerification => type == 'signup' || type == 'email';

  @override
  String toString() {
    return 'AuthDeepLink(type: $type, hasSessionTokens: $hasSessionTokens, '
        'hasTokenHash: $hasTokenHash, hasError: $hasError)';
  }
}
