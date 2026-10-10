import 'package:bcrypt/bcrypt.dart';
import 'package:drift/drift.dart';

import '../app_database.dart';

/// Seeds the local `users` table with a **fixture** dev account (not real
/// production credentials) so the Auth module is testable end-to-end while
/// no backend exists yet. Replace/remove this seed once a real auth API is
/// wired up (see AuthRepository) — local-first is a development seam, not
/// where real account data should live.
///
/// Dev login: username `devadmin`, password `DevPass123!`
Future<void> seedUsers(AppDatabase db) async {
  final hash = BCrypt.hashpw('DevPass123!', BCrypt.gensalt());
  await db.into(db.usersTable).insert(
    UsersTableCompanion.insert(
      email: 'devadmin@example.local',
      username: 'devadmin',
      password: hash,
      fullName: 'Dev Admin',
      gender: const Value('male'),
      city: const Value('Agra'),
      state: const Value('Uttar Pradesh'),
    ),
  );
}
