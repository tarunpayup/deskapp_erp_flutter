import 'package:bcrypt/bcrypt.dart';
import 'package:drift/drift.dart';

import '../../../data/db/app_database.dart';
import '../domain/auth_models.dart';

/// Local-first auth repository mirroring auth_check.php / process_login.php
/// (documents/map.md Module 1). OTP verification is deliberately not part
/// of this flow — a correct username/password takes the user straight to
/// the dashboard, matching the simplified login the user asked for.
///
/// This is the seam where a real backend auth API swaps in later (POST
/// /auth/login) — UI code depends only on this interface, not on the
/// local DB directly.
class AuthRepository {
  AuthRepository(this._db);

  final AppDatabase _db;

  Future<AuthSession> login({
    required String usernameOrEmail,
    required String password,
  }) async {
    final user = await (_db.select(_db.usersTable)..where(
          (t) =>
              t.username.equals(usernameOrEmail) |
              t.email.equals(usernameOrEmail),
        ))
        .getSingleOrNull();

    // Generic message regardless of which field was wrong — mirrors
    // process_login.php's intentional non-leaking error message.
    if (user == null || !BCrypt.checkpw(password, user.password)) {
      throw AuthException('Invalid username or password');
    }

    final now = DateTime.now();
    await (_db.update(_db.usersTable)..where((t) => t.id.equals(user.id)))
        .write(UsersTableCompanion(lastLogin: Value(now)));

    return AuthSession(
      userId: user.id,
      username: user.username,
      fullName: user.fullName,
      email: user.email,
      authTime: now,
    );
  }
}
