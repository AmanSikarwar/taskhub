import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taskhub/features/auth/domain/entities/auth_models.dart';

import '../../domain/entities/app_user.dart';
import '../../domain/entities/auth_failure.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<AuthStateChangeEvent>? _authStateSubscription;

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<SignUpWithEmailAndPassword>(_onSignUpWithEmailAndPassword);
    on<SignInWithEmailAndPassword>(_onSignInWithEmailAndPassword);
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<SignInWithMagicLink>(_onSignInWithMagicLink);
    on<SignOut>(_onSignOut);
    on<SendPasswordResetEmail>(_onSendPasswordResetEmail);
    on<UpdatePassword>(_onUpdatePassword);
    on<ResendVerificationEmail>(_onResendVerificationEmail);
    on<VerifyOtp>(_onVerifyOtp);
    on<HandleDeepLinkTokenHash>(_onHandleDeepLinkTokenHash);
    on<HandleDeepLinkSession>(_onHandleDeepLinkSession);
    on<AuthStateChanged>(_onAuthStateChanged);
    on<UpdateProfile>(_onUpdateProfile);

    _authStateSubscription = _authRepository.authStateChanges.listen(
      (event) => add(
        .authStateChanged(user: event.user, eventType: event.eventType.name),
      ),
    );
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    final user = _authRepository.currentUser;
    if (user != null) {
      emit(.authenticated(user));
    } else {
      emit(const .unauthenticated());
    }
  }

  Future<void> _onSignUpWithEmailAndPassword(
    SignUpWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final result = await _authRepository.signUpWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.user != null) {
      if (!result.user!.emailConfirmed) {
        emit(.emailVerificationRequired(email: event.email));
      } else {
        emit(.authenticated(result.user!));
      }
    }
  }

  Future<void> _onSignInWithEmailAndPassword(
    SignInWithEmailAndPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final result = await _authRepository.signInWithEmailAndPassword(
      email: event.email,
      password: event.password,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.user != null) {
      emit(.authenticated(result.user!));
    }
  }

  Future<void> _onSignInWithGoogle(
    SignInWithGoogle event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final result = await _authRepository.signInWithGoogle();

    if (result.failure != null) {
      if (result.failure is CancelledByUser) {
        emit(const .unauthenticated());
      } else {
        emit(.error(result.failure!));
      }
    } else if (result.user != null) {
      emit(.authenticated(result.user!));
    }
  }

  Future<void> _onSignOut(SignOut event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final failure = await _authRepository.signOut();

    if (failure != null) {
      emit(AuthState.error(failure));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onSignInWithMagicLink(
    SignInWithMagicLink event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final failure = await _authRepository.signInWithMagicLink(
      email: event.email,
    );

    if (failure != null) {
      emit(.error(failure));
    } else {
      emit(.emailVerificationRequired(email: event.email));
    }
  }

  Future<void> _onSendPasswordResetEmail(
    SendPasswordResetEmail event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final failure = await _authRepository.sendPasswordResetEmail(
      email: event.email,
    );

    if (failure != null) {
      emit(.error(failure));
    } else {
      emit(const .passwordResetEmailSent());
    }
  }

  Future<void> _onUpdatePassword(
    UpdatePassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final failure = await _authRepository.updatePassword(
      newPassword: event.newPassword,
    );

    if (failure != null) {
      emit(.error(failure));
    } else {
      emit(const .passwordUpdated());
    }
  }

  Future<void> _onResendVerificationEmail(
    ResendVerificationEmail event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final failure = await _authRepository.resendVerificationEmail(
      email: event.email,
    );

    if (failure != null) {
      emit(.error(failure));
    } else {
      emit(.emailVerificationRequired(email: event.email));
    }
  }

  Future<void> _onVerifyOtp(VerifyOtp event, Emitter<AuthState> emit) async {
    emit(const .loading());

    final otpType = switch (event.type) {
      'signup' => AuthOtpType.signup,
      'recovery' => AuthOtpType.recovery,
      _ => AuthOtpType.email,
    };

    final result = await _authRepository.verifyOtp(
      email: event.email,
      token: event.token,
      type: otpType,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.user != null) {
      emit(.authenticated(result.user!));
    }
  }

  void _onAuthStateChanged(AuthStateChanged event, Emitter<AuthState> emit) {
    if (event.eventType == AuthChangeEventType.passwordRecovery.name &&
        event.user != null) {
      emit(.passwordResetReady(event.user!));
      return;
    }

    if (event.user != null) {
      emit(.authenticated(event.user!));
    } else {
      emit(const .unauthenticated());
    }
  }

  Future<void> _onHandleDeepLinkTokenHash(
    HandleDeepLinkTokenHash event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final otpType = switch (event.type) {
      'signup' => AuthOtpType.signup,
      'recovery' => AuthOtpType.recovery,
      _ => AuthOtpType.email,
    };

    final result = await _authRepository.verifyOtpWithTokenHash(
      tokenHash: event.tokenHash,
      type: otpType,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.user != null) {
      if (event.type == 'recovery') {
        emit(.passwordResetReady(result.user!));
      } else {
        emit(.authenticated(result.user!));
      }
    }
  }

  Future<void> _onHandleDeepLinkSession(
    HandleDeepLinkSession event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final result = await _authRepository.setSessionFromTokens(
      accessToken: event.accessToken,
      refreshToken: event.refreshToken,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.user != null) {
      if (event.type == 'recovery') {
        emit(.passwordResetReady(result.user!));
      } else {
        emit(.authenticated(result.user!));
      }
    }
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }

  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<AuthState> emit,
  ) async {
    emit(const .loading());

    final result = await _authRepository.updateProfile(
      displayName: event.displayName,
      avatarUrl: event.avatarUrl,
    );

    if (result.failure != null) {
      emit(.error(result.failure!));
    } else if (result.user != null) {
      emit(.profileUpdated(result.user!));
    }
  }
}
