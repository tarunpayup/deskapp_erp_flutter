import 'package:drift/drift.dart';

/// Employee master — mirrors the real `employee` table (documents/map.md
/// Module 2). `employee_code` is still a display code (EMP-####) but
/// generated from a count+1 scheme guarded in PayrollRepository rather
/// than a raw `ORDER BY ... DESC LIMIT 1` (legacy's not-gap-safe approach).
class EmployeesTable extends Table {
  @override
  String get tableName => 'employee';

  IntColumn get employeeId => integer().autoIncrement()();
  TextColumn get employeeCode => text().named('employee_code')(); // EMP-####
  TextColumn get employeeName => text().named('employee_name')();
  TextColumn get fatherName => text().named('father_name').nullable()();
  DateTimeColumn get dob => dateTime().nullable()();
  TextColumn get gender => text().nullable()();
  DateTimeColumn get dateOfJoining => dateTime().named('date_of_joining')();
  TextColumn get mobNo => text().named('mob_no')();
  TextColumn get alternateMobNo => text().named('alternate_mob_no').nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get state => text().nullable()();
  TextColumn get city => text().nullable()();
  TextColumn get pincode => text().nullable()();
  TextColumn get aadhar => text().nullable()();
  TextColumn get pan => text().nullable()();
  TextColumn get designation => text().nullable()();
  TextColumn get department => text().nullable()();
  TextColumn get status =>
      text().withDefault(const Constant('Active'))(); // Active | Not Active
  RealColumn get salary => real().withDefault(const Constant(0))();
  // 'Monthly' | 'Weekly' | 'Daily' — drives the salary formula (see
  // PayrollRepository.computeCredited).
  TextColumn get salaryType => text().named('salary_type').withDefault(const Constant('Monthly'))();
  TextColumn get bankName => text().named('bank_name').nullable()();
  TextColumn get bankAccountNumber => text().named('bank_account_number').nullable()();
  TextColumn get bankIfsc => text().named('bank_ifsc').nullable()();
  TextColumn get emergencyContactName => text().named('emergency_contact_name').nullable()();
  TextColumn get emergencyContactNumber => text().named('emergency_contact_number').nullable()();
  DateTimeColumn get createdAt =>
      dateTime().named('created_at').withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {mobNo},
  ];
}
