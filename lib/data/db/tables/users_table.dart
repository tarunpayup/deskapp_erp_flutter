import 'package:drift/drift.dart';

/// Mirrors the real `users` table (database/u824831432_deskapp.sql,
/// documents/map.md Appendix C). Local-first: this table is the on-device
/// mirror of what will eventually be served by a real auth API — see
/// AuthRepository for the swap seam.
class UsersTable extends Table {
  @override
  String get tableName => 'users';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get email => text().withLength(max: 255)();
  TextColumn get username => text().withLength(max: 100)();
  TextColumn get password => text().withLength(max: 255)();
  TextColumn get fullName => text().named('full_name').withLength(max: 200)();
  TextColumn get gender => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get state => text().nullable()();
  DateTimeColumn get lastLogin => dateTime().named('last_login').nullable()();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt =>
      dateTime().named('updated_at').withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {email},
    {username},
  ];
}
