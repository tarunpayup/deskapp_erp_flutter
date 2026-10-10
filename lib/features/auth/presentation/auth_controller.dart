import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../domain/auth_models.dart';

/// Auth flow state machine — mirrors the legacy login.php → index.php
/// flow (documents/map.md Module 1), with OTP removed: a correct
/// username/password takes the user straight to the dashboard.
sealed class AuthState {
  const AuthState();
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated({this.errorMessage});
  final String? errorMessage;
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(this.session);
  final AuthSession session;
}

class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() {
    _restoreSession();
    return const AuthLoading();
  }

  Future<void> _restoreSession() async {
    final stored = await ref.read(sessionStoreProvider).read();
    state = stored != null
        ? AuthAuthenticated(stored)
        : const AuthUnauthenticated();
  }

  Future<void> login(String usernameOrEmail, String password) async {
    state = const AuthLoading();
    try {
      final session = await ref
          .read(authRepositoryProvider)
          .login(usernameOrEmail: usernameOrEmail, password: password);
      await ref.read(sessionStoreProvider).save(session);
      state = AuthAuthenticated(session);
    } on Exception catch (e) {
      state = AuthUnauthenticated(errorMessage: e.toString());
    }
  }

  Future<void> logout() async {
    await ref.read(sessionStoreProvider).clear();
    state = const AuthUnauthenticated();
  }
}

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);
