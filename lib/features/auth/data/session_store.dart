import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../domain/auth_models.dart';

/// Persists the auth session securely on-device, enforcing the same 24h
/// expiry as the legacy PHP session (auth_check.php `is_authenticated()`).
/// Stands in for a future JWT/opaque-token store once a real backend
/// exists — see documents/map.md Module 1 Flutter conversion notes.
class SessionStore {
  SessionStore(this._storage);

  final FlutterSecureStorage _storage;
  static const _key = 'auth_session';

  Future<void> save(AuthSession session) {
    return _storage.write(key: _key, value: jsonEncode(session.toJson()));
  }

  /// Returns the stored session if present and still within the 24h
  /// validity window; clears and returns null otherwise (mirrors
  /// is_authenticated()'s session_unset()/session_destroy() on expiry).
  Future<AuthSession?> read() async {
    final raw = await _storage.read(key: _key);
    if (raw == null) return null;
    final session = AuthSession.fromJson(
      jsonDecode(raw) as Map<String, dynamic>,
    );
    if (!session.isValid) {
      await clear();
      return null;
    }
    return session;
  }

  Future<void> clear() => _storage.delete(key: _key);
}
