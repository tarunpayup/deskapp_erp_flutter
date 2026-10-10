// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 200),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastLoginMeta =
      const VerificationMeta('lastLogin');
  @override
  late final GeneratedColumn<DateTime> lastLogin = GeneratedColumn<DateTime>(
      'last_login', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        email,
        username,
        password,
        fullName,
        gender,
        city,
        state,
        lastLogin,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UsersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('last_login')) {
      context.handle(_lastLoginMeta,
          lastLogin.isAcceptableOrUnknown(data['last_login']!, _lastLoginMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {email},
        {username},
      ];
  @override
  UsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender']),
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      lastLogin: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_login']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class UsersTableData extends DataClass implements Insertable<UsersTableData> {
  final int id;
  final String email;
  final String username;
  final String password;
  final String fullName;
  final String? gender;
  final String? city;
  final String? state;
  final DateTime? lastLogin;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UsersTableData(
      {required this.id,
      required this.email,
      required this.username,
      required this.password,
      required this.fullName,
      this.gender,
      this.city,
      this.state,
      this.lastLogin,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || lastLogin != null) {
      map['last_login'] = Variable<DateTime>(lastLogin);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      id: Value(id),
      email: Value(email),
      username: Value(username),
      password: Value(password),
      fullName: Value(fullName),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      lastLogin: lastLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLogin),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UsersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTableData(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      fullName: serializer.fromJson<String>(json['fullName']),
      gender: serializer.fromJson<String?>(json['gender']),
      city: serializer.fromJson<String?>(json['city']),
      state: serializer.fromJson<String?>(json['state']),
      lastLogin: serializer.fromJson<DateTime?>(json['lastLogin']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'fullName': serializer.toJson<String>(fullName),
      'gender': serializer.toJson<String?>(gender),
      'city': serializer.toJson<String?>(city),
      'state': serializer.toJson<String?>(state),
      'lastLogin': serializer.toJson<DateTime?>(lastLogin),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UsersTableData copyWith(
          {int? id,
          String? email,
          String? username,
          String? password,
          String? fullName,
          Value<String?> gender = const Value.absent(),
          Value<String?> city = const Value.absent(),
          Value<String?> state = const Value.absent(),
          Value<DateTime?> lastLogin = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      UsersTableData(
        id: id ?? this.id,
        email: email ?? this.email,
        username: username ?? this.username,
        password: password ?? this.password,
        fullName: fullName ?? this.fullName,
        gender: gender.present ? gender.value : this.gender,
        city: city.present ? city.value : this.city,
        state: state.present ? state.value : this.state,
        lastLogin: lastLogin.present ? lastLogin.value : this.lastLogin,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UsersTableData copyWithCompanion(UsersTableCompanion data) {
    return UsersTableData(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      gender: data.gender.present ? data.gender.value : this.gender,
      city: data.city.present ? data.city.value : this.city,
      state: data.state.present ? data.state.value : this.state,
      lastLogin: data.lastLogin.present ? data.lastLogin.value : this.lastLogin,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableData(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('fullName: $fullName, ')
          ..write('gender: $gender, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('lastLogin: $lastLogin, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, username, password, fullName,
      gender, city, state, lastLogin, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTableData &&
          other.id == this.id &&
          other.email == this.email &&
          other.username == this.username &&
          other.password == this.password &&
          other.fullName == this.fullName &&
          other.gender == this.gender &&
          other.city == this.city &&
          other.state == this.state &&
          other.lastLogin == this.lastLogin &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersTableCompanion extends UpdateCompanion<UsersTableData> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> username;
  final Value<String> password;
  final Value<String> fullName;
  final Value<String?> gender;
  final Value<String?> city;
  final Value<String?> state;
  final Value<DateTime?> lastLogin;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.fullName = const Value.absent(),
    this.gender = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.lastLogin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UsersTableCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String username,
    required String password,
    required String fullName,
    this.gender = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.lastLogin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : email = Value(email),
        username = Value(username),
        password = Value(password),
        fullName = Value(fullName);
  static Insertable<UsersTableData> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? fullName,
    Expression<String>? gender,
    Expression<String>? city,
    Expression<String>? state,
    Expression<DateTime>? lastLogin,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (fullName != null) 'full_name': fullName,
      if (gender != null) 'gender': gender,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (lastLogin != null) 'last_login': lastLogin,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UsersTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? email,
      Value<String>? username,
      Value<String>? password,
      Value<String>? fullName,
      Value<String?>? gender,
      Value<String?>? city,
      Value<String?>? state,
      Value<DateTime?>? lastLogin,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return UsersTableCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      city: city ?? this.city,
      state: state ?? this.state,
      lastLogin: lastLogin ?? this.lastLogin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (lastLogin.present) {
      map['last_login'] = Variable<DateTime>(lastLogin.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('fullName: $fullName, ')
          ..write('gender: $gender, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('lastLogin: $lastLogin, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $LedgerTableTable extends LedgerTable
    with TableInfo<$LedgerTableTable, LedgerTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LedgerTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lidMeta = const VerificationMeta('lid');
  @override
  late final GeneratedColumn<int> lid = GeneratedColumn<int>(
      'lid', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _accountTypeMeta =
      const VerificationMeta('accountType');
  @override
  late final GeneratedColumn<String> accountType = GeneratedColumn<String>(
      'account_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountNameMeta =
      const VerificationMeta('accountName');
  @override
  late final GeneratedColumn<String> accountName = GeneratedColumn<String>(
      'account_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountCodeMeta =
      const VerificationMeta('accountCode');
  @override
  late final GeneratedColumn<String> accountCode = GeneratedColumn<String>(
      'account_code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<double> openingBalance = GeneratedColumn<double>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _dcMeta = const VerificationMeta('dc');
  @override
  late final GeneratedColumn<int> dc = GeneratedColumn<int>(
      'dc', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _otherMeta = const VerificationMeta('other');
  @override
  late final GeneratedColumn<String> other = GeneratedColumn<String>(
      'other', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _currentBalanceMeta =
      const VerificationMeta('currentBalance');
  @override
  late final GeneratedColumn<double> currentBalance = GeneratedColumn<double>(
      'current_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _dcCurrentMeta =
      const VerificationMeta('dcCurrent');
  @override
  late final GeneratedColumn<int> dcCurrent = GeneratedColumn<int>(
      'dc_current', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _transDateMeta =
      const VerificationMeta('transDate');
  @override
  late final GeneratedColumn<DateTime> transDate = GeneratedColumn<DateTime>(
      'trans_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Active'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        lid,
        accountType,
        accountName,
        accountCode,
        openingBalance,
        dc,
        other,
        description,
        currentBalance,
        dcCurrent,
        transDate,
        status,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ledger';
  @override
  VerificationContext validateIntegrity(Insertable<LedgerTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('lid')) {
      context.handle(
          _lidMeta, lid.isAcceptableOrUnknown(data['lid']!, _lidMeta));
    }
    if (data.containsKey('account_type')) {
      context.handle(
          _accountTypeMeta,
          accountType.isAcceptableOrUnknown(
              data['account_type']!, _accountTypeMeta));
    } else if (isInserting) {
      context.missing(_accountTypeMeta);
    }
    if (data.containsKey('account_name')) {
      context.handle(
          _accountNameMeta,
          accountName.isAcceptableOrUnknown(
              data['account_name']!, _accountNameMeta));
    } else if (isInserting) {
      context.missing(_accountNameMeta);
    }
    if (data.containsKey('account_code')) {
      context.handle(
          _accountCodeMeta,
          accountCode.isAcceptableOrUnknown(
              data['account_code']!, _accountCodeMeta));
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
          _openingBalanceMeta,
          openingBalance.isAcceptableOrUnknown(
              data['opening_balance']!, _openingBalanceMeta));
    }
    if (data.containsKey('dc')) {
      context.handle(_dcMeta, dc.isAcceptableOrUnknown(data['dc']!, _dcMeta));
    }
    if (data.containsKey('other')) {
      context.handle(
          _otherMeta, other.isAcceptableOrUnknown(data['other']!, _otherMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('current_balance')) {
      context.handle(
          _currentBalanceMeta,
          currentBalance.isAcceptableOrUnknown(
              data['current_balance']!, _currentBalanceMeta));
    }
    if (data.containsKey('dc_current')) {
      context.handle(_dcCurrentMeta,
          dcCurrent.isAcceptableOrUnknown(data['dc_current']!, _dcCurrentMeta));
    }
    if (data.containsKey('trans_date')) {
      context.handle(_transDateMeta,
          transDate.isAcceptableOrUnknown(data['trans_date']!, _transDateMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lid};
  @override
  LedgerTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LedgerTableData(
      lid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lid'])!,
      accountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_type'])!,
      accountName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_name'])!,
      accountCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_code'])!,
      openingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}opening_balance'])!,
      dc: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dc'])!,
      other: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}other']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      currentBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}current_balance'])!,
      dcCurrent: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dc_current'])!,
      transDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}trans_date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $LedgerTableTable createAlias(String alias) {
    return $LedgerTableTable(attachedDatabase, alias);
  }
}

class LedgerTableData extends DataClass implements Insertable<LedgerTableData> {
  final int lid;
  final String accountType;
  final String accountName;
  final String accountCode;
  final double openingBalance;
  final int dc;
  final String? other;
  final String? description;
  final double currentBalance;
  final int dcCurrent;
  final DateTime transDate;
  final String status;
  final DateTime createdAt;
  const LedgerTableData(
      {required this.lid,
      required this.accountType,
      required this.accountName,
      required this.accountCode,
      required this.openingBalance,
      required this.dc,
      this.other,
      this.description,
      required this.currentBalance,
      required this.dcCurrent,
      required this.transDate,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['lid'] = Variable<int>(lid);
    map['account_type'] = Variable<String>(accountType);
    map['account_name'] = Variable<String>(accountName);
    map['account_code'] = Variable<String>(accountCode);
    map['opening_balance'] = Variable<double>(openingBalance);
    map['dc'] = Variable<int>(dc);
    if (!nullToAbsent || other != null) {
      map['other'] = Variable<String>(other);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['current_balance'] = Variable<double>(currentBalance);
    map['dc_current'] = Variable<int>(dcCurrent);
    map['trans_date'] = Variable<DateTime>(transDate);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LedgerTableCompanion toCompanion(bool nullToAbsent) {
    return LedgerTableCompanion(
      lid: Value(lid),
      accountType: Value(accountType),
      accountName: Value(accountName),
      accountCode: Value(accountCode),
      openingBalance: Value(openingBalance),
      dc: Value(dc),
      other:
          other == null && nullToAbsent ? const Value.absent() : Value(other),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      currentBalance: Value(currentBalance),
      dcCurrent: Value(dcCurrent),
      transDate: Value(transDate),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory LedgerTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LedgerTableData(
      lid: serializer.fromJson<int>(json['lid']),
      accountType: serializer.fromJson<String>(json['accountType']),
      accountName: serializer.fromJson<String>(json['accountName']),
      accountCode: serializer.fromJson<String>(json['accountCode']),
      openingBalance: serializer.fromJson<double>(json['openingBalance']),
      dc: serializer.fromJson<int>(json['dc']),
      other: serializer.fromJson<String?>(json['other']),
      description: serializer.fromJson<String?>(json['description']),
      currentBalance: serializer.fromJson<double>(json['currentBalance']),
      dcCurrent: serializer.fromJson<int>(json['dcCurrent']),
      transDate: serializer.fromJson<DateTime>(json['transDate']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lid': serializer.toJson<int>(lid),
      'accountType': serializer.toJson<String>(accountType),
      'accountName': serializer.toJson<String>(accountName),
      'accountCode': serializer.toJson<String>(accountCode),
      'openingBalance': serializer.toJson<double>(openingBalance),
      'dc': serializer.toJson<int>(dc),
      'other': serializer.toJson<String?>(other),
      'description': serializer.toJson<String?>(description),
      'currentBalance': serializer.toJson<double>(currentBalance),
      'dcCurrent': serializer.toJson<int>(dcCurrent),
      'transDate': serializer.toJson<DateTime>(transDate),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LedgerTableData copyWith(
          {int? lid,
          String? accountType,
          String? accountName,
          String? accountCode,
          double? openingBalance,
          int? dc,
          Value<String?> other = const Value.absent(),
          Value<String?> description = const Value.absent(),
          double? currentBalance,
          int? dcCurrent,
          DateTime? transDate,
          String? status,
          DateTime? createdAt}) =>
      LedgerTableData(
        lid: lid ?? this.lid,
        accountType: accountType ?? this.accountType,
        accountName: accountName ?? this.accountName,
        accountCode: accountCode ?? this.accountCode,
        openingBalance: openingBalance ?? this.openingBalance,
        dc: dc ?? this.dc,
        other: other.present ? other.value : this.other,
        description: description.present ? description.value : this.description,
        currentBalance: currentBalance ?? this.currentBalance,
        dcCurrent: dcCurrent ?? this.dcCurrent,
        transDate: transDate ?? this.transDate,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  LedgerTableData copyWithCompanion(LedgerTableCompanion data) {
    return LedgerTableData(
      lid: data.lid.present ? data.lid.value : this.lid,
      accountType:
          data.accountType.present ? data.accountType.value : this.accountType,
      accountName:
          data.accountName.present ? data.accountName.value : this.accountName,
      accountCode:
          data.accountCode.present ? data.accountCode.value : this.accountCode,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      dc: data.dc.present ? data.dc.value : this.dc,
      other: data.other.present ? data.other.value : this.other,
      description:
          data.description.present ? data.description.value : this.description,
      currentBalance: data.currentBalance.present
          ? data.currentBalance.value
          : this.currentBalance,
      dcCurrent: data.dcCurrent.present ? data.dcCurrent.value : this.dcCurrent,
      transDate: data.transDate.present ? data.transDate.value : this.transDate,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LedgerTableData(')
          ..write('lid: $lid, ')
          ..write('accountType: $accountType, ')
          ..write('accountName: $accountName, ')
          ..write('accountCode: $accountCode, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('dc: $dc, ')
          ..write('other: $other, ')
          ..write('description: $description, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('dcCurrent: $dcCurrent, ')
          ..write('transDate: $transDate, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      lid,
      accountType,
      accountName,
      accountCode,
      openingBalance,
      dc,
      other,
      description,
      currentBalance,
      dcCurrent,
      transDate,
      status,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LedgerTableData &&
          other.lid == this.lid &&
          other.accountType == this.accountType &&
          other.accountName == this.accountName &&
          other.accountCode == this.accountCode &&
          other.openingBalance == this.openingBalance &&
          other.dc == this.dc &&
          other.other == this.other &&
          other.description == this.description &&
          other.currentBalance == this.currentBalance &&
          other.dcCurrent == this.dcCurrent &&
          other.transDate == this.transDate &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class LedgerTableCompanion extends UpdateCompanion<LedgerTableData> {
  final Value<int> lid;
  final Value<String> accountType;
  final Value<String> accountName;
  final Value<String> accountCode;
  final Value<double> openingBalance;
  final Value<int> dc;
  final Value<String?> other;
  final Value<String?> description;
  final Value<double> currentBalance;
  final Value<int> dcCurrent;
  final Value<DateTime> transDate;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const LedgerTableCompanion({
    this.lid = const Value.absent(),
    this.accountType = const Value.absent(),
    this.accountName = const Value.absent(),
    this.accountCode = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.dc = const Value.absent(),
    this.other = const Value.absent(),
    this.description = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.dcCurrent = const Value.absent(),
    this.transDate = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  LedgerTableCompanion.insert({
    this.lid = const Value.absent(),
    required String accountType,
    required String accountName,
    this.accountCode = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.dc = const Value.absent(),
    this.other = const Value.absent(),
    this.description = const Value.absent(),
    this.currentBalance = const Value.absent(),
    this.dcCurrent = const Value.absent(),
    this.transDate = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : accountType = Value(accountType),
        accountName = Value(accountName);
  static Insertable<LedgerTableData> custom({
    Expression<int>? lid,
    Expression<String>? accountType,
    Expression<String>? accountName,
    Expression<String>? accountCode,
    Expression<double>? openingBalance,
    Expression<int>? dc,
    Expression<String>? other,
    Expression<String>? description,
    Expression<double>? currentBalance,
    Expression<int>? dcCurrent,
    Expression<DateTime>? transDate,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (lid != null) 'lid': lid,
      if (accountType != null) 'account_type': accountType,
      if (accountName != null) 'account_name': accountName,
      if (accountCode != null) 'account_code': accountCode,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (dc != null) 'dc': dc,
      if (other != null) 'other': other,
      if (description != null) 'description': description,
      if (currentBalance != null) 'current_balance': currentBalance,
      if (dcCurrent != null) 'dc_current': dcCurrent,
      if (transDate != null) 'trans_date': transDate,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  LedgerTableCompanion copyWith(
      {Value<int>? lid,
      Value<String>? accountType,
      Value<String>? accountName,
      Value<String>? accountCode,
      Value<double>? openingBalance,
      Value<int>? dc,
      Value<String?>? other,
      Value<String?>? description,
      Value<double>? currentBalance,
      Value<int>? dcCurrent,
      Value<DateTime>? transDate,
      Value<String>? status,
      Value<DateTime>? createdAt}) {
    return LedgerTableCompanion(
      lid: lid ?? this.lid,
      accountType: accountType ?? this.accountType,
      accountName: accountName ?? this.accountName,
      accountCode: accountCode ?? this.accountCode,
      openingBalance: openingBalance ?? this.openingBalance,
      dc: dc ?? this.dc,
      other: other ?? this.other,
      description: description ?? this.description,
      currentBalance: currentBalance ?? this.currentBalance,
      dcCurrent: dcCurrent ?? this.dcCurrent,
      transDate: transDate ?? this.transDate,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lid.present) {
      map['lid'] = Variable<int>(lid.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<String>(accountType.value);
    }
    if (accountName.present) {
      map['account_name'] = Variable<String>(accountName.value);
    }
    if (accountCode.present) {
      map['account_code'] = Variable<String>(accountCode.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<double>(openingBalance.value);
    }
    if (dc.present) {
      map['dc'] = Variable<int>(dc.value);
    }
    if (other.present) {
      map['other'] = Variable<String>(other.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (currentBalance.present) {
      map['current_balance'] = Variable<double>(currentBalance.value);
    }
    if (dcCurrent.present) {
      map['dc_current'] = Variable<int>(dcCurrent.value);
    }
    if (transDate.present) {
      map['trans_date'] = Variable<DateTime>(transDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LedgerTableCompanion(')
          ..write('lid: $lid, ')
          ..write('accountType: $accountType, ')
          ..write('accountName: $accountName, ')
          ..write('accountCode: $accountCode, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('dc: $dc, ')
          ..write('other: $other, ')
          ..write('description: $description, ')
          ..write('currentBalance: $currentBalance, ')
          ..write('dcCurrent: $dcCurrent, ')
          ..write('transDate: $transDate, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $JournalEntriesTableTable extends JournalEntriesTable
    with TableInfo<$JournalEntriesTableTable, JournalEntriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _entryIdMeta =
      const VerificationMeta('entryId');
  @override
  late final GeneratedColumn<int> entryId = GeneratedColumn<int>(
      'entry_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _voucherTypeMeta =
      const VerificationMeta('voucherType');
  @override
  late final GeneratedColumn<String> voucherType = GeneratedColumn<String>(
      'voucher_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _voucherNoMeta =
      const VerificationMeta('voucherNo');
  @override
  late final GeneratedColumn<String> voucherNo = GeneratedColumn<String>(
      'voucher_no', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entryDateMeta =
      const VerificationMeta('entryDate');
  @override
  late final GeneratedColumn<DateTime> entryDate = GeneratedColumn<DateTime>(
      'entry_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _narrationMeta =
      const VerificationMeta('narration');
  @override
  late final GeneratedColumn<String> narration = GeneratedColumn<String>(
      'narration', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        entryId,
        voucherType,
        voucherNo,
        entryDate,
        narration,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entries';
  @override
  VerificationContext validateIntegrity(
      Insertable<JournalEntriesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('entry_id')) {
      context.handle(_entryIdMeta,
          entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta));
    }
    if (data.containsKey('voucher_type')) {
      context.handle(
          _voucherTypeMeta,
          voucherType.isAcceptableOrUnknown(
              data['voucher_type']!, _voucherTypeMeta));
    } else if (isInserting) {
      context.missing(_voucherTypeMeta);
    }
    if (data.containsKey('voucher_no')) {
      context.handle(_voucherNoMeta,
          voucherNo.isAcceptableOrUnknown(data['voucher_no']!, _voucherNoMeta));
    } else if (isInserting) {
      context.missing(_voucherNoMeta);
    }
    if (data.containsKey('entry_date')) {
      context.handle(_entryDateMeta,
          entryDate.isAcceptableOrUnknown(data['entry_date']!, _entryDateMeta));
    } else if (isInserting) {
      context.missing(_entryDateMeta);
    }
    if (data.containsKey('narration')) {
      context.handle(_narrationMeta,
          narration.isAcceptableOrUnknown(data['narration']!, _narrationMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {entryId};
  @override
  JournalEntriesTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalEntriesTableData(
      entryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entry_id'])!,
      voucherType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}voucher_type'])!,
      voucherNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}voucher_no'])!,
      entryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}entry_date'])!,
      narration: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}narration']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $JournalEntriesTableTable createAlias(String alias) {
    return $JournalEntriesTableTable(attachedDatabase, alias);
  }
}

class JournalEntriesTableData extends DataClass
    implements Insertable<JournalEntriesTableData> {
  final int entryId;
  final String voucherType;
  final String voucherNo;
  final DateTime entryDate;
  final String? narration;
  final DateTime createdAt;
  final DateTime updatedAt;
  const JournalEntriesTableData(
      {required this.entryId,
      required this.voucherType,
      required this.voucherNo,
      required this.entryDate,
      this.narration,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['entry_id'] = Variable<int>(entryId);
    map['voucher_type'] = Variable<String>(voucherType);
    map['voucher_no'] = Variable<String>(voucherNo);
    map['entry_date'] = Variable<DateTime>(entryDate);
    if (!nullToAbsent || narration != null) {
      map['narration'] = Variable<String>(narration);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  JournalEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return JournalEntriesTableCompanion(
      entryId: Value(entryId),
      voucherType: Value(voucherType),
      voucherNo: Value(voucherNo),
      entryDate: Value(entryDate),
      narration: narration == null && nullToAbsent
          ? const Value.absent()
          : Value(narration),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory JournalEntriesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntriesTableData(
      entryId: serializer.fromJson<int>(json['entryId']),
      voucherType: serializer.fromJson<String>(json['voucherType']),
      voucherNo: serializer.fromJson<String>(json['voucherNo']),
      entryDate: serializer.fromJson<DateTime>(json['entryDate']),
      narration: serializer.fromJson<String?>(json['narration']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'entryId': serializer.toJson<int>(entryId),
      'voucherType': serializer.toJson<String>(voucherType),
      'voucherNo': serializer.toJson<String>(voucherNo),
      'entryDate': serializer.toJson<DateTime>(entryDate),
      'narration': serializer.toJson<String?>(narration),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  JournalEntriesTableData copyWith(
          {int? entryId,
          String? voucherType,
          String? voucherNo,
          DateTime? entryDate,
          Value<String?> narration = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      JournalEntriesTableData(
        entryId: entryId ?? this.entryId,
        voucherType: voucherType ?? this.voucherType,
        voucherNo: voucherNo ?? this.voucherNo,
        entryDate: entryDate ?? this.entryDate,
        narration: narration.present ? narration.value : this.narration,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  JournalEntriesTableData copyWithCompanion(JournalEntriesTableCompanion data) {
    return JournalEntriesTableData(
      entryId: data.entryId.present ? data.entryId.value : this.entryId,
      voucherType:
          data.voucherType.present ? data.voucherType.value : this.voucherType,
      voucherNo: data.voucherNo.present ? data.voucherNo.value : this.voucherNo,
      entryDate: data.entryDate.present ? data.entryDate.value : this.entryDate,
      narration: data.narration.present ? data.narration.value : this.narration,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesTableData(')
          ..write('entryId: $entryId, ')
          ..write('voucherType: $voucherType, ')
          ..write('voucherNo: $voucherNo, ')
          ..write('entryDate: $entryDate, ')
          ..write('narration: $narration, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(entryId, voucherType, voucherNo, entryDate,
      narration, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntriesTableData &&
          other.entryId == this.entryId &&
          other.voucherType == this.voucherType &&
          other.voucherNo == this.voucherNo &&
          other.entryDate == this.entryDate &&
          other.narration == this.narration &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class JournalEntriesTableCompanion
    extends UpdateCompanion<JournalEntriesTableData> {
  final Value<int> entryId;
  final Value<String> voucherType;
  final Value<String> voucherNo;
  final Value<DateTime> entryDate;
  final Value<String?> narration;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const JournalEntriesTableCompanion({
    this.entryId = const Value.absent(),
    this.voucherType = const Value.absent(),
    this.voucherNo = const Value.absent(),
    this.entryDate = const Value.absent(),
    this.narration = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  JournalEntriesTableCompanion.insert({
    this.entryId = const Value.absent(),
    required String voucherType,
    required String voucherNo,
    required DateTime entryDate,
    this.narration = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : voucherType = Value(voucherType),
        voucherNo = Value(voucherNo),
        entryDate = Value(entryDate);
  static Insertable<JournalEntriesTableData> custom({
    Expression<int>? entryId,
    Expression<String>? voucherType,
    Expression<String>? voucherNo,
    Expression<DateTime>? entryDate,
    Expression<String>? narration,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (entryId != null) 'entry_id': entryId,
      if (voucherType != null) 'voucher_type': voucherType,
      if (voucherNo != null) 'voucher_no': voucherNo,
      if (entryDate != null) 'entry_date': entryDate,
      if (narration != null) 'narration': narration,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  JournalEntriesTableCompanion copyWith(
      {Value<int>? entryId,
      Value<String>? voucherType,
      Value<String>? voucherNo,
      Value<DateTime>? entryDate,
      Value<String?>? narration,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return JournalEntriesTableCompanion(
      entryId: entryId ?? this.entryId,
      voucherType: voucherType ?? this.voucherType,
      voucherNo: voucherNo ?? this.voucherNo,
      entryDate: entryDate ?? this.entryDate,
      narration: narration ?? this.narration,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (voucherType.present) {
      map['voucher_type'] = Variable<String>(voucherType.value);
    }
    if (voucherNo.present) {
      map['voucher_no'] = Variable<String>(voucherNo.value);
    }
    if (entryDate.present) {
      map['entry_date'] = Variable<DateTime>(entryDate.value);
    }
    if (narration.present) {
      map['narration'] = Variable<String>(narration.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntriesTableCompanion(')
          ..write('entryId: $entryId, ')
          ..write('voucherType: $voucherType, ')
          ..write('voucherNo: $voucherNo, ')
          ..write('entryDate: $entryDate, ')
          ..write('narration: $narration, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $JournalEntryDetailsTableTable extends JournalEntryDetailsTable
    with
        TableInfo<$JournalEntryDetailsTableTable,
            JournalEntryDetailsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JournalEntryDetailsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _detailIdMeta =
      const VerificationMeta('detailId');
  @override
  late final GeneratedColumn<int> detailId = GeneratedColumn<int>(
      'detail_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entryIdMeta =
      const VerificationMeta('entryId');
  @override
  late final GeneratedColumn<int> entryId = GeneratedColumn<int>(
      'entry_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES journal_entries (entry_id)'));
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES ledger (lid)'));
  static const VerificationMeta _debitMeta = const VerificationMeta('debit');
  @override
  late final GeneratedColumn<double> debit = GeneratedColumn<double>(
      'debit', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _creditMeta = const VerificationMeta('credit');
  @override
  late final GeneratedColumn<double> credit = GeneratedColumn<double>(
      'credit', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [detailId, entryId, accountId, debit, credit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'journal_entry_details';
  @override
  VerificationContext validateIntegrity(
      Insertable<JournalEntryDetailsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('detail_id')) {
      context.handle(_detailIdMeta,
          detailId.isAcceptableOrUnknown(data['detail_id']!, _detailIdMeta));
    }
    if (data.containsKey('entry_id')) {
      context.handle(_entryIdMeta,
          entryId.isAcceptableOrUnknown(data['entry_id']!, _entryIdMeta));
    } else if (isInserting) {
      context.missing(_entryIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('debit')) {
      context.handle(
          _debitMeta, debit.isAcceptableOrUnknown(data['debit']!, _debitMeta));
    }
    if (data.containsKey('credit')) {
      context.handle(_creditMeta,
          credit.isAcceptableOrUnknown(data['credit']!, _creditMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {detailId};
  @override
  JournalEntryDetailsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JournalEntryDetailsTableData(
      detailId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}detail_id'])!,
      entryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entry_id'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id'])!,
      debit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}debit'])!,
      credit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}credit'])!,
    );
  }

  @override
  $JournalEntryDetailsTableTable createAlias(String alias) {
    return $JournalEntryDetailsTableTable(attachedDatabase, alias);
  }
}

class JournalEntryDetailsTableData extends DataClass
    implements Insertable<JournalEntryDetailsTableData> {
  final int detailId;
  final int entryId;
  final int accountId;
  final double debit;
  final double credit;
  const JournalEntryDetailsTableData(
      {required this.detailId,
      required this.entryId,
      required this.accountId,
      required this.debit,
      required this.credit});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['detail_id'] = Variable<int>(detailId);
    map['entry_id'] = Variable<int>(entryId);
    map['account_id'] = Variable<int>(accountId);
    map['debit'] = Variable<double>(debit);
    map['credit'] = Variable<double>(credit);
    return map;
  }

  JournalEntryDetailsTableCompanion toCompanion(bool nullToAbsent) {
    return JournalEntryDetailsTableCompanion(
      detailId: Value(detailId),
      entryId: Value(entryId),
      accountId: Value(accountId),
      debit: Value(debit),
      credit: Value(credit),
    );
  }

  factory JournalEntryDetailsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JournalEntryDetailsTableData(
      detailId: serializer.fromJson<int>(json['detailId']),
      entryId: serializer.fromJson<int>(json['entryId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      debit: serializer.fromJson<double>(json['debit']),
      credit: serializer.fromJson<double>(json['credit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'detailId': serializer.toJson<int>(detailId),
      'entryId': serializer.toJson<int>(entryId),
      'accountId': serializer.toJson<int>(accountId),
      'debit': serializer.toJson<double>(debit),
      'credit': serializer.toJson<double>(credit),
    };
  }

  JournalEntryDetailsTableData copyWith(
          {int? detailId,
          int? entryId,
          int? accountId,
          double? debit,
          double? credit}) =>
      JournalEntryDetailsTableData(
        detailId: detailId ?? this.detailId,
        entryId: entryId ?? this.entryId,
        accountId: accountId ?? this.accountId,
        debit: debit ?? this.debit,
        credit: credit ?? this.credit,
      );
  JournalEntryDetailsTableData copyWithCompanion(
      JournalEntryDetailsTableCompanion data) {
    return JournalEntryDetailsTableData(
      detailId: data.detailId.present ? data.detailId.value : this.detailId,
      entryId: data.entryId.present ? data.entryId.value : this.entryId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      debit: data.debit.present ? data.debit.value : this.debit,
      credit: data.credit.present ? data.credit.value : this.credit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntryDetailsTableData(')
          ..write('detailId: $detailId, ')
          ..write('entryId: $entryId, ')
          ..write('accountId: $accountId, ')
          ..write('debit: $debit, ')
          ..write('credit: $credit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(detailId, entryId, accountId, debit, credit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JournalEntryDetailsTableData &&
          other.detailId == this.detailId &&
          other.entryId == this.entryId &&
          other.accountId == this.accountId &&
          other.debit == this.debit &&
          other.credit == this.credit);
}

class JournalEntryDetailsTableCompanion
    extends UpdateCompanion<JournalEntryDetailsTableData> {
  final Value<int> detailId;
  final Value<int> entryId;
  final Value<int> accountId;
  final Value<double> debit;
  final Value<double> credit;
  const JournalEntryDetailsTableCompanion({
    this.detailId = const Value.absent(),
    this.entryId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.debit = const Value.absent(),
    this.credit = const Value.absent(),
  });
  JournalEntryDetailsTableCompanion.insert({
    this.detailId = const Value.absent(),
    required int entryId,
    required int accountId,
    this.debit = const Value.absent(),
    this.credit = const Value.absent(),
  })  : entryId = Value(entryId),
        accountId = Value(accountId);
  static Insertable<JournalEntryDetailsTableData> custom({
    Expression<int>? detailId,
    Expression<int>? entryId,
    Expression<int>? accountId,
    Expression<double>? debit,
    Expression<double>? credit,
  }) {
    return RawValuesInsertable({
      if (detailId != null) 'detail_id': detailId,
      if (entryId != null) 'entry_id': entryId,
      if (accountId != null) 'account_id': accountId,
      if (debit != null) 'debit': debit,
      if (credit != null) 'credit': credit,
    });
  }

  JournalEntryDetailsTableCompanion copyWith(
      {Value<int>? detailId,
      Value<int>? entryId,
      Value<int>? accountId,
      Value<double>? debit,
      Value<double>? credit}) {
    return JournalEntryDetailsTableCompanion(
      detailId: detailId ?? this.detailId,
      entryId: entryId ?? this.entryId,
      accountId: accountId ?? this.accountId,
      debit: debit ?? this.debit,
      credit: credit ?? this.credit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (detailId.present) {
      map['detail_id'] = Variable<int>(detailId.value);
    }
    if (entryId.present) {
      map['entry_id'] = Variable<int>(entryId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (debit.present) {
      map['debit'] = Variable<double>(debit.value);
    }
    if (credit.present) {
      map['credit'] = Variable<double>(credit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JournalEntryDetailsTableCompanion(')
          ..write('detailId: $detailId, ')
          ..write('entryId: $entryId, ')
          ..write('accountId: $accountId, ')
          ..write('debit: $debit, ')
          ..write('credit: $credit')
          ..write(')'))
        .toString();
  }
}

class $DailyCashBalanceTableTable extends DailyCashBalanceTable
    with TableInfo<$DailyCashBalanceTableTable, DailyCashBalanceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyCashBalanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _balanceDateMeta =
      const VerificationMeta('balanceDate');
  @override
  late final GeneratedColumn<DateTime> balanceDate = GeneratedColumn<DateTime>(
      'balance_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<double> openingBalance = GeneratedColumn<double>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _closingBalanceMeta =
      const VerificationMeta('closingBalance');
  @override
  late final GeneratedColumn<double> closingBalance = GeneratedColumn<double>(
      'closing_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, balanceDate, openingBalance, closingBalance, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_cash_balance';
  @override
  VerificationContext validateIntegrity(
      Insertable<DailyCashBalanceTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('balance_date')) {
      context.handle(
          _balanceDateMeta,
          balanceDate.isAcceptableOrUnknown(
              data['balance_date']!, _balanceDateMeta));
    } else if (isInserting) {
      context.missing(_balanceDateMeta);
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
          _openingBalanceMeta,
          openingBalance.isAcceptableOrUnknown(
              data['opening_balance']!, _openingBalanceMeta));
    }
    if (data.containsKey('closing_balance')) {
      context.handle(
          _closingBalanceMeta,
          closingBalance.isAcceptableOrUnknown(
              data['closing_balance']!, _closingBalanceMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {balanceDate},
      ];
  @override
  DailyCashBalanceTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyCashBalanceTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      balanceDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}balance_date'])!,
      openingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}opening_balance'])!,
      closingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}closing_balance'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $DailyCashBalanceTableTable createAlias(String alias) {
    return $DailyCashBalanceTableTable(attachedDatabase, alias);
  }
}

class DailyCashBalanceTableData extends DataClass
    implements Insertable<DailyCashBalanceTableData> {
  final int id;
  final DateTime balanceDate;
  final double openingBalance;
  final double closingBalance;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DailyCashBalanceTableData(
      {required this.id,
      required this.balanceDate,
      required this.openingBalance,
      required this.closingBalance,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['balance_date'] = Variable<DateTime>(balanceDate);
    map['opening_balance'] = Variable<double>(openingBalance);
    map['closing_balance'] = Variable<double>(closingBalance);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DailyCashBalanceTableCompanion toCompanion(bool nullToAbsent) {
    return DailyCashBalanceTableCompanion(
      id: Value(id),
      balanceDate: Value(balanceDate),
      openingBalance: Value(openingBalance),
      closingBalance: Value(closingBalance),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DailyCashBalanceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyCashBalanceTableData(
      id: serializer.fromJson<int>(json['id']),
      balanceDate: serializer.fromJson<DateTime>(json['balanceDate']),
      openingBalance: serializer.fromJson<double>(json['openingBalance']),
      closingBalance: serializer.fromJson<double>(json['closingBalance']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'balanceDate': serializer.toJson<DateTime>(balanceDate),
      'openingBalance': serializer.toJson<double>(openingBalance),
      'closingBalance': serializer.toJson<double>(closingBalance),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DailyCashBalanceTableData copyWith(
          {int? id,
          DateTime? balanceDate,
          double? openingBalance,
          double? closingBalance,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      DailyCashBalanceTableData(
        id: id ?? this.id,
        balanceDate: balanceDate ?? this.balanceDate,
        openingBalance: openingBalance ?? this.openingBalance,
        closingBalance: closingBalance ?? this.closingBalance,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  DailyCashBalanceTableData copyWithCompanion(
      DailyCashBalanceTableCompanion data) {
    return DailyCashBalanceTableData(
      id: data.id.present ? data.id.value : this.id,
      balanceDate:
          data.balanceDate.present ? data.balanceDate.value : this.balanceDate,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      closingBalance: data.closingBalance.present
          ? data.closingBalance.value
          : this.closingBalance,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyCashBalanceTableData(')
          ..write('id: $id, ')
          ..write('balanceDate: $balanceDate, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('closingBalance: $closingBalance, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, balanceDate, openingBalance, closingBalance, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyCashBalanceTableData &&
          other.id == this.id &&
          other.balanceDate == this.balanceDate &&
          other.openingBalance == this.openingBalance &&
          other.closingBalance == this.closingBalance &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DailyCashBalanceTableCompanion
    extends UpdateCompanion<DailyCashBalanceTableData> {
  final Value<int> id;
  final Value<DateTime> balanceDate;
  final Value<double> openingBalance;
  final Value<double> closingBalance;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const DailyCashBalanceTableCompanion({
    this.id = const Value.absent(),
    this.balanceDate = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.closingBalance = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DailyCashBalanceTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime balanceDate,
    this.openingBalance = const Value.absent(),
    this.closingBalance = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : balanceDate = Value(balanceDate);
  static Insertable<DailyCashBalanceTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? balanceDate,
    Expression<double>? openingBalance,
    Expression<double>? closingBalance,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (balanceDate != null) 'balance_date': balanceDate,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (closingBalance != null) 'closing_balance': closingBalance,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DailyCashBalanceTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? balanceDate,
      Value<double>? openingBalance,
      Value<double>? closingBalance,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return DailyCashBalanceTableCompanion(
      id: id ?? this.id,
      balanceDate: balanceDate ?? this.balanceDate,
      openingBalance: openingBalance ?? this.openingBalance,
      closingBalance: closingBalance ?? this.closingBalance,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (balanceDate.present) {
      map['balance_date'] = Variable<DateTime>(balanceDate.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<double>(openingBalance.value);
    }
    if (closingBalance.present) {
      map['closing_balance'] = Variable<double>(closingBalance.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyCashBalanceTableCompanion(')
          ..write('id: $id, ')
          ..write('balanceDate: $balanceDate, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('closingBalance: $closingBalance, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TradersTableTable extends TradersTable
    with TableInfo<$TradersTableTable, TradersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TradersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _traderCodeMeta =
      const VerificationMeta('traderCode');
  @override
  late final GeneratedColumn<String> traderCode = GeneratedColumn<String>(
      'trader_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ledgerIdMeta =
      const VerificationMeta('ledgerId');
  @override
  late final GeneratedColumn<int> ledgerId = GeneratedColumn<int>(
      'ledger_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES ledger (lid)'));
  static const VerificationMeta _traderNameMeta =
      const VerificationMeta('traderName');
  @override
  late final GeneratedColumn<String> traderName = GeneratedColumn<String>(
      'trader_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _traderTypeMeta =
      const VerificationMeta('traderType');
  @override
  late final GeneratedColumn<String> traderType = GeneratedColumn<String>(
      'trader_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _gstinMeta = const VerificationMeta('gstin');
  @override
  late final GeneratedColumn<String> gstin = GeneratedColumn<String>(
      'gstin', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _panCardMeta =
      const VerificationMeta('panCard');
  @override
  late final GeneratedColumn<String> panCard = GeneratedColumn<String>(
      'pan_card', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _telephoneMeta =
      const VerificationMeta('telephone');
  @override
  late final GeneratedColumn<String> telephone = GeneratedColumn<String>(
      'telephone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pincodeMeta =
      const VerificationMeta('pincode');
  @override
  late final GeneratedColumn<String> pincode = GeneratedColumn<String>(
      'pincode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Active'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        traderCode,
        ledgerId,
        traderName,
        traderType,
        gstin,
        panCard,
        phone,
        telephone,
        email,
        address,
        city,
        state,
        pincode,
        status,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'traders';
  @override
  VerificationContext validateIntegrity(Insertable<TradersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('trader_code')) {
      context.handle(
          _traderCodeMeta,
          traderCode.isAcceptableOrUnknown(
              data['trader_code']!, _traderCodeMeta));
    } else if (isInserting) {
      context.missing(_traderCodeMeta);
    }
    if (data.containsKey('ledger_id')) {
      context.handle(_ledgerIdMeta,
          ledgerId.isAcceptableOrUnknown(data['ledger_id']!, _ledgerIdMeta));
    } else if (isInserting) {
      context.missing(_ledgerIdMeta);
    }
    if (data.containsKey('trader_name')) {
      context.handle(
          _traderNameMeta,
          traderName.isAcceptableOrUnknown(
              data['trader_name']!, _traderNameMeta));
    } else if (isInserting) {
      context.missing(_traderNameMeta);
    }
    if (data.containsKey('trader_type')) {
      context.handle(
          _traderTypeMeta,
          traderType.isAcceptableOrUnknown(
              data['trader_type']!, _traderTypeMeta));
    } else if (isInserting) {
      context.missing(_traderTypeMeta);
    }
    if (data.containsKey('gstin')) {
      context.handle(
          _gstinMeta, gstin.isAcceptableOrUnknown(data['gstin']!, _gstinMeta));
    }
    if (data.containsKey('pan_card')) {
      context.handle(_panCardMeta,
          panCard.isAcceptableOrUnknown(data['pan_card']!, _panCardMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('telephone')) {
      context.handle(_telephoneMeta,
          telephone.isAcceptableOrUnknown(data['telephone']!, _telephoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('pincode')) {
      context.handle(_pincodeMeta,
          pincode.isAcceptableOrUnknown(data['pincode']!, _pincodeMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TradersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TradersTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      traderCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trader_code'])!,
      ledgerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ledger_id'])!,
      traderName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trader_name'])!,
      traderType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trader_type'])!,
      gstin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gstin']),
      panCard: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pan_card']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      telephone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telephone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      pincode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pincode']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $TradersTableTable createAlias(String alias) {
    return $TradersTableTable(attachedDatabase, alias);
  }
}

class TradersTableData extends DataClass
    implements Insertable<TradersTableData> {
  final int id;
  final String traderCode;
  final int ledgerId;
  final String traderName;
  final String traderType;
  final String? gstin;
  final String? panCard;
  final String? phone;
  final String? telephone;
  final String? email;
  final String? address;
  final String? city;
  final String? state;
  final String? pincode;
  final String status;
  final DateTime createdAt;
  const TradersTableData(
      {required this.id,
      required this.traderCode,
      required this.ledgerId,
      required this.traderName,
      required this.traderType,
      this.gstin,
      this.panCard,
      this.phone,
      this.telephone,
      this.email,
      this.address,
      this.city,
      this.state,
      this.pincode,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['trader_code'] = Variable<String>(traderCode);
    map['ledger_id'] = Variable<int>(ledgerId);
    map['trader_name'] = Variable<String>(traderName);
    map['trader_type'] = Variable<String>(traderType);
    if (!nullToAbsent || gstin != null) {
      map['gstin'] = Variable<String>(gstin);
    }
    if (!nullToAbsent || panCard != null) {
      map['pan_card'] = Variable<String>(panCard);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || telephone != null) {
      map['telephone'] = Variable<String>(telephone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || pincode != null) {
      map['pincode'] = Variable<String>(pincode);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TradersTableCompanion toCompanion(bool nullToAbsent) {
    return TradersTableCompanion(
      id: Value(id),
      traderCode: Value(traderCode),
      ledgerId: Value(ledgerId),
      traderName: Value(traderName),
      traderType: Value(traderType),
      gstin:
          gstin == null && nullToAbsent ? const Value.absent() : Value(gstin),
      panCard: panCard == null && nullToAbsent
          ? const Value.absent()
          : Value(panCard),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      telephone: telephone == null && nullToAbsent
          ? const Value.absent()
          : Value(telephone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      pincode: pincode == null && nullToAbsent
          ? const Value.absent()
          : Value(pincode),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory TradersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TradersTableData(
      id: serializer.fromJson<int>(json['id']),
      traderCode: serializer.fromJson<String>(json['traderCode']),
      ledgerId: serializer.fromJson<int>(json['ledgerId']),
      traderName: serializer.fromJson<String>(json['traderName']),
      traderType: serializer.fromJson<String>(json['traderType']),
      gstin: serializer.fromJson<String?>(json['gstin']),
      panCard: serializer.fromJson<String?>(json['panCard']),
      phone: serializer.fromJson<String?>(json['phone']),
      telephone: serializer.fromJson<String?>(json['telephone']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
      city: serializer.fromJson<String?>(json['city']),
      state: serializer.fromJson<String?>(json['state']),
      pincode: serializer.fromJson<String?>(json['pincode']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'traderCode': serializer.toJson<String>(traderCode),
      'ledgerId': serializer.toJson<int>(ledgerId),
      'traderName': serializer.toJson<String>(traderName),
      'traderType': serializer.toJson<String>(traderType),
      'gstin': serializer.toJson<String?>(gstin),
      'panCard': serializer.toJson<String?>(panCard),
      'phone': serializer.toJson<String?>(phone),
      'telephone': serializer.toJson<String?>(telephone),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
      'city': serializer.toJson<String?>(city),
      'state': serializer.toJson<String?>(state),
      'pincode': serializer.toJson<String?>(pincode),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TradersTableData copyWith(
          {int? id,
          String? traderCode,
          int? ledgerId,
          String? traderName,
          String? traderType,
          Value<String?> gstin = const Value.absent(),
          Value<String?> panCard = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> telephone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> city = const Value.absent(),
          Value<String?> state = const Value.absent(),
          Value<String?> pincode = const Value.absent(),
          String? status,
          DateTime? createdAt}) =>
      TradersTableData(
        id: id ?? this.id,
        traderCode: traderCode ?? this.traderCode,
        ledgerId: ledgerId ?? this.ledgerId,
        traderName: traderName ?? this.traderName,
        traderType: traderType ?? this.traderType,
        gstin: gstin.present ? gstin.value : this.gstin,
        panCard: panCard.present ? panCard.value : this.panCard,
        phone: phone.present ? phone.value : this.phone,
        telephone: telephone.present ? telephone.value : this.telephone,
        email: email.present ? email.value : this.email,
        address: address.present ? address.value : this.address,
        city: city.present ? city.value : this.city,
        state: state.present ? state.value : this.state,
        pincode: pincode.present ? pincode.value : this.pincode,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  TradersTableData copyWithCompanion(TradersTableCompanion data) {
    return TradersTableData(
      id: data.id.present ? data.id.value : this.id,
      traderCode:
          data.traderCode.present ? data.traderCode.value : this.traderCode,
      ledgerId: data.ledgerId.present ? data.ledgerId.value : this.ledgerId,
      traderName:
          data.traderName.present ? data.traderName.value : this.traderName,
      traderType:
          data.traderType.present ? data.traderType.value : this.traderType,
      gstin: data.gstin.present ? data.gstin.value : this.gstin,
      panCard: data.panCard.present ? data.panCard.value : this.panCard,
      phone: data.phone.present ? data.phone.value : this.phone,
      telephone: data.telephone.present ? data.telephone.value : this.telephone,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
      city: data.city.present ? data.city.value : this.city,
      state: data.state.present ? data.state.value : this.state,
      pincode: data.pincode.present ? data.pincode.value : this.pincode,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TradersTableData(')
          ..write('id: $id, ')
          ..write('traderCode: $traderCode, ')
          ..write('ledgerId: $ledgerId, ')
          ..write('traderName: $traderName, ')
          ..write('traderType: $traderType, ')
          ..write('gstin: $gstin, ')
          ..write('panCard: $panCard, ')
          ..write('phone: $phone, ')
          ..write('telephone: $telephone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('pincode: $pincode, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      traderCode,
      ledgerId,
      traderName,
      traderType,
      gstin,
      panCard,
      phone,
      telephone,
      email,
      address,
      city,
      state,
      pincode,
      status,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TradersTableData &&
          other.id == this.id &&
          other.traderCode == this.traderCode &&
          other.ledgerId == this.ledgerId &&
          other.traderName == this.traderName &&
          other.traderType == this.traderType &&
          other.gstin == this.gstin &&
          other.panCard == this.panCard &&
          other.phone == this.phone &&
          other.telephone == this.telephone &&
          other.email == this.email &&
          other.address == this.address &&
          other.city == this.city &&
          other.state == this.state &&
          other.pincode == this.pincode &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class TradersTableCompanion extends UpdateCompanion<TradersTableData> {
  final Value<int> id;
  final Value<String> traderCode;
  final Value<int> ledgerId;
  final Value<String> traderName;
  final Value<String> traderType;
  final Value<String?> gstin;
  final Value<String?> panCard;
  final Value<String?> phone;
  final Value<String?> telephone;
  final Value<String?> email;
  final Value<String?> address;
  final Value<String?> city;
  final Value<String?> state;
  final Value<String?> pincode;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const TradersTableCompanion({
    this.id = const Value.absent(),
    this.traderCode = const Value.absent(),
    this.ledgerId = const Value.absent(),
    this.traderName = const Value.absent(),
    this.traderType = const Value.absent(),
    this.gstin = const Value.absent(),
    this.panCard = const Value.absent(),
    this.phone = const Value.absent(),
    this.telephone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.pincode = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TradersTableCompanion.insert({
    this.id = const Value.absent(),
    required String traderCode,
    required int ledgerId,
    required String traderName,
    required String traderType,
    this.gstin = const Value.absent(),
    this.panCard = const Value.absent(),
    this.phone = const Value.absent(),
    this.telephone = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.pincode = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : traderCode = Value(traderCode),
        ledgerId = Value(ledgerId),
        traderName = Value(traderName),
        traderType = Value(traderType);
  static Insertable<TradersTableData> custom({
    Expression<int>? id,
    Expression<String>? traderCode,
    Expression<int>? ledgerId,
    Expression<String>? traderName,
    Expression<String>? traderType,
    Expression<String>? gstin,
    Expression<String>? panCard,
    Expression<String>? phone,
    Expression<String>? telephone,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? city,
    Expression<String>? state,
    Expression<String>? pincode,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (traderCode != null) 'trader_code': traderCode,
      if (ledgerId != null) 'ledger_id': ledgerId,
      if (traderName != null) 'trader_name': traderName,
      if (traderType != null) 'trader_type': traderType,
      if (gstin != null) 'gstin': gstin,
      if (panCard != null) 'pan_card': panCard,
      if (phone != null) 'phone': phone,
      if (telephone != null) 'telephone': telephone,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (pincode != null) 'pincode': pincode,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TradersTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? traderCode,
      Value<int>? ledgerId,
      Value<String>? traderName,
      Value<String>? traderType,
      Value<String?>? gstin,
      Value<String?>? panCard,
      Value<String?>? phone,
      Value<String?>? telephone,
      Value<String?>? email,
      Value<String?>? address,
      Value<String?>? city,
      Value<String?>? state,
      Value<String?>? pincode,
      Value<String>? status,
      Value<DateTime>? createdAt}) {
    return TradersTableCompanion(
      id: id ?? this.id,
      traderCode: traderCode ?? this.traderCode,
      ledgerId: ledgerId ?? this.ledgerId,
      traderName: traderName ?? this.traderName,
      traderType: traderType ?? this.traderType,
      gstin: gstin ?? this.gstin,
      panCard: panCard ?? this.panCard,
      phone: phone ?? this.phone,
      telephone: telephone ?? this.telephone,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (traderCode.present) {
      map['trader_code'] = Variable<String>(traderCode.value);
    }
    if (ledgerId.present) {
      map['ledger_id'] = Variable<int>(ledgerId.value);
    }
    if (traderName.present) {
      map['trader_name'] = Variable<String>(traderName.value);
    }
    if (traderType.present) {
      map['trader_type'] = Variable<String>(traderType.value);
    }
    if (gstin.present) {
      map['gstin'] = Variable<String>(gstin.value);
    }
    if (panCard.present) {
      map['pan_card'] = Variable<String>(panCard.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (telephone.present) {
      map['telephone'] = Variable<String>(telephone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (pincode.present) {
      map['pincode'] = Variable<String>(pincode.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TradersTableCompanion(')
          ..write('id: $id, ')
          ..write('traderCode: $traderCode, ')
          ..write('ledgerId: $ledgerId, ')
          ..write('traderName: $traderName, ')
          ..write('traderType: $traderType, ')
          ..write('gstin: $gstin, ')
          ..write('panCard: $panCard, ')
          ..write('phone: $phone, ')
          ..write('telephone: $telephone, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('pincode: $pincode, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ProductsTableTable extends ProductsTable
    with TableInfo<$ProductsTableTable, ProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pidMeta = const VerificationMeta('pid');
  @override
  late final GeneratedColumn<int> pid = GeneratedColumn<int>(
      'pid', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productCodeMeta =
      const VerificationMeta('productCode');
  @override
  late final GeneratedColumn<String> productCode = GeneratedColumn<String>(
      'product_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _basePriceMeta =
      const VerificationMeta('basePrice');
  @override
  late final GeneratedColumn<double> basePrice = GeneratedColumn<double>(
      'base_price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<String> units = GeneratedColumn<String>(
      'units', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _transactionTypeMeta =
      const VerificationMeta('transactionType');
  @override
  late final GeneratedColumn<String> transactionType = GeneratedColumn<String>(
      'transaction_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Active'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        pid,
        productCode,
        productName,
        basePrice,
        units,
        transactionType,
        status,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<ProductsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid']!, _pidMeta));
    }
    if (data.containsKey('product_code')) {
      context.handle(
          _productCodeMeta,
          productCode.isAcceptableOrUnknown(
              data['product_code']!, _productCodeMeta));
    } else if (isInserting) {
      context.missing(_productCodeMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('base_price')) {
      context.handle(_basePriceMeta,
          basePrice.isAcceptableOrUnknown(data['base_price']!, _basePriceMeta));
    }
    if (data.containsKey('units')) {
      context.handle(
          _unitsMeta, units.isAcceptableOrUnknown(data['units']!, _unitsMeta));
    } else if (isInserting) {
      context.missing(_unitsMeta);
    }
    if (data.containsKey('transaction_type')) {
      context.handle(
          _transactionTypeMeta,
          transactionType.isAcceptableOrUnknown(
              data['transaction_type']!, _transactionTypeMeta));
    } else if (isInserting) {
      context.missing(_transactionTypeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
  @override
  ProductsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductsTableData(
      pid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pid'])!,
      productCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_code'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      basePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}base_price'])!,
      units: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}units'])!,
      transactionType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transaction_type'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ProductsTableTable createAlias(String alias) {
    return $ProductsTableTable(attachedDatabase, alias);
  }
}

class ProductsTableData extends DataClass
    implements Insertable<ProductsTableData> {
  final int pid;
  final String productCode;
  final String productName;
  final double basePrice;
  final String units;
  final String transactionType;
  final String status;
  final DateTime createdAt;
  const ProductsTableData(
      {required this.pid,
      required this.productCode,
      required this.productName,
      required this.basePrice,
      required this.units,
      required this.transactionType,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pid'] = Variable<int>(pid);
    map['product_code'] = Variable<String>(productCode);
    map['product_name'] = Variable<String>(productName);
    map['base_price'] = Variable<double>(basePrice);
    map['units'] = Variable<String>(units);
    map['transaction_type'] = Variable<String>(transactionType);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProductsTableCompanion toCompanion(bool nullToAbsent) {
    return ProductsTableCompanion(
      pid: Value(pid),
      productCode: Value(productCode),
      productName: Value(productName),
      basePrice: Value(basePrice),
      units: Value(units),
      transactionType: Value(transactionType),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory ProductsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductsTableData(
      pid: serializer.fromJson<int>(json['pid']),
      productCode: serializer.fromJson<String>(json['productCode']),
      productName: serializer.fromJson<String>(json['productName']),
      basePrice: serializer.fromJson<double>(json['basePrice']),
      units: serializer.fromJson<String>(json['units']),
      transactionType: serializer.fromJson<String>(json['transactionType']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      'productCode': serializer.toJson<String>(productCode),
      'productName': serializer.toJson<String>(productName),
      'basePrice': serializer.toJson<double>(basePrice),
      'units': serializer.toJson<String>(units),
      'transactionType': serializer.toJson<String>(transactionType),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProductsTableData copyWith(
          {int? pid,
          String? productCode,
          String? productName,
          double? basePrice,
          String? units,
          String? transactionType,
          String? status,
          DateTime? createdAt}) =>
      ProductsTableData(
        pid: pid ?? this.pid,
        productCode: productCode ?? this.productCode,
        productName: productName ?? this.productName,
        basePrice: basePrice ?? this.basePrice,
        units: units ?? this.units,
        transactionType: transactionType ?? this.transactionType,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  ProductsTableData copyWithCompanion(ProductsTableCompanion data) {
    return ProductsTableData(
      pid: data.pid.present ? data.pid.value : this.pid,
      productCode:
          data.productCode.present ? data.productCode.value : this.productCode,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      basePrice: data.basePrice.present ? data.basePrice.value : this.basePrice,
      units: data.units.present ? data.units.value : this.units,
      transactionType: data.transactionType.present
          ? data.transactionType.value
          : this.transactionType,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableData(')
          ..write('pid: $pid, ')
          ..write('productCode: $productCode, ')
          ..write('productName: $productName, ')
          ..write('basePrice: $basePrice, ')
          ..write('units: $units, ')
          ..write('transactionType: $transactionType, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pid, productCode, productName, basePrice,
      units, transactionType, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsTableData &&
          other.pid == this.pid &&
          other.productCode == this.productCode &&
          other.productName == this.productName &&
          other.basePrice == this.basePrice &&
          other.units == this.units &&
          other.transactionType == this.transactionType &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class ProductsTableCompanion extends UpdateCompanion<ProductsTableData> {
  final Value<int> pid;
  final Value<String> productCode;
  final Value<String> productName;
  final Value<double> basePrice;
  final Value<String> units;
  final Value<String> transactionType;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const ProductsTableCompanion({
    this.pid = const Value.absent(),
    this.productCode = const Value.absent(),
    this.productName = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.units = const Value.absent(),
    this.transactionType = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProductsTableCompanion.insert({
    this.pid = const Value.absent(),
    required String productCode,
    required String productName,
    this.basePrice = const Value.absent(),
    required String units,
    required String transactionType,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : productCode = Value(productCode),
        productName = Value(productName),
        units = Value(units),
        transactionType = Value(transactionType);
  static Insertable<ProductsTableData> custom({
    Expression<int>? pid,
    Expression<String>? productCode,
    Expression<String>? productName,
    Expression<double>? basePrice,
    Expression<String>? units,
    Expression<String>? transactionType,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (productCode != null) 'product_code': productCode,
      if (productName != null) 'product_name': productName,
      if (basePrice != null) 'base_price': basePrice,
      if (units != null) 'units': units,
      if (transactionType != null) 'transaction_type': transactionType,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProductsTableCompanion copyWith(
      {Value<int>? pid,
      Value<String>? productCode,
      Value<String>? productName,
      Value<double>? basePrice,
      Value<String>? units,
      Value<String>? transactionType,
      Value<String>? status,
      Value<DateTime>? createdAt}) {
    return ProductsTableCompanion(
      pid: pid ?? this.pid,
      productCode: productCode ?? this.productCode,
      productName: productName ?? this.productName,
      basePrice: basePrice ?? this.basePrice,
      units: units ?? this.units,
      transactionType: transactionType ?? this.transactionType,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
    if (productCode.present) {
      map['product_code'] = Variable<String>(productCode.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (basePrice.present) {
      map['base_price'] = Variable<double>(basePrice.value);
    }
    if (units.present) {
      map['units'] = Variable<String>(units.value);
    }
    if (transactionType.present) {
      map['transaction_type'] = Variable<String>(transactionType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsTableCompanion(')
          ..write('pid: $pid, ')
          ..write('productCode: $productCode, ')
          ..write('productName: $productName, ')
          ..write('basePrice: $basePrice, ')
          ..write('units: $units, ')
          ..write('transactionType: $transactionType, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PartyRatesTableTable extends PartyRatesTable
    with TableInfo<$PartyRatesTableTable, PartyRatesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartyRatesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _partyIdMeta =
      const VerificationMeta('partyId');
  @override
  late final GeneratedColumn<int> partyId = GeneratedColumn<int>(
      'party_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES traders (id)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (pid)'));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
      'rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, partyId, productId, unit, rate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'party_rates';
  @override
  VerificationContext validateIntegrity(
      Insertable<PartyRatesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('party_id')) {
      context.handle(_partyIdMeta,
          partyId.isAcceptableOrUnknown(data['party_id']!, _partyIdMeta));
    } else if (isInserting) {
      context.missing(_partyIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {partyId, productId},
      ];
  @override
  PartyRatesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PartyRatesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      partyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}party_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      rate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rate'])!,
    );
  }

  @override
  $PartyRatesTableTable createAlias(String alias) {
    return $PartyRatesTableTable(attachedDatabase, alias);
  }
}

class PartyRatesTableData extends DataClass
    implements Insertable<PartyRatesTableData> {
  final int id;
  final int partyId;
  final int productId;
  final String unit;
  final double rate;
  const PartyRatesTableData(
      {required this.id,
      required this.partyId,
      required this.productId,
      required this.unit,
      required this.rate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['party_id'] = Variable<int>(partyId);
    map['product_id'] = Variable<int>(productId);
    map['unit'] = Variable<String>(unit);
    map['rate'] = Variable<double>(rate);
    return map;
  }

  PartyRatesTableCompanion toCompanion(bool nullToAbsent) {
    return PartyRatesTableCompanion(
      id: Value(id),
      partyId: Value(partyId),
      productId: Value(productId),
      unit: Value(unit),
      rate: Value(rate),
    );
  }

  factory PartyRatesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartyRatesTableData(
      id: serializer.fromJson<int>(json['id']),
      partyId: serializer.fromJson<int>(json['partyId']),
      productId: serializer.fromJson<int>(json['productId']),
      unit: serializer.fromJson<String>(json['unit']),
      rate: serializer.fromJson<double>(json['rate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'partyId': serializer.toJson<int>(partyId),
      'productId': serializer.toJson<int>(productId),
      'unit': serializer.toJson<String>(unit),
      'rate': serializer.toJson<double>(rate),
    };
  }

  PartyRatesTableData copyWith(
          {int? id,
          int? partyId,
          int? productId,
          String? unit,
          double? rate}) =>
      PartyRatesTableData(
        id: id ?? this.id,
        partyId: partyId ?? this.partyId,
        productId: productId ?? this.productId,
        unit: unit ?? this.unit,
        rate: rate ?? this.rate,
      );
  PartyRatesTableData copyWithCompanion(PartyRatesTableCompanion data) {
    return PartyRatesTableData(
      id: data.id.present ? data.id.value : this.id,
      partyId: data.partyId.present ? data.partyId.value : this.partyId,
      productId: data.productId.present ? data.productId.value : this.productId,
      unit: data.unit.present ? data.unit.value : this.unit,
      rate: data.rate.present ? data.rate.value : this.rate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PartyRatesTableData(')
          ..write('id: $id, ')
          ..write('partyId: $partyId, ')
          ..write('productId: $productId, ')
          ..write('unit: $unit, ')
          ..write('rate: $rate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, partyId, productId, unit, rate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartyRatesTableData &&
          other.id == this.id &&
          other.partyId == this.partyId &&
          other.productId == this.productId &&
          other.unit == this.unit &&
          other.rate == this.rate);
}

class PartyRatesTableCompanion extends UpdateCompanion<PartyRatesTableData> {
  final Value<int> id;
  final Value<int> partyId;
  final Value<int> productId;
  final Value<String> unit;
  final Value<double> rate;
  const PartyRatesTableCompanion({
    this.id = const Value.absent(),
    this.partyId = const Value.absent(),
    this.productId = const Value.absent(),
    this.unit = const Value.absent(),
    this.rate = const Value.absent(),
  });
  PartyRatesTableCompanion.insert({
    this.id = const Value.absent(),
    required int partyId,
    required int productId,
    required String unit,
    required double rate,
  })  : partyId = Value(partyId),
        productId = Value(productId),
        unit = Value(unit),
        rate = Value(rate);
  static Insertable<PartyRatesTableData> custom({
    Expression<int>? id,
    Expression<int>? partyId,
    Expression<int>? productId,
    Expression<String>? unit,
    Expression<double>? rate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (partyId != null) 'party_id': partyId,
      if (productId != null) 'product_id': productId,
      if (unit != null) 'unit': unit,
      if (rate != null) 'rate': rate,
    });
  }

  PartyRatesTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? partyId,
      Value<int>? productId,
      Value<String>? unit,
      Value<double>? rate}) {
    return PartyRatesTableCompanion(
      id: id ?? this.id,
      partyId: partyId ?? this.partyId,
      productId: productId ?? this.productId,
      unit: unit ?? this.unit,
      rate: rate ?? this.rate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (partyId.present) {
      map['party_id'] = Variable<int>(partyId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartyRatesTableCompanion(')
          ..write('id: $id, ')
          ..write('partyId: $partyId, ')
          ..write('productId: $productId, ')
          ..write('unit: $unit, ')
          ..write('rate: $rate')
          ..write(')'))
        .toString();
  }
}

class $SalesTableTable extends SalesTable
    with TableInfo<$SalesTableTable, SalesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sidMeta = const VerificationMeta('sid');
  @override
  late final GeneratedColumn<int> sid = GeneratedColumn<int>(
      'sid', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _salesCodeMeta =
      const VerificationMeta('salesCode');
  @override
  late final GeneratedColumn<String> salesCode = GeneratedColumn<String>(
      'sales_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _traderIdMeta =
      const VerificationMeta('traderId');
  @override
  late final GeneratedColumn<int> traderId = GeneratedColumn<int>(
      'trader_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES traders (id)'));
  static const VerificationMeta _saleDateMeta =
      const VerificationMeta('saleDate');
  @override
  late final GeneratedColumn<DateTime> saleDate = GeneratedColumn<DateTime>(
      'sale_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _taxableValueMeta =
      const VerificationMeta('taxableValue');
  @override
  late final GeneratedColumn<double> taxableValue = GeneratedColumn<double>(
      'taxable_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _cgstPercentMeta =
      const VerificationMeta('cgstPercent');
  @override
  late final GeneratedColumn<double> cgstPercent = GeneratedColumn<double>(
      'cgst_percent', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _sgstPercentMeta =
      const VerificationMeta('sgstPercent');
  @override
  late final GeneratedColumn<double> sgstPercent = GeneratedColumn<double>(
      'sgst_percent', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _igstPercentMeta =
      const VerificationMeta('igstPercent');
  @override
  late final GeneratedColumn<double> igstPercent = GeneratedColumn<double>(
      'igst_percent', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalAfterTaxMeta =
      const VerificationMeta('totalAfterTax');
  @override
  late final GeneratedColumn<double> totalAfterTax = GeneratedColumn<double>(
      'total_after_tax', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _deliveryModeMeta =
      const VerificationMeta('deliveryMode');
  @override
  late final GeneratedColumn<String> deliveryMode = GeneratedColumn<String>(
      'delivery_mode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateOfDeliveryMeta =
      const VerificationMeta('dateOfDelivery');
  @override
  late final GeneratedColumn<DateTime> dateOfDelivery =
      GeneratedColumn<DateTime>('date_of_delivery', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _paymentStatusMeta =
      const VerificationMeta('paymentStatus');
  @override
  late final GeneratedColumn<String> paymentStatus = GeneratedColumn<String>(
      'payment_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Pending'));
  static const VerificationMeta _journalEntryIdMeta =
      const VerificationMeta('journalEntryId');
  @override
  late final GeneratedColumn<int> journalEntryId = GeneratedColumn<int>(
      'journal_entry_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _reversedMeta =
      const VerificationMeta('reversed');
  @override
  late final GeneratedColumn<bool> reversed = GeneratedColumn<bool>(
      'reversed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("reversed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        sid,
        salesCode,
        traderId,
        saleDate,
        taxableValue,
        cgstPercent,
        sgstPercent,
        igstPercent,
        totalAfterTax,
        deliveryMode,
        dateOfDelivery,
        paymentStatus,
        journalEntryId,
        reversed,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales';
  @override
  VerificationContext validateIntegrity(Insertable<SalesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('sid')) {
      context.handle(
          _sidMeta, sid.isAcceptableOrUnknown(data['sid']!, _sidMeta));
    }
    if (data.containsKey('sales_code')) {
      context.handle(_salesCodeMeta,
          salesCode.isAcceptableOrUnknown(data['sales_code']!, _salesCodeMeta));
    } else if (isInserting) {
      context.missing(_salesCodeMeta);
    }
    if (data.containsKey('trader_id')) {
      context.handle(_traderIdMeta,
          traderId.isAcceptableOrUnknown(data['trader_id']!, _traderIdMeta));
    } else if (isInserting) {
      context.missing(_traderIdMeta);
    }
    if (data.containsKey('sale_date')) {
      context.handle(_saleDateMeta,
          saleDate.isAcceptableOrUnknown(data['sale_date']!, _saleDateMeta));
    } else if (isInserting) {
      context.missing(_saleDateMeta);
    }
    if (data.containsKey('taxable_value')) {
      context.handle(
          _taxableValueMeta,
          taxableValue.isAcceptableOrUnknown(
              data['taxable_value']!, _taxableValueMeta));
    } else if (isInserting) {
      context.missing(_taxableValueMeta);
    }
    if (data.containsKey('cgst_percent')) {
      context.handle(
          _cgstPercentMeta,
          cgstPercent.isAcceptableOrUnknown(
              data['cgst_percent']!, _cgstPercentMeta));
    }
    if (data.containsKey('sgst_percent')) {
      context.handle(
          _sgstPercentMeta,
          sgstPercent.isAcceptableOrUnknown(
              data['sgst_percent']!, _sgstPercentMeta));
    }
    if (data.containsKey('igst_percent')) {
      context.handle(
          _igstPercentMeta,
          igstPercent.isAcceptableOrUnknown(
              data['igst_percent']!, _igstPercentMeta));
    }
    if (data.containsKey('total_after_tax')) {
      context.handle(
          _totalAfterTaxMeta,
          totalAfterTax.isAcceptableOrUnknown(
              data['total_after_tax']!, _totalAfterTaxMeta));
    } else if (isInserting) {
      context.missing(_totalAfterTaxMeta);
    }
    if (data.containsKey('delivery_mode')) {
      context.handle(
          _deliveryModeMeta,
          deliveryMode.isAcceptableOrUnknown(
              data['delivery_mode']!, _deliveryModeMeta));
    }
    if (data.containsKey('date_of_delivery')) {
      context.handle(
          _dateOfDeliveryMeta,
          dateOfDelivery.isAcceptableOrUnknown(
              data['date_of_delivery']!, _dateOfDeliveryMeta));
    }
    if (data.containsKey('payment_status')) {
      context.handle(
          _paymentStatusMeta,
          paymentStatus.isAcceptableOrUnknown(
              data['payment_status']!, _paymentStatusMeta));
    }
    if (data.containsKey('journal_entry_id')) {
      context.handle(
          _journalEntryIdMeta,
          journalEntryId.isAcceptableOrUnknown(
              data['journal_entry_id']!, _journalEntryIdMeta));
    }
    if (data.containsKey('reversed')) {
      context.handle(_reversedMeta,
          reversed.isAcceptableOrUnknown(data['reversed']!, _reversedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sid};
  @override
  SalesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesTableData(
      sid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sid'])!,
      salesCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sales_code'])!,
      traderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trader_id'])!,
      saleDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sale_date'])!,
      taxableValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}taxable_value'])!,
      cgstPercent: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cgst_percent'])!,
      sgstPercent: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sgst_percent'])!,
      igstPercent: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}igst_percent'])!,
      totalAfterTax: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}total_after_tax'])!,
      deliveryMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}delivery_mode']),
      dateOfDelivery: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_of_delivery']),
      paymentStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_status'])!,
      journalEntryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}journal_entry_id']),
      reversed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}reversed'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SalesTableTable createAlias(String alias) {
    return $SalesTableTable(attachedDatabase, alias);
  }
}

class SalesTableData extends DataClass implements Insertable<SalesTableData> {
  final int sid;
  final String salesCode;
  final int traderId;
  final DateTime saleDate;
  final double taxableValue;
  final double cgstPercent;
  final double sgstPercent;
  final double igstPercent;
  final double totalAfterTax;
  final String? deliveryMode;
  final DateTime? dateOfDelivery;
  final String paymentStatus;
  final int? journalEntryId;
  final bool reversed;
  final DateTime createdAt;
  const SalesTableData(
      {required this.sid,
      required this.salesCode,
      required this.traderId,
      required this.saleDate,
      required this.taxableValue,
      required this.cgstPercent,
      required this.sgstPercent,
      required this.igstPercent,
      required this.totalAfterTax,
      this.deliveryMode,
      this.dateOfDelivery,
      required this.paymentStatus,
      this.journalEntryId,
      required this.reversed,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['sid'] = Variable<int>(sid);
    map['sales_code'] = Variable<String>(salesCode);
    map['trader_id'] = Variable<int>(traderId);
    map['sale_date'] = Variable<DateTime>(saleDate);
    map['taxable_value'] = Variable<double>(taxableValue);
    map['cgst_percent'] = Variable<double>(cgstPercent);
    map['sgst_percent'] = Variable<double>(sgstPercent);
    map['igst_percent'] = Variable<double>(igstPercent);
    map['total_after_tax'] = Variable<double>(totalAfterTax);
    if (!nullToAbsent || deliveryMode != null) {
      map['delivery_mode'] = Variable<String>(deliveryMode);
    }
    if (!nullToAbsent || dateOfDelivery != null) {
      map['date_of_delivery'] = Variable<DateTime>(dateOfDelivery);
    }
    map['payment_status'] = Variable<String>(paymentStatus);
    if (!nullToAbsent || journalEntryId != null) {
      map['journal_entry_id'] = Variable<int>(journalEntryId);
    }
    map['reversed'] = Variable<bool>(reversed);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SalesTableCompanion toCompanion(bool nullToAbsent) {
    return SalesTableCompanion(
      sid: Value(sid),
      salesCode: Value(salesCode),
      traderId: Value(traderId),
      saleDate: Value(saleDate),
      taxableValue: Value(taxableValue),
      cgstPercent: Value(cgstPercent),
      sgstPercent: Value(sgstPercent),
      igstPercent: Value(igstPercent),
      totalAfterTax: Value(totalAfterTax),
      deliveryMode: deliveryMode == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryMode),
      dateOfDelivery: dateOfDelivery == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfDelivery),
      paymentStatus: Value(paymentStatus),
      journalEntryId: journalEntryId == null && nullToAbsent
          ? const Value.absent()
          : Value(journalEntryId),
      reversed: Value(reversed),
      createdAt: Value(createdAt),
    );
  }

  factory SalesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesTableData(
      sid: serializer.fromJson<int>(json['sid']),
      salesCode: serializer.fromJson<String>(json['salesCode']),
      traderId: serializer.fromJson<int>(json['traderId']),
      saleDate: serializer.fromJson<DateTime>(json['saleDate']),
      taxableValue: serializer.fromJson<double>(json['taxableValue']),
      cgstPercent: serializer.fromJson<double>(json['cgstPercent']),
      sgstPercent: serializer.fromJson<double>(json['sgstPercent']),
      igstPercent: serializer.fromJson<double>(json['igstPercent']),
      totalAfterTax: serializer.fromJson<double>(json['totalAfterTax']),
      deliveryMode: serializer.fromJson<String?>(json['deliveryMode']),
      dateOfDelivery: serializer.fromJson<DateTime?>(json['dateOfDelivery']),
      paymentStatus: serializer.fromJson<String>(json['paymentStatus']),
      journalEntryId: serializer.fromJson<int?>(json['journalEntryId']),
      reversed: serializer.fromJson<bool>(json['reversed']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sid': serializer.toJson<int>(sid),
      'salesCode': serializer.toJson<String>(salesCode),
      'traderId': serializer.toJson<int>(traderId),
      'saleDate': serializer.toJson<DateTime>(saleDate),
      'taxableValue': serializer.toJson<double>(taxableValue),
      'cgstPercent': serializer.toJson<double>(cgstPercent),
      'sgstPercent': serializer.toJson<double>(sgstPercent),
      'igstPercent': serializer.toJson<double>(igstPercent),
      'totalAfterTax': serializer.toJson<double>(totalAfterTax),
      'deliveryMode': serializer.toJson<String?>(deliveryMode),
      'dateOfDelivery': serializer.toJson<DateTime?>(dateOfDelivery),
      'paymentStatus': serializer.toJson<String>(paymentStatus),
      'journalEntryId': serializer.toJson<int?>(journalEntryId),
      'reversed': serializer.toJson<bool>(reversed),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SalesTableData copyWith(
          {int? sid,
          String? salesCode,
          int? traderId,
          DateTime? saleDate,
          double? taxableValue,
          double? cgstPercent,
          double? sgstPercent,
          double? igstPercent,
          double? totalAfterTax,
          Value<String?> deliveryMode = const Value.absent(),
          Value<DateTime?> dateOfDelivery = const Value.absent(),
          String? paymentStatus,
          Value<int?> journalEntryId = const Value.absent(),
          bool? reversed,
          DateTime? createdAt}) =>
      SalesTableData(
        sid: sid ?? this.sid,
        salesCode: salesCode ?? this.salesCode,
        traderId: traderId ?? this.traderId,
        saleDate: saleDate ?? this.saleDate,
        taxableValue: taxableValue ?? this.taxableValue,
        cgstPercent: cgstPercent ?? this.cgstPercent,
        sgstPercent: sgstPercent ?? this.sgstPercent,
        igstPercent: igstPercent ?? this.igstPercent,
        totalAfterTax: totalAfterTax ?? this.totalAfterTax,
        deliveryMode:
            deliveryMode.present ? deliveryMode.value : this.deliveryMode,
        dateOfDelivery:
            dateOfDelivery.present ? dateOfDelivery.value : this.dateOfDelivery,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        journalEntryId:
            journalEntryId.present ? journalEntryId.value : this.journalEntryId,
        reversed: reversed ?? this.reversed,
        createdAt: createdAt ?? this.createdAt,
      );
  SalesTableData copyWithCompanion(SalesTableCompanion data) {
    return SalesTableData(
      sid: data.sid.present ? data.sid.value : this.sid,
      salesCode: data.salesCode.present ? data.salesCode.value : this.salesCode,
      traderId: data.traderId.present ? data.traderId.value : this.traderId,
      saleDate: data.saleDate.present ? data.saleDate.value : this.saleDate,
      taxableValue: data.taxableValue.present
          ? data.taxableValue.value
          : this.taxableValue,
      cgstPercent:
          data.cgstPercent.present ? data.cgstPercent.value : this.cgstPercent,
      sgstPercent:
          data.sgstPercent.present ? data.sgstPercent.value : this.sgstPercent,
      igstPercent:
          data.igstPercent.present ? data.igstPercent.value : this.igstPercent,
      totalAfterTax: data.totalAfterTax.present
          ? data.totalAfterTax.value
          : this.totalAfterTax,
      deliveryMode: data.deliveryMode.present
          ? data.deliveryMode.value
          : this.deliveryMode,
      dateOfDelivery: data.dateOfDelivery.present
          ? data.dateOfDelivery.value
          : this.dateOfDelivery,
      paymentStatus: data.paymentStatus.present
          ? data.paymentStatus.value
          : this.paymentStatus,
      journalEntryId: data.journalEntryId.present
          ? data.journalEntryId.value
          : this.journalEntryId,
      reversed: data.reversed.present ? data.reversed.value : this.reversed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesTableData(')
          ..write('sid: $sid, ')
          ..write('salesCode: $salesCode, ')
          ..write('traderId: $traderId, ')
          ..write('saleDate: $saleDate, ')
          ..write('taxableValue: $taxableValue, ')
          ..write('cgstPercent: $cgstPercent, ')
          ..write('sgstPercent: $sgstPercent, ')
          ..write('igstPercent: $igstPercent, ')
          ..write('totalAfterTax: $totalAfterTax, ')
          ..write('deliveryMode: $deliveryMode, ')
          ..write('dateOfDelivery: $dateOfDelivery, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('reversed: $reversed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      sid,
      salesCode,
      traderId,
      saleDate,
      taxableValue,
      cgstPercent,
      sgstPercent,
      igstPercent,
      totalAfterTax,
      deliveryMode,
      dateOfDelivery,
      paymentStatus,
      journalEntryId,
      reversed,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesTableData &&
          other.sid == this.sid &&
          other.salesCode == this.salesCode &&
          other.traderId == this.traderId &&
          other.saleDate == this.saleDate &&
          other.taxableValue == this.taxableValue &&
          other.cgstPercent == this.cgstPercent &&
          other.sgstPercent == this.sgstPercent &&
          other.igstPercent == this.igstPercent &&
          other.totalAfterTax == this.totalAfterTax &&
          other.deliveryMode == this.deliveryMode &&
          other.dateOfDelivery == this.dateOfDelivery &&
          other.paymentStatus == this.paymentStatus &&
          other.journalEntryId == this.journalEntryId &&
          other.reversed == this.reversed &&
          other.createdAt == this.createdAt);
}

class SalesTableCompanion extends UpdateCompanion<SalesTableData> {
  final Value<int> sid;
  final Value<String> salesCode;
  final Value<int> traderId;
  final Value<DateTime> saleDate;
  final Value<double> taxableValue;
  final Value<double> cgstPercent;
  final Value<double> sgstPercent;
  final Value<double> igstPercent;
  final Value<double> totalAfterTax;
  final Value<String?> deliveryMode;
  final Value<DateTime?> dateOfDelivery;
  final Value<String> paymentStatus;
  final Value<int?> journalEntryId;
  final Value<bool> reversed;
  final Value<DateTime> createdAt;
  const SalesTableCompanion({
    this.sid = const Value.absent(),
    this.salesCode = const Value.absent(),
    this.traderId = const Value.absent(),
    this.saleDate = const Value.absent(),
    this.taxableValue = const Value.absent(),
    this.cgstPercent = const Value.absent(),
    this.sgstPercent = const Value.absent(),
    this.igstPercent = const Value.absent(),
    this.totalAfterTax = const Value.absent(),
    this.deliveryMode = const Value.absent(),
    this.dateOfDelivery = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.journalEntryId = const Value.absent(),
    this.reversed = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SalesTableCompanion.insert({
    this.sid = const Value.absent(),
    required String salesCode,
    required int traderId,
    required DateTime saleDate,
    required double taxableValue,
    this.cgstPercent = const Value.absent(),
    this.sgstPercent = const Value.absent(),
    this.igstPercent = const Value.absent(),
    required double totalAfterTax,
    this.deliveryMode = const Value.absent(),
    this.dateOfDelivery = const Value.absent(),
    this.paymentStatus = const Value.absent(),
    this.journalEntryId = const Value.absent(),
    this.reversed = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : salesCode = Value(salesCode),
        traderId = Value(traderId),
        saleDate = Value(saleDate),
        taxableValue = Value(taxableValue),
        totalAfterTax = Value(totalAfterTax);
  static Insertable<SalesTableData> custom({
    Expression<int>? sid,
    Expression<String>? salesCode,
    Expression<int>? traderId,
    Expression<DateTime>? saleDate,
    Expression<double>? taxableValue,
    Expression<double>? cgstPercent,
    Expression<double>? sgstPercent,
    Expression<double>? igstPercent,
    Expression<double>? totalAfterTax,
    Expression<String>? deliveryMode,
    Expression<DateTime>? dateOfDelivery,
    Expression<String>? paymentStatus,
    Expression<int>? journalEntryId,
    Expression<bool>? reversed,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (sid != null) 'sid': sid,
      if (salesCode != null) 'sales_code': salesCode,
      if (traderId != null) 'trader_id': traderId,
      if (saleDate != null) 'sale_date': saleDate,
      if (taxableValue != null) 'taxable_value': taxableValue,
      if (cgstPercent != null) 'cgst_percent': cgstPercent,
      if (sgstPercent != null) 'sgst_percent': sgstPercent,
      if (igstPercent != null) 'igst_percent': igstPercent,
      if (totalAfterTax != null) 'total_after_tax': totalAfterTax,
      if (deliveryMode != null) 'delivery_mode': deliveryMode,
      if (dateOfDelivery != null) 'date_of_delivery': dateOfDelivery,
      if (paymentStatus != null) 'payment_status': paymentStatus,
      if (journalEntryId != null) 'journal_entry_id': journalEntryId,
      if (reversed != null) 'reversed': reversed,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SalesTableCompanion copyWith(
      {Value<int>? sid,
      Value<String>? salesCode,
      Value<int>? traderId,
      Value<DateTime>? saleDate,
      Value<double>? taxableValue,
      Value<double>? cgstPercent,
      Value<double>? sgstPercent,
      Value<double>? igstPercent,
      Value<double>? totalAfterTax,
      Value<String?>? deliveryMode,
      Value<DateTime?>? dateOfDelivery,
      Value<String>? paymentStatus,
      Value<int?>? journalEntryId,
      Value<bool>? reversed,
      Value<DateTime>? createdAt}) {
    return SalesTableCompanion(
      sid: sid ?? this.sid,
      salesCode: salesCode ?? this.salesCode,
      traderId: traderId ?? this.traderId,
      saleDate: saleDate ?? this.saleDate,
      taxableValue: taxableValue ?? this.taxableValue,
      cgstPercent: cgstPercent ?? this.cgstPercent,
      sgstPercent: sgstPercent ?? this.sgstPercent,
      igstPercent: igstPercent ?? this.igstPercent,
      totalAfterTax: totalAfterTax ?? this.totalAfterTax,
      deliveryMode: deliveryMode ?? this.deliveryMode,
      dateOfDelivery: dateOfDelivery ?? this.dateOfDelivery,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      journalEntryId: journalEntryId ?? this.journalEntryId,
      reversed: reversed ?? this.reversed,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sid.present) {
      map['sid'] = Variable<int>(sid.value);
    }
    if (salesCode.present) {
      map['sales_code'] = Variable<String>(salesCode.value);
    }
    if (traderId.present) {
      map['trader_id'] = Variable<int>(traderId.value);
    }
    if (saleDate.present) {
      map['sale_date'] = Variable<DateTime>(saleDate.value);
    }
    if (taxableValue.present) {
      map['taxable_value'] = Variable<double>(taxableValue.value);
    }
    if (cgstPercent.present) {
      map['cgst_percent'] = Variable<double>(cgstPercent.value);
    }
    if (sgstPercent.present) {
      map['sgst_percent'] = Variable<double>(sgstPercent.value);
    }
    if (igstPercent.present) {
      map['igst_percent'] = Variable<double>(igstPercent.value);
    }
    if (totalAfterTax.present) {
      map['total_after_tax'] = Variable<double>(totalAfterTax.value);
    }
    if (deliveryMode.present) {
      map['delivery_mode'] = Variable<String>(deliveryMode.value);
    }
    if (dateOfDelivery.present) {
      map['date_of_delivery'] = Variable<DateTime>(dateOfDelivery.value);
    }
    if (paymentStatus.present) {
      map['payment_status'] = Variable<String>(paymentStatus.value);
    }
    if (journalEntryId.present) {
      map['journal_entry_id'] = Variable<int>(journalEntryId.value);
    }
    if (reversed.present) {
      map['reversed'] = Variable<bool>(reversed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesTableCompanion(')
          ..write('sid: $sid, ')
          ..write('salesCode: $salesCode, ')
          ..write('traderId: $traderId, ')
          ..write('saleDate: $saleDate, ')
          ..write('taxableValue: $taxableValue, ')
          ..write('cgstPercent: $cgstPercent, ')
          ..write('sgstPercent: $sgstPercent, ')
          ..write('igstPercent: $igstPercent, ')
          ..write('totalAfterTax: $totalAfterTax, ')
          ..write('deliveryMode: $deliveryMode, ')
          ..write('dateOfDelivery: $dateOfDelivery, ')
          ..write('paymentStatus: $paymentStatus, ')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('reversed: $reversed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SalesLineItemsTableTable extends SalesLineItemsTable
    with TableInfo<$SalesLineItemsTableTable, SalesLineItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SalesLineItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _salesIdMeta =
      const VerificationMeta('salesId');
  @override
  late final GeneratedColumn<int> salesId = GeneratedColumn<int>(
      'sales_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES sales (sid)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (pid)'));
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<double> qty = GeneratedColumn<double>(
      'qty', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceOfProductMeta =
      const VerificationMeta('priceOfProduct');
  @override
  late final GeneratedColumn<double> priceOfProduct = GeneratedColumn<double>(
      'price_of_product', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _taxableValueMeta =
      const VerificationMeta('taxableValue');
  @override
  late final GeneratedColumn<double> taxableValue = GeneratedColumn<double>(
      'taxable_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        salesId,
        productId,
        productName,
        unit,
        qty,
        priceOfProduct,
        taxableValue
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sales_line_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<SalesLineItemsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sales_id')) {
      context.handle(_salesIdMeta,
          salesId.isAcceptableOrUnknown(data['sales_id']!, _salesIdMeta));
    } else if (isInserting) {
      context.missing(_salesIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('price_of_product')) {
      context.handle(
          _priceOfProductMeta,
          priceOfProduct.isAcceptableOrUnknown(
              data['price_of_product']!, _priceOfProductMeta));
    } else if (isInserting) {
      context.missing(_priceOfProductMeta);
    }
    if (data.containsKey('taxable_value')) {
      context.handle(
          _taxableValueMeta,
          taxableValue.isAcceptableOrUnknown(
              data['taxable_value']!, _taxableValueMeta));
    } else if (isInserting) {
      context.missing(_taxableValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SalesLineItemsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SalesLineItemsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      salesId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sales_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      qty: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}qty'])!,
      priceOfProduct: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}price_of_product'])!,
      taxableValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}taxable_value'])!,
    );
  }

  @override
  $SalesLineItemsTableTable createAlias(String alias) {
    return $SalesLineItemsTableTable(attachedDatabase, alias);
  }
}

class SalesLineItemsTableData extends DataClass
    implements Insertable<SalesLineItemsTableData> {
  final int id;
  final int salesId;
  final int productId;
  final String productName;
  final String unit;
  final double qty;
  final double priceOfProduct;
  final double taxableValue;
  const SalesLineItemsTableData(
      {required this.id,
      required this.salesId,
      required this.productId,
      required this.productName,
      required this.unit,
      required this.qty,
      required this.priceOfProduct,
      required this.taxableValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sales_id'] = Variable<int>(salesId);
    map['product_id'] = Variable<int>(productId);
    map['product_name'] = Variable<String>(productName);
    map['unit'] = Variable<String>(unit);
    map['qty'] = Variable<double>(qty);
    map['price_of_product'] = Variable<double>(priceOfProduct);
    map['taxable_value'] = Variable<double>(taxableValue);
    return map;
  }

  SalesLineItemsTableCompanion toCompanion(bool nullToAbsent) {
    return SalesLineItemsTableCompanion(
      id: Value(id),
      salesId: Value(salesId),
      productId: Value(productId),
      productName: Value(productName),
      unit: Value(unit),
      qty: Value(qty),
      priceOfProduct: Value(priceOfProduct),
      taxableValue: Value(taxableValue),
    );
  }

  factory SalesLineItemsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SalesLineItemsTableData(
      id: serializer.fromJson<int>(json['id']),
      salesId: serializer.fromJson<int>(json['salesId']),
      productId: serializer.fromJson<int>(json['productId']),
      productName: serializer.fromJson<String>(json['productName']),
      unit: serializer.fromJson<String>(json['unit']),
      qty: serializer.fromJson<double>(json['qty']),
      priceOfProduct: serializer.fromJson<double>(json['priceOfProduct']),
      taxableValue: serializer.fromJson<double>(json['taxableValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'salesId': serializer.toJson<int>(salesId),
      'productId': serializer.toJson<int>(productId),
      'productName': serializer.toJson<String>(productName),
      'unit': serializer.toJson<String>(unit),
      'qty': serializer.toJson<double>(qty),
      'priceOfProduct': serializer.toJson<double>(priceOfProduct),
      'taxableValue': serializer.toJson<double>(taxableValue),
    };
  }

  SalesLineItemsTableData copyWith(
          {int? id,
          int? salesId,
          int? productId,
          String? productName,
          String? unit,
          double? qty,
          double? priceOfProduct,
          double? taxableValue}) =>
      SalesLineItemsTableData(
        id: id ?? this.id,
        salesId: salesId ?? this.salesId,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        unit: unit ?? this.unit,
        qty: qty ?? this.qty,
        priceOfProduct: priceOfProduct ?? this.priceOfProduct,
        taxableValue: taxableValue ?? this.taxableValue,
      );
  SalesLineItemsTableData copyWithCompanion(SalesLineItemsTableCompanion data) {
    return SalesLineItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      salesId: data.salesId.present ? data.salesId.value : this.salesId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      unit: data.unit.present ? data.unit.value : this.unit,
      qty: data.qty.present ? data.qty.value : this.qty,
      priceOfProduct: data.priceOfProduct.present
          ? data.priceOfProduct.value
          : this.priceOfProduct,
      taxableValue: data.taxableValue.present
          ? data.taxableValue.value
          : this.taxableValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SalesLineItemsTableData(')
          ..write('id: $id, ')
          ..write('salesId: $salesId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('unit: $unit, ')
          ..write('qty: $qty, ')
          ..write('priceOfProduct: $priceOfProduct, ')
          ..write('taxableValue: $taxableValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, salesId, productId, productName, unit,
      qty, priceOfProduct, taxableValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SalesLineItemsTableData &&
          other.id == this.id &&
          other.salesId == this.salesId &&
          other.productId == this.productId &&
          other.productName == this.productName &&
          other.unit == this.unit &&
          other.qty == this.qty &&
          other.priceOfProduct == this.priceOfProduct &&
          other.taxableValue == this.taxableValue);
}

class SalesLineItemsTableCompanion
    extends UpdateCompanion<SalesLineItemsTableData> {
  final Value<int> id;
  final Value<int> salesId;
  final Value<int> productId;
  final Value<String> productName;
  final Value<String> unit;
  final Value<double> qty;
  final Value<double> priceOfProduct;
  final Value<double> taxableValue;
  const SalesLineItemsTableCompanion({
    this.id = const Value.absent(),
    this.salesId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productName = const Value.absent(),
    this.unit = const Value.absent(),
    this.qty = const Value.absent(),
    this.priceOfProduct = const Value.absent(),
    this.taxableValue = const Value.absent(),
  });
  SalesLineItemsTableCompanion.insert({
    this.id = const Value.absent(),
    required int salesId,
    required int productId,
    required String productName,
    required String unit,
    required double qty,
    required double priceOfProduct,
    required double taxableValue,
  })  : salesId = Value(salesId),
        productId = Value(productId),
        productName = Value(productName),
        unit = Value(unit),
        qty = Value(qty),
        priceOfProduct = Value(priceOfProduct),
        taxableValue = Value(taxableValue);
  static Insertable<SalesLineItemsTableData> custom({
    Expression<int>? id,
    Expression<int>? salesId,
    Expression<int>? productId,
    Expression<String>? productName,
    Expression<String>? unit,
    Expression<double>? qty,
    Expression<double>? priceOfProduct,
    Expression<double>? taxableValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (salesId != null) 'sales_id': salesId,
      if (productId != null) 'product_id': productId,
      if (productName != null) 'product_name': productName,
      if (unit != null) 'unit': unit,
      if (qty != null) 'qty': qty,
      if (priceOfProduct != null) 'price_of_product': priceOfProduct,
      if (taxableValue != null) 'taxable_value': taxableValue,
    });
  }

  SalesLineItemsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? salesId,
      Value<int>? productId,
      Value<String>? productName,
      Value<String>? unit,
      Value<double>? qty,
      Value<double>? priceOfProduct,
      Value<double>? taxableValue}) {
    return SalesLineItemsTableCompanion(
      id: id ?? this.id,
      salesId: salesId ?? this.salesId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      unit: unit ?? this.unit,
      qty: qty ?? this.qty,
      priceOfProduct: priceOfProduct ?? this.priceOfProduct,
      taxableValue: taxableValue ?? this.taxableValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (salesId.present) {
      map['sales_id'] = Variable<int>(salesId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (qty.present) {
      map['qty'] = Variable<double>(qty.value);
    }
    if (priceOfProduct.present) {
      map['price_of_product'] = Variable<double>(priceOfProduct.value);
    }
    if (taxableValue.present) {
      map['taxable_value'] = Variable<double>(taxableValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SalesLineItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('salesId: $salesId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('unit: $unit, ')
          ..write('qty: $qty, ')
          ..write('priceOfProduct: $priceOfProduct, ')
          ..write('taxableValue: $taxableValue')
          ..write(')'))
        .toString();
  }
}

class $ProcurementTableTable extends ProcurementTable
    with TableInfo<$ProcurementTableTable, ProcurementTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProcurementTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pidMeta = const VerificationMeta('pid');
  @override
  late final GeneratedColumn<int> pid = GeneratedColumn<int>(
      'pid', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _purchaseCodeMeta =
      const VerificationMeta('purchaseCode');
  @override
  late final GeneratedColumn<String> purchaseCode = GeneratedColumn<String>(
      'purchase_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _traderIdMeta =
      const VerificationMeta('traderId');
  @override
  late final GeneratedColumn<int> traderId = GeneratedColumn<int>(
      'trader_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES traders (id)'));
  static const VerificationMeta _purchaseDateMeta =
      const VerificationMeta('purchaseDate');
  @override
  late final GeneratedColumn<DateTime> purchaseDate = GeneratedColumn<DateTime>(
      'purchase_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _taxableValueMeta =
      const VerificationMeta('taxableValue');
  @override
  late final GeneratedColumn<double> taxableValue = GeneratedColumn<double>(
      'taxable_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _cgstPercentMeta =
      const VerificationMeta('cgstPercent');
  @override
  late final GeneratedColumn<double> cgstPercent = GeneratedColumn<double>(
      'cgst_percent', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _sgstPercentMeta =
      const VerificationMeta('sgstPercent');
  @override
  late final GeneratedColumn<double> sgstPercent = GeneratedColumn<double>(
      'sgst_percent', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _igstPercentMeta =
      const VerificationMeta('igstPercent');
  @override
  late final GeneratedColumn<double> igstPercent = GeneratedColumn<double>(
      'igst_percent', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _otherExpensesMeta =
      const VerificationMeta('otherExpenses');
  @override
  late final GeneratedColumn<double> otherExpenses = GeneratedColumn<double>(
      'other_expenses', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _totalAfterTaxMeta =
      const VerificationMeta('totalAfterTax');
  @override
  late final GeneratedColumn<double> totalAfterTax = GeneratedColumn<double>(
      'total_after_tax', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _journalEntryIdMeta =
      const VerificationMeta('journalEntryId');
  @override
  late final GeneratedColumn<int> journalEntryId = GeneratedColumn<int>(
      'journal_entry_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _reversedMeta =
      const VerificationMeta('reversed');
  @override
  late final GeneratedColumn<bool> reversed = GeneratedColumn<bool>(
      'reversed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("reversed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        pid,
        purchaseCode,
        traderId,
        purchaseDate,
        taxableValue,
        cgstPercent,
        sgstPercent,
        igstPercent,
        otherExpenses,
        totalAfterTax,
        journalEntryId,
        reversed,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'procurement';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProcurementTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pid')) {
      context.handle(
          _pidMeta, pid.isAcceptableOrUnknown(data['pid']!, _pidMeta));
    }
    if (data.containsKey('purchase_code')) {
      context.handle(
          _purchaseCodeMeta,
          purchaseCode.isAcceptableOrUnknown(
              data['purchase_code']!, _purchaseCodeMeta));
    } else if (isInserting) {
      context.missing(_purchaseCodeMeta);
    }
    if (data.containsKey('trader_id')) {
      context.handle(_traderIdMeta,
          traderId.isAcceptableOrUnknown(data['trader_id']!, _traderIdMeta));
    } else if (isInserting) {
      context.missing(_traderIdMeta);
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
          _purchaseDateMeta,
          purchaseDate.isAcceptableOrUnknown(
              data['purchase_date']!, _purchaseDateMeta));
    } else if (isInserting) {
      context.missing(_purchaseDateMeta);
    }
    if (data.containsKey('taxable_value')) {
      context.handle(
          _taxableValueMeta,
          taxableValue.isAcceptableOrUnknown(
              data['taxable_value']!, _taxableValueMeta));
    } else if (isInserting) {
      context.missing(_taxableValueMeta);
    }
    if (data.containsKey('cgst_percent')) {
      context.handle(
          _cgstPercentMeta,
          cgstPercent.isAcceptableOrUnknown(
              data['cgst_percent']!, _cgstPercentMeta));
    }
    if (data.containsKey('sgst_percent')) {
      context.handle(
          _sgstPercentMeta,
          sgstPercent.isAcceptableOrUnknown(
              data['sgst_percent']!, _sgstPercentMeta));
    }
    if (data.containsKey('igst_percent')) {
      context.handle(
          _igstPercentMeta,
          igstPercent.isAcceptableOrUnknown(
              data['igst_percent']!, _igstPercentMeta));
    }
    if (data.containsKey('other_expenses')) {
      context.handle(
          _otherExpensesMeta,
          otherExpenses.isAcceptableOrUnknown(
              data['other_expenses']!, _otherExpensesMeta));
    }
    if (data.containsKey('total_after_tax')) {
      context.handle(
          _totalAfterTaxMeta,
          totalAfterTax.isAcceptableOrUnknown(
              data['total_after_tax']!, _totalAfterTaxMeta));
    } else if (isInserting) {
      context.missing(_totalAfterTaxMeta);
    }
    if (data.containsKey('journal_entry_id')) {
      context.handle(
          _journalEntryIdMeta,
          journalEntryId.isAcceptableOrUnknown(
              data['journal_entry_id']!, _journalEntryIdMeta));
    }
    if (data.containsKey('reversed')) {
      context.handle(_reversedMeta,
          reversed.isAcceptableOrUnknown(data['reversed']!, _reversedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pid};
  @override
  ProcurementTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProcurementTableData(
      pid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pid'])!,
      purchaseCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}purchase_code'])!,
      traderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trader_id'])!,
      purchaseDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}purchase_date'])!,
      taxableValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}taxable_value'])!,
      cgstPercent: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}cgst_percent'])!,
      sgstPercent: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sgst_percent'])!,
      igstPercent: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}igst_percent'])!,
      otherExpenses: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}other_expenses'])!,
      totalAfterTax: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}total_after_tax'])!,
      journalEntryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}journal_entry_id']),
      reversed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}reversed'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ProcurementTableTable createAlias(String alias) {
    return $ProcurementTableTable(attachedDatabase, alias);
  }
}

class ProcurementTableData extends DataClass
    implements Insertable<ProcurementTableData> {
  final int pid;
  final String purchaseCode;
  final int traderId;
  final DateTime purchaseDate;
  final double taxableValue;
  final double cgstPercent;
  final double sgstPercent;
  final double igstPercent;
  final double otherExpenses;
  final double totalAfterTax;
  final int? journalEntryId;
  final bool reversed;
  final DateTime createdAt;
  const ProcurementTableData(
      {required this.pid,
      required this.purchaseCode,
      required this.traderId,
      required this.purchaseDate,
      required this.taxableValue,
      required this.cgstPercent,
      required this.sgstPercent,
      required this.igstPercent,
      required this.otherExpenses,
      required this.totalAfterTax,
      this.journalEntryId,
      required this.reversed,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pid'] = Variable<int>(pid);
    map['purchase_code'] = Variable<String>(purchaseCode);
    map['trader_id'] = Variable<int>(traderId);
    map['purchase_date'] = Variable<DateTime>(purchaseDate);
    map['taxable_value'] = Variable<double>(taxableValue);
    map['cgst_percent'] = Variable<double>(cgstPercent);
    map['sgst_percent'] = Variable<double>(sgstPercent);
    map['igst_percent'] = Variable<double>(igstPercent);
    map['other_expenses'] = Variable<double>(otherExpenses);
    map['total_after_tax'] = Variable<double>(totalAfterTax);
    if (!nullToAbsent || journalEntryId != null) {
      map['journal_entry_id'] = Variable<int>(journalEntryId);
    }
    map['reversed'] = Variable<bool>(reversed);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProcurementTableCompanion toCompanion(bool nullToAbsent) {
    return ProcurementTableCompanion(
      pid: Value(pid),
      purchaseCode: Value(purchaseCode),
      traderId: Value(traderId),
      purchaseDate: Value(purchaseDate),
      taxableValue: Value(taxableValue),
      cgstPercent: Value(cgstPercent),
      sgstPercent: Value(sgstPercent),
      igstPercent: Value(igstPercent),
      otherExpenses: Value(otherExpenses),
      totalAfterTax: Value(totalAfterTax),
      journalEntryId: journalEntryId == null && nullToAbsent
          ? const Value.absent()
          : Value(journalEntryId),
      reversed: Value(reversed),
      createdAt: Value(createdAt),
    );
  }

  factory ProcurementTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProcurementTableData(
      pid: serializer.fromJson<int>(json['pid']),
      purchaseCode: serializer.fromJson<String>(json['purchaseCode']),
      traderId: serializer.fromJson<int>(json['traderId']),
      purchaseDate: serializer.fromJson<DateTime>(json['purchaseDate']),
      taxableValue: serializer.fromJson<double>(json['taxableValue']),
      cgstPercent: serializer.fromJson<double>(json['cgstPercent']),
      sgstPercent: serializer.fromJson<double>(json['sgstPercent']),
      igstPercent: serializer.fromJson<double>(json['igstPercent']),
      otherExpenses: serializer.fromJson<double>(json['otherExpenses']),
      totalAfterTax: serializer.fromJson<double>(json['totalAfterTax']),
      journalEntryId: serializer.fromJson<int?>(json['journalEntryId']),
      reversed: serializer.fromJson<bool>(json['reversed']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pid': serializer.toJson<int>(pid),
      'purchaseCode': serializer.toJson<String>(purchaseCode),
      'traderId': serializer.toJson<int>(traderId),
      'purchaseDate': serializer.toJson<DateTime>(purchaseDate),
      'taxableValue': serializer.toJson<double>(taxableValue),
      'cgstPercent': serializer.toJson<double>(cgstPercent),
      'sgstPercent': serializer.toJson<double>(sgstPercent),
      'igstPercent': serializer.toJson<double>(igstPercent),
      'otherExpenses': serializer.toJson<double>(otherExpenses),
      'totalAfterTax': serializer.toJson<double>(totalAfterTax),
      'journalEntryId': serializer.toJson<int?>(journalEntryId),
      'reversed': serializer.toJson<bool>(reversed),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProcurementTableData copyWith(
          {int? pid,
          String? purchaseCode,
          int? traderId,
          DateTime? purchaseDate,
          double? taxableValue,
          double? cgstPercent,
          double? sgstPercent,
          double? igstPercent,
          double? otherExpenses,
          double? totalAfterTax,
          Value<int?> journalEntryId = const Value.absent(),
          bool? reversed,
          DateTime? createdAt}) =>
      ProcurementTableData(
        pid: pid ?? this.pid,
        purchaseCode: purchaseCode ?? this.purchaseCode,
        traderId: traderId ?? this.traderId,
        purchaseDate: purchaseDate ?? this.purchaseDate,
        taxableValue: taxableValue ?? this.taxableValue,
        cgstPercent: cgstPercent ?? this.cgstPercent,
        sgstPercent: sgstPercent ?? this.sgstPercent,
        igstPercent: igstPercent ?? this.igstPercent,
        otherExpenses: otherExpenses ?? this.otherExpenses,
        totalAfterTax: totalAfterTax ?? this.totalAfterTax,
        journalEntryId:
            journalEntryId.present ? journalEntryId.value : this.journalEntryId,
        reversed: reversed ?? this.reversed,
        createdAt: createdAt ?? this.createdAt,
      );
  ProcurementTableData copyWithCompanion(ProcurementTableCompanion data) {
    return ProcurementTableData(
      pid: data.pid.present ? data.pid.value : this.pid,
      purchaseCode: data.purchaseCode.present
          ? data.purchaseCode.value
          : this.purchaseCode,
      traderId: data.traderId.present ? data.traderId.value : this.traderId,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      taxableValue: data.taxableValue.present
          ? data.taxableValue.value
          : this.taxableValue,
      cgstPercent:
          data.cgstPercent.present ? data.cgstPercent.value : this.cgstPercent,
      sgstPercent:
          data.sgstPercent.present ? data.sgstPercent.value : this.sgstPercent,
      igstPercent:
          data.igstPercent.present ? data.igstPercent.value : this.igstPercent,
      otherExpenses: data.otherExpenses.present
          ? data.otherExpenses.value
          : this.otherExpenses,
      totalAfterTax: data.totalAfterTax.present
          ? data.totalAfterTax.value
          : this.totalAfterTax,
      journalEntryId: data.journalEntryId.present
          ? data.journalEntryId.value
          : this.journalEntryId,
      reversed: data.reversed.present ? data.reversed.value : this.reversed,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProcurementTableData(')
          ..write('pid: $pid, ')
          ..write('purchaseCode: $purchaseCode, ')
          ..write('traderId: $traderId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('taxableValue: $taxableValue, ')
          ..write('cgstPercent: $cgstPercent, ')
          ..write('sgstPercent: $sgstPercent, ')
          ..write('igstPercent: $igstPercent, ')
          ..write('otherExpenses: $otherExpenses, ')
          ..write('totalAfterTax: $totalAfterTax, ')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('reversed: $reversed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      pid,
      purchaseCode,
      traderId,
      purchaseDate,
      taxableValue,
      cgstPercent,
      sgstPercent,
      igstPercent,
      otherExpenses,
      totalAfterTax,
      journalEntryId,
      reversed,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProcurementTableData &&
          other.pid == this.pid &&
          other.purchaseCode == this.purchaseCode &&
          other.traderId == this.traderId &&
          other.purchaseDate == this.purchaseDate &&
          other.taxableValue == this.taxableValue &&
          other.cgstPercent == this.cgstPercent &&
          other.sgstPercent == this.sgstPercent &&
          other.igstPercent == this.igstPercent &&
          other.otherExpenses == this.otherExpenses &&
          other.totalAfterTax == this.totalAfterTax &&
          other.journalEntryId == this.journalEntryId &&
          other.reversed == this.reversed &&
          other.createdAt == this.createdAt);
}

class ProcurementTableCompanion extends UpdateCompanion<ProcurementTableData> {
  final Value<int> pid;
  final Value<String> purchaseCode;
  final Value<int> traderId;
  final Value<DateTime> purchaseDate;
  final Value<double> taxableValue;
  final Value<double> cgstPercent;
  final Value<double> sgstPercent;
  final Value<double> igstPercent;
  final Value<double> otherExpenses;
  final Value<double> totalAfterTax;
  final Value<int?> journalEntryId;
  final Value<bool> reversed;
  final Value<DateTime> createdAt;
  const ProcurementTableCompanion({
    this.pid = const Value.absent(),
    this.purchaseCode = const Value.absent(),
    this.traderId = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.taxableValue = const Value.absent(),
    this.cgstPercent = const Value.absent(),
    this.sgstPercent = const Value.absent(),
    this.igstPercent = const Value.absent(),
    this.otherExpenses = const Value.absent(),
    this.totalAfterTax = const Value.absent(),
    this.journalEntryId = const Value.absent(),
    this.reversed = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProcurementTableCompanion.insert({
    this.pid = const Value.absent(),
    required String purchaseCode,
    required int traderId,
    required DateTime purchaseDate,
    required double taxableValue,
    this.cgstPercent = const Value.absent(),
    this.sgstPercent = const Value.absent(),
    this.igstPercent = const Value.absent(),
    this.otherExpenses = const Value.absent(),
    required double totalAfterTax,
    this.journalEntryId = const Value.absent(),
    this.reversed = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : purchaseCode = Value(purchaseCode),
        traderId = Value(traderId),
        purchaseDate = Value(purchaseDate),
        taxableValue = Value(taxableValue),
        totalAfterTax = Value(totalAfterTax);
  static Insertable<ProcurementTableData> custom({
    Expression<int>? pid,
    Expression<String>? purchaseCode,
    Expression<int>? traderId,
    Expression<DateTime>? purchaseDate,
    Expression<double>? taxableValue,
    Expression<double>? cgstPercent,
    Expression<double>? sgstPercent,
    Expression<double>? igstPercent,
    Expression<double>? otherExpenses,
    Expression<double>? totalAfterTax,
    Expression<int>? journalEntryId,
    Expression<bool>? reversed,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (pid != null) 'pid': pid,
      if (purchaseCode != null) 'purchase_code': purchaseCode,
      if (traderId != null) 'trader_id': traderId,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (taxableValue != null) 'taxable_value': taxableValue,
      if (cgstPercent != null) 'cgst_percent': cgstPercent,
      if (sgstPercent != null) 'sgst_percent': sgstPercent,
      if (igstPercent != null) 'igst_percent': igstPercent,
      if (otherExpenses != null) 'other_expenses': otherExpenses,
      if (totalAfterTax != null) 'total_after_tax': totalAfterTax,
      if (journalEntryId != null) 'journal_entry_id': journalEntryId,
      if (reversed != null) 'reversed': reversed,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProcurementTableCompanion copyWith(
      {Value<int>? pid,
      Value<String>? purchaseCode,
      Value<int>? traderId,
      Value<DateTime>? purchaseDate,
      Value<double>? taxableValue,
      Value<double>? cgstPercent,
      Value<double>? sgstPercent,
      Value<double>? igstPercent,
      Value<double>? otherExpenses,
      Value<double>? totalAfterTax,
      Value<int?>? journalEntryId,
      Value<bool>? reversed,
      Value<DateTime>? createdAt}) {
    return ProcurementTableCompanion(
      pid: pid ?? this.pid,
      purchaseCode: purchaseCode ?? this.purchaseCode,
      traderId: traderId ?? this.traderId,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      taxableValue: taxableValue ?? this.taxableValue,
      cgstPercent: cgstPercent ?? this.cgstPercent,
      sgstPercent: sgstPercent ?? this.sgstPercent,
      igstPercent: igstPercent ?? this.igstPercent,
      otherExpenses: otherExpenses ?? this.otherExpenses,
      totalAfterTax: totalAfterTax ?? this.totalAfterTax,
      journalEntryId: journalEntryId ?? this.journalEntryId,
      reversed: reversed ?? this.reversed,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pid.present) {
      map['pid'] = Variable<int>(pid.value);
    }
    if (purchaseCode.present) {
      map['purchase_code'] = Variable<String>(purchaseCode.value);
    }
    if (traderId.present) {
      map['trader_id'] = Variable<int>(traderId.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<DateTime>(purchaseDate.value);
    }
    if (taxableValue.present) {
      map['taxable_value'] = Variable<double>(taxableValue.value);
    }
    if (cgstPercent.present) {
      map['cgst_percent'] = Variable<double>(cgstPercent.value);
    }
    if (sgstPercent.present) {
      map['sgst_percent'] = Variable<double>(sgstPercent.value);
    }
    if (igstPercent.present) {
      map['igst_percent'] = Variable<double>(igstPercent.value);
    }
    if (otherExpenses.present) {
      map['other_expenses'] = Variable<double>(otherExpenses.value);
    }
    if (totalAfterTax.present) {
      map['total_after_tax'] = Variable<double>(totalAfterTax.value);
    }
    if (journalEntryId.present) {
      map['journal_entry_id'] = Variable<int>(journalEntryId.value);
    }
    if (reversed.present) {
      map['reversed'] = Variable<bool>(reversed.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProcurementTableCompanion(')
          ..write('pid: $pid, ')
          ..write('purchaseCode: $purchaseCode, ')
          ..write('traderId: $traderId, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('taxableValue: $taxableValue, ')
          ..write('cgstPercent: $cgstPercent, ')
          ..write('sgstPercent: $sgstPercent, ')
          ..write('igstPercent: $igstPercent, ')
          ..write('otherExpenses: $otherExpenses, ')
          ..write('totalAfterTax: $totalAfterTax, ')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('reversed: $reversed, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ProcurementLineItemsTableTable extends ProcurementLineItemsTable
    with
        TableInfo<$ProcurementLineItemsTableTable,
            ProcurementLineItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProcurementLineItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _purchaseIdMeta =
      const VerificationMeta('purchaseId');
  @override
  late final GeneratedColumn<int> purchaseId = GeneratedColumn<int>(
      'purchase_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES procurement (pid)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (pid)'));
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<double> qty = GeneratedColumn<double>(
      'qty', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _priceOfProductMeta =
      const VerificationMeta('priceOfProduct');
  @override
  late final GeneratedColumn<double> priceOfProduct = GeneratedColumn<double>(
      'price_of_product', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _taxableValueMeta =
      const VerificationMeta('taxableValue');
  @override
  late final GeneratedColumn<double> taxableValue = GeneratedColumn<double>(
      'taxable_value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        purchaseId,
        productId,
        productName,
        unit,
        qty,
        priceOfProduct,
        taxableValue
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'procurement_line_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProcurementLineItemsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('purchase_id')) {
      context.handle(
          _purchaseIdMeta,
          purchaseId.isAcceptableOrUnknown(
              data['purchase_id']!, _purchaseIdMeta));
    } else if (isInserting) {
      context.missing(_purchaseIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('price_of_product')) {
      context.handle(
          _priceOfProductMeta,
          priceOfProduct.isAcceptableOrUnknown(
              data['price_of_product']!, _priceOfProductMeta));
    } else if (isInserting) {
      context.missing(_priceOfProductMeta);
    }
    if (data.containsKey('taxable_value')) {
      context.handle(
          _taxableValueMeta,
          taxableValue.isAcceptableOrUnknown(
              data['taxable_value']!, _taxableValueMeta));
    } else if (isInserting) {
      context.missing(_taxableValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProcurementLineItemsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProcurementLineItemsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      purchaseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchase_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      qty: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}qty'])!,
      priceOfProduct: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}price_of_product'])!,
      taxableValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}taxable_value'])!,
    );
  }

  @override
  $ProcurementLineItemsTableTable createAlias(String alias) {
    return $ProcurementLineItemsTableTable(attachedDatabase, alias);
  }
}

class ProcurementLineItemsTableData extends DataClass
    implements Insertable<ProcurementLineItemsTableData> {
  final int id;
  final int purchaseId;
  final int productId;
  final String productName;
  final String unit;
  final double qty;
  final double priceOfProduct;
  final double taxableValue;
  const ProcurementLineItemsTableData(
      {required this.id,
      required this.purchaseId,
      required this.productId,
      required this.productName,
      required this.unit,
      required this.qty,
      required this.priceOfProduct,
      required this.taxableValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['purchase_id'] = Variable<int>(purchaseId);
    map['product_id'] = Variable<int>(productId);
    map['product_name'] = Variable<String>(productName);
    map['unit'] = Variable<String>(unit);
    map['qty'] = Variable<double>(qty);
    map['price_of_product'] = Variable<double>(priceOfProduct);
    map['taxable_value'] = Variable<double>(taxableValue);
    return map;
  }

  ProcurementLineItemsTableCompanion toCompanion(bool nullToAbsent) {
    return ProcurementLineItemsTableCompanion(
      id: Value(id),
      purchaseId: Value(purchaseId),
      productId: Value(productId),
      productName: Value(productName),
      unit: Value(unit),
      qty: Value(qty),
      priceOfProduct: Value(priceOfProduct),
      taxableValue: Value(taxableValue),
    );
  }

  factory ProcurementLineItemsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProcurementLineItemsTableData(
      id: serializer.fromJson<int>(json['id']),
      purchaseId: serializer.fromJson<int>(json['purchaseId']),
      productId: serializer.fromJson<int>(json['productId']),
      productName: serializer.fromJson<String>(json['productName']),
      unit: serializer.fromJson<String>(json['unit']),
      qty: serializer.fromJson<double>(json['qty']),
      priceOfProduct: serializer.fromJson<double>(json['priceOfProduct']),
      taxableValue: serializer.fromJson<double>(json['taxableValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'purchaseId': serializer.toJson<int>(purchaseId),
      'productId': serializer.toJson<int>(productId),
      'productName': serializer.toJson<String>(productName),
      'unit': serializer.toJson<String>(unit),
      'qty': serializer.toJson<double>(qty),
      'priceOfProduct': serializer.toJson<double>(priceOfProduct),
      'taxableValue': serializer.toJson<double>(taxableValue),
    };
  }

  ProcurementLineItemsTableData copyWith(
          {int? id,
          int? purchaseId,
          int? productId,
          String? productName,
          String? unit,
          double? qty,
          double? priceOfProduct,
          double? taxableValue}) =>
      ProcurementLineItemsTableData(
        id: id ?? this.id,
        purchaseId: purchaseId ?? this.purchaseId,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        unit: unit ?? this.unit,
        qty: qty ?? this.qty,
        priceOfProduct: priceOfProduct ?? this.priceOfProduct,
        taxableValue: taxableValue ?? this.taxableValue,
      );
  ProcurementLineItemsTableData copyWithCompanion(
      ProcurementLineItemsTableCompanion data) {
    return ProcurementLineItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      purchaseId:
          data.purchaseId.present ? data.purchaseId.value : this.purchaseId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      unit: data.unit.present ? data.unit.value : this.unit,
      qty: data.qty.present ? data.qty.value : this.qty,
      priceOfProduct: data.priceOfProduct.present
          ? data.priceOfProduct.value
          : this.priceOfProduct,
      taxableValue: data.taxableValue.present
          ? data.taxableValue.value
          : this.taxableValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProcurementLineItemsTableData(')
          ..write('id: $id, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('unit: $unit, ')
          ..write('qty: $qty, ')
          ..write('priceOfProduct: $priceOfProduct, ')
          ..write('taxableValue: $taxableValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, purchaseId, productId, productName, unit,
      qty, priceOfProduct, taxableValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProcurementLineItemsTableData &&
          other.id == this.id &&
          other.purchaseId == this.purchaseId &&
          other.productId == this.productId &&
          other.productName == this.productName &&
          other.unit == this.unit &&
          other.qty == this.qty &&
          other.priceOfProduct == this.priceOfProduct &&
          other.taxableValue == this.taxableValue);
}

class ProcurementLineItemsTableCompanion
    extends UpdateCompanion<ProcurementLineItemsTableData> {
  final Value<int> id;
  final Value<int> purchaseId;
  final Value<int> productId;
  final Value<String> productName;
  final Value<String> unit;
  final Value<double> qty;
  final Value<double> priceOfProduct;
  final Value<double> taxableValue;
  const ProcurementLineItemsTableCompanion({
    this.id = const Value.absent(),
    this.purchaseId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productName = const Value.absent(),
    this.unit = const Value.absent(),
    this.qty = const Value.absent(),
    this.priceOfProduct = const Value.absent(),
    this.taxableValue = const Value.absent(),
  });
  ProcurementLineItemsTableCompanion.insert({
    this.id = const Value.absent(),
    required int purchaseId,
    required int productId,
    required String productName,
    required String unit,
    required double qty,
    required double priceOfProduct,
    required double taxableValue,
  })  : purchaseId = Value(purchaseId),
        productId = Value(productId),
        productName = Value(productName),
        unit = Value(unit),
        qty = Value(qty),
        priceOfProduct = Value(priceOfProduct),
        taxableValue = Value(taxableValue);
  static Insertable<ProcurementLineItemsTableData> custom({
    Expression<int>? id,
    Expression<int>? purchaseId,
    Expression<int>? productId,
    Expression<String>? productName,
    Expression<String>? unit,
    Expression<double>? qty,
    Expression<double>? priceOfProduct,
    Expression<double>? taxableValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (purchaseId != null) 'purchase_id': purchaseId,
      if (productId != null) 'product_id': productId,
      if (productName != null) 'product_name': productName,
      if (unit != null) 'unit': unit,
      if (qty != null) 'qty': qty,
      if (priceOfProduct != null) 'price_of_product': priceOfProduct,
      if (taxableValue != null) 'taxable_value': taxableValue,
    });
  }

  ProcurementLineItemsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? purchaseId,
      Value<int>? productId,
      Value<String>? productName,
      Value<String>? unit,
      Value<double>? qty,
      Value<double>? priceOfProduct,
      Value<double>? taxableValue}) {
    return ProcurementLineItemsTableCompanion(
      id: id ?? this.id,
      purchaseId: purchaseId ?? this.purchaseId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      unit: unit ?? this.unit,
      qty: qty ?? this.qty,
      priceOfProduct: priceOfProduct ?? this.priceOfProduct,
      taxableValue: taxableValue ?? this.taxableValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (purchaseId.present) {
      map['purchase_id'] = Variable<int>(purchaseId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (qty.present) {
      map['qty'] = Variable<double>(qty.value);
    }
    if (priceOfProduct.present) {
      map['price_of_product'] = Variable<double>(priceOfProduct.value);
    }
    if (taxableValue.present) {
      map['taxable_value'] = Variable<double>(taxableValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProcurementLineItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('purchaseId: $purchaseId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('unit: $unit, ')
          ..write('qty: $qty, ')
          ..write('priceOfProduct: $priceOfProduct, ')
          ..write('taxableValue: $taxableValue')
          ..write(')'))
        .toString();
  }
}

class $EmployeesTableTable extends EmployeesTable
    with TableInfo<$EmployeesTableTable, EmployeesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
      'employee_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _employeeCodeMeta =
      const VerificationMeta('employeeCode');
  @override
  late final GeneratedColumn<String> employeeCode = GeneratedColumn<String>(
      'employee_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _employeeNameMeta =
      const VerificationMeta('employeeName');
  @override
  late final GeneratedColumn<String> employeeName = GeneratedColumn<String>(
      'employee_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fatherNameMeta =
      const VerificationMeta('fatherName');
  @override
  late final GeneratedColumn<String> fatherName = GeneratedColumn<String>(
      'father_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<DateTime> dob = GeneratedColumn<DateTime>(
      'dob', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateOfJoiningMeta =
      const VerificationMeta('dateOfJoining');
  @override
  late final GeneratedColumn<DateTime> dateOfJoining =
      GeneratedColumn<DateTime>('date_of_joining', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _mobNoMeta = const VerificationMeta('mobNo');
  @override
  late final GeneratedColumn<String> mobNo = GeneratedColumn<String>(
      'mob_no', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _alternateMobNoMeta =
      const VerificationMeta('alternateMobNo');
  @override
  late final GeneratedColumn<String> alternateMobNo = GeneratedColumn<String>(
      'alternate_mob_no', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pincodeMeta =
      const VerificationMeta('pincode');
  @override
  late final GeneratedColumn<String> pincode = GeneratedColumn<String>(
      'pincode', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _aadharMeta = const VerificationMeta('aadhar');
  @override
  late final GeneratedColumn<String> aadhar = GeneratedColumn<String>(
      'aadhar', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _panMeta = const VerificationMeta('pan');
  @override
  late final GeneratedColumn<String> pan = GeneratedColumn<String>(
      'pan', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String> designation = GeneratedColumn<String>(
      'designation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _departmentMeta =
      const VerificationMeta('department');
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
      'department', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Active'));
  static const VerificationMeta _salaryMeta = const VerificationMeta('salary');
  @override
  late final GeneratedColumn<double> salary = GeneratedColumn<double>(
      'salary', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _salaryTypeMeta =
      const VerificationMeta('salaryType');
  @override
  late final GeneratedColumn<String> salaryType = GeneratedColumn<String>(
      'salary_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Monthly'));
  static const VerificationMeta _bankNameMeta =
      const VerificationMeta('bankName');
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
      'bank_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bankAccountNumberMeta =
      const VerificationMeta('bankAccountNumber');
  @override
  late final GeneratedColumn<String> bankAccountNumber =
      GeneratedColumn<String>('bank_account_number', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bankIfscMeta =
      const VerificationMeta('bankIfsc');
  @override
  late final GeneratedColumn<String> bankIfsc = GeneratedColumn<String>(
      'bank_ifsc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emergencyContactNameMeta =
      const VerificationMeta('emergencyContactName');
  @override
  late final GeneratedColumn<String> emergencyContactName =
      GeneratedColumn<String>('emergency_contact_name', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emergencyContactNumberMeta =
      const VerificationMeta('emergencyContactNumber');
  @override
  late final GeneratedColumn<String> emergencyContactNumber =
      GeneratedColumn<String>('emergency_contact_number', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        employeeId,
        employeeCode,
        employeeName,
        fatherName,
        dob,
        gender,
        dateOfJoining,
        mobNo,
        alternateMobNo,
        email,
        address,
        state,
        city,
        pincode,
        aadhar,
        pan,
        designation,
        department,
        status,
        salary,
        salaryType,
        bankName,
        bankAccountNumber,
        bankIfsc,
        emergencyContactName,
        emergencyContactNumber,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employee';
  @override
  VerificationContext validateIntegrity(Insertable<EmployeesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    }
    if (data.containsKey('employee_code')) {
      context.handle(
          _employeeCodeMeta,
          employeeCode.isAcceptableOrUnknown(
              data['employee_code']!, _employeeCodeMeta));
    } else if (isInserting) {
      context.missing(_employeeCodeMeta);
    }
    if (data.containsKey('employee_name')) {
      context.handle(
          _employeeNameMeta,
          employeeName.isAcceptableOrUnknown(
              data['employee_name']!, _employeeNameMeta));
    } else if (isInserting) {
      context.missing(_employeeNameMeta);
    }
    if (data.containsKey('father_name')) {
      context.handle(
          _fatherNameMeta,
          fatherName.isAcceptableOrUnknown(
              data['father_name']!, _fatherNameMeta));
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('date_of_joining')) {
      context.handle(
          _dateOfJoiningMeta,
          dateOfJoining.isAcceptableOrUnknown(
              data['date_of_joining']!, _dateOfJoiningMeta));
    } else if (isInserting) {
      context.missing(_dateOfJoiningMeta);
    }
    if (data.containsKey('mob_no')) {
      context.handle(
          _mobNoMeta, mobNo.isAcceptableOrUnknown(data['mob_no']!, _mobNoMeta));
    } else if (isInserting) {
      context.missing(_mobNoMeta);
    }
    if (data.containsKey('alternate_mob_no')) {
      context.handle(
          _alternateMobNoMeta,
          alternateMobNo.isAcceptableOrUnknown(
              data['alternate_mob_no']!, _alternateMobNoMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('pincode')) {
      context.handle(_pincodeMeta,
          pincode.isAcceptableOrUnknown(data['pincode']!, _pincodeMeta));
    }
    if (data.containsKey('aadhar')) {
      context.handle(_aadharMeta,
          aadhar.isAcceptableOrUnknown(data['aadhar']!, _aadharMeta));
    }
    if (data.containsKey('pan')) {
      context.handle(
          _panMeta, pan.isAcceptableOrUnknown(data['pan']!, _panMeta));
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    }
    if (data.containsKey('department')) {
      context.handle(
          _departmentMeta,
          department.isAcceptableOrUnknown(
              data['department']!, _departmentMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('salary')) {
      context.handle(_salaryMeta,
          salary.isAcceptableOrUnknown(data['salary']!, _salaryMeta));
    }
    if (data.containsKey('salary_type')) {
      context.handle(
          _salaryTypeMeta,
          salaryType.isAcceptableOrUnknown(
              data['salary_type']!, _salaryTypeMeta));
    }
    if (data.containsKey('bank_name')) {
      context.handle(_bankNameMeta,
          bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta));
    }
    if (data.containsKey('bank_account_number')) {
      context.handle(
          _bankAccountNumberMeta,
          bankAccountNumber.isAcceptableOrUnknown(
              data['bank_account_number']!, _bankAccountNumberMeta));
    }
    if (data.containsKey('bank_ifsc')) {
      context.handle(_bankIfscMeta,
          bankIfsc.isAcceptableOrUnknown(data['bank_ifsc']!, _bankIfscMeta));
    }
    if (data.containsKey('emergency_contact_name')) {
      context.handle(
          _emergencyContactNameMeta,
          emergencyContactName.isAcceptableOrUnknown(
              data['emergency_contact_name']!, _emergencyContactNameMeta));
    }
    if (data.containsKey('emergency_contact_number')) {
      context.handle(
          _emergencyContactNumberMeta,
          emergencyContactNumber.isAcceptableOrUnknown(
              data['emergency_contact_number']!, _emergencyContactNumberMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {employeeId};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {mobNo},
      ];
  @override
  EmployeesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeesTableData(
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}employee_id'])!,
      employeeCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_code'])!,
      employeeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_name'])!,
      fatherName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}father_name']),
      dob: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dob']),
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender']),
      dateOfJoining: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_of_joining'])!,
      mobNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mob_no'])!,
      alternateMobNo: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}alternate_mob_no']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
      pincode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pincode']),
      aadhar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}aadhar']),
      pan: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pan']),
      designation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}designation']),
      department: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}department']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      salary: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}salary'])!,
      salaryType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}salary_type'])!,
      bankName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank_name']),
      bankAccountNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}bank_account_number']),
      bankIfsc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank_ifsc']),
      emergencyContactName: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}emergency_contact_name']),
      emergencyContactNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}emergency_contact_number']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $EmployeesTableTable createAlias(String alias) {
    return $EmployeesTableTable(attachedDatabase, alias);
  }
}

class EmployeesTableData extends DataClass
    implements Insertable<EmployeesTableData> {
  final int employeeId;
  final String employeeCode;
  final String employeeName;
  final String? fatherName;
  final DateTime? dob;
  final String? gender;
  final DateTime dateOfJoining;
  final String mobNo;
  final String? alternateMobNo;
  final String? email;
  final String? address;
  final String? state;
  final String? city;
  final String? pincode;
  final String? aadhar;
  final String? pan;
  final String? designation;
  final String? department;
  final String status;
  final double salary;
  final String salaryType;
  final String? bankName;
  final String? bankAccountNumber;
  final String? bankIfsc;
  final String? emergencyContactName;
  final String? emergencyContactNumber;
  final DateTime createdAt;
  const EmployeesTableData(
      {required this.employeeId,
      required this.employeeCode,
      required this.employeeName,
      this.fatherName,
      this.dob,
      this.gender,
      required this.dateOfJoining,
      required this.mobNo,
      this.alternateMobNo,
      this.email,
      this.address,
      this.state,
      this.city,
      this.pincode,
      this.aadhar,
      this.pan,
      this.designation,
      this.department,
      required this.status,
      required this.salary,
      required this.salaryType,
      this.bankName,
      this.bankAccountNumber,
      this.bankIfsc,
      this.emergencyContactName,
      this.emergencyContactNumber,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['employee_id'] = Variable<int>(employeeId);
    map['employee_code'] = Variable<String>(employeeCode);
    map['employee_name'] = Variable<String>(employeeName);
    if (!nullToAbsent || fatherName != null) {
      map['father_name'] = Variable<String>(fatherName);
    }
    if (!nullToAbsent || dob != null) {
      map['dob'] = Variable<DateTime>(dob);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    map['date_of_joining'] = Variable<DateTime>(dateOfJoining);
    map['mob_no'] = Variable<String>(mobNo);
    if (!nullToAbsent || alternateMobNo != null) {
      map['alternate_mob_no'] = Variable<String>(alternateMobNo);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    if (!nullToAbsent || pincode != null) {
      map['pincode'] = Variable<String>(pincode);
    }
    if (!nullToAbsent || aadhar != null) {
      map['aadhar'] = Variable<String>(aadhar);
    }
    if (!nullToAbsent || pan != null) {
      map['pan'] = Variable<String>(pan);
    }
    if (!nullToAbsent || designation != null) {
      map['designation'] = Variable<String>(designation);
    }
    if (!nullToAbsent || department != null) {
      map['department'] = Variable<String>(department);
    }
    map['status'] = Variable<String>(status);
    map['salary'] = Variable<double>(salary);
    map['salary_type'] = Variable<String>(salaryType);
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    if (!nullToAbsent || bankAccountNumber != null) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber);
    }
    if (!nullToAbsent || bankIfsc != null) {
      map['bank_ifsc'] = Variable<String>(bankIfsc);
    }
    if (!nullToAbsent || emergencyContactName != null) {
      map['emergency_contact_name'] = Variable<String>(emergencyContactName);
    }
    if (!nullToAbsent || emergencyContactNumber != null) {
      map['emergency_contact_number'] =
          Variable<String>(emergencyContactNumber);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  EmployeesTableCompanion toCompanion(bool nullToAbsent) {
    return EmployeesTableCompanion(
      employeeId: Value(employeeId),
      employeeCode: Value(employeeCode),
      employeeName: Value(employeeName),
      fatherName: fatherName == null && nullToAbsent
          ? const Value.absent()
          : Value(fatherName),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      dateOfJoining: Value(dateOfJoining),
      mobNo: Value(mobNo),
      alternateMobNo: alternateMobNo == null && nullToAbsent
          ? const Value.absent()
          : Value(alternateMobNo),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      pincode: pincode == null && nullToAbsent
          ? const Value.absent()
          : Value(pincode),
      aadhar:
          aadhar == null && nullToAbsent ? const Value.absent() : Value(aadhar),
      pan: pan == null && nullToAbsent ? const Value.absent() : Value(pan),
      designation: designation == null && nullToAbsent
          ? const Value.absent()
          : Value(designation),
      department: department == null && nullToAbsent
          ? const Value.absent()
          : Value(department),
      status: Value(status),
      salary: Value(salary),
      salaryType: Value(salaryType),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      bankAccountNumber: bankAccountNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(bankAccountNumber),
      bankIfsc: bankIfsc == null && nullToAbsent
          ? const Value.absent()
          : Value(bankIfsc),
      emergencyContactName: emergencyContactName == null && nullToAbsent
          ? const Value.absent()
          : Value(emergencyContactName),
      emergencyContactNumber: emergencyContactNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(emergencyContactNumber),
      createdAt: Value(createdAt),
    );
  }

  factory EmployeesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeesTableData(
      employeeId: serializer.fromJson<int>(json['employeeId']),
      employeeCode: serializer.fromJson<String>(json['employeeCode']),
      employeeName: serializer.fromJson<String>(json['employeeName']),
      fatherName: serializer.fromJson<String?>(json['fatherName']),
      dob: serializer.fromJson<DateTime?>(json['dob']),
      gender: serializer.fromJson<String?>(json['gender']),
      dateOfJoining: serializer.fromJson<DateTime>(json['dateOfJoining']),
      mobNo: serializer.fromJson<String>(json['mobNo']),
      alternateMobNo: serializer.fromJson<String?>(json['alternateMobNo']),
      email: serializer.fromJson<String?>(json['email']),
      address: serializer.fromJson<String?>(json['address']),
      state: serializer.fromJson<String?>(json['state']),
      city: serializer.fromJson<String?>(json['city']),
      pincode: serializer.fromJson<String?>(json['pincode']),
      aadhar: serializer.fromJson<String?>(json['aadhar']),
      pan: serializer.fromJson<String?>(json['pan']),
      designation: serializer.fromJson<String?>(json['designation']),
      department: serializer.fromJson<String?>(json['department']),
      status: serializer.fromJson<String>(json['status']),
      salary: serializer.fromJson<double>(json['salary']),
      salaryType: serializer.fromJson<String>(json['salaryType']),
      bankName: serializer.fromJson<String?>(json['bankName']),
      bankAccountNumber:
          serializer.fromJson<String?>(json['bankAccountNumber']),
      bankIfsc: serializer.fromJson<String?>(json['bankIfsc']),
      emergencyContactName:
          serializer.fromJson<String?>(json['emergencyContactName']),
      emergencyContactNumber:
          serializer.fromJson<String?>(json['emergencyContactNumber']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'employeeId': serializer.toJson<int>(employeeId),
      'employeeCode': serializer.toJson<String>(employeeCode),
      'employeeName': serializer.toJson<String>(employeeName),
      'fatherName': serializer.toJson<String?>(fatherName),
      'dob': serializer.toJson<DateTime?>(dob),
      'gender': serializer.toJson<String?>(gender),
      'dateOfJoining': serializer.toJson<DateTime>(dateOfJoining),
      'mobNo': serializer.toJson<String>(mobNo),
      'alternateMobNo': serializer.toJson<String?>(alternateMobNo),
      'email': serializer.toJson<String?>(email),
      'address': serializer.toJson<String?>(address),
      'state': serializer.toJson<String?>(state),
      'city': serializer.toJson<String?>(city),
      'pincode': serializer.toJson<String?>(pincode),
      'aadhar': serializer.toJson<String?>(aadhar),
      'pan': serializer.toJson<String?>(pan),
      'designation': serializer.toJson<String?>(designation),
      'department': serializer.toJson<String?>(department),
      'status': serializer.toJson<String>(status),
      'salary': serializer.toJson<double>(salary),
      'salaryType': serializer.toJson<String>(salaryType),
      'bankName': serializer.toJson<String?>(bankName),
      'bankAccountNumber': serializer.toJson<String?>(bankAccountNumber),
      'bankIfsc': serializer.toJson<String?>(bankIfsc),
      'emergencyContactName': serializer.toJson<String?>(emergencyContactName),
      'emergencyContactNumber':
          serializer.toJson<String?>(emergencyContactNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  EmployeesTableData copyWith(
          {int? employeeId,
          String? employeeCode,
          String? employeeName,
          Value<String?> fatherName = const Value.absent(),
          Value<DateTime?> dob = const Value.absent(),
          Value<String?> gender = const Value.absent(),
          DateTime? dateOfJoining,
          String? mobNo,
          Value<String?> alternateMobNo = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> state = const Value.absent(),
          Value<String?> city = const Value.absent(),
          Value<String?> pincode = const Value.absent(),
          Value<String?> aadhar = const Value.absent(),
          Value<String?> pan = const Value.absent(),
          Value<String?> designation = const Value.absent(),
          Value<String?> department = const Value.absent(),
          String? status,
          double? salary,
          String? salaryType,
          Value<String?> bankName = const Value.absent(),
          Value<String?> bankAccountNumber = const Value.absent(),
          Value<String?> bankIfsc = const Value.absent(),
          Value<String?> emergencyContactName = const Value.absent(),
          Value<String?> emergencyContactNumber = const Value.absent(),
          DateTime? createdAt}) =>
      EmployeesTableData(
        employeeId: employeeId ?? this.employeeId,
        employeeCode: employeeCode ?? this.employeeCode,
        employeeName: employeeName ?? this.employeeName,
        fatherName: fatherName.present ? fatherName.value : this.fatherName,
        dob: dob.present ? dob.value : this.dob,
        gender: gender.present ? gender.value : this.gender,
        dateOfJoining: dateOfJoining ?? this.dateOfJoining,
        mobNo: mobNo ?? this.mobNo,
        alternateMobNo:
            alternateMobNo.present ? alternateMobNo.value : this.alternateMobNo,
        email: email.present ? email.value : this.email,
        address: address.present ? address.value : this.address,
        state: state.present ? state.value : this.state,
        city: city.present ? city.value : this.city,
        pincode: pincode.present ? pincode.value : this.pincode,
        aadhar: aadhar.present ? aadhar.value : this.aadhar,
        pan: pan.present ? pan.value : this.pan,
        designation: designation.present ? designation.value : this.designation,
        department: department.present ? department.value : this.department,
        status: status ?? this.status,
        salary: salary ?? this.salary,
        salaryType: salaryType ?? this.salaryType,
        bankName: bankName.present ? bankName.value : this.bankName,
        bankAccountNumber: bankAccountNumber.present
            ? bankAccountNumber.value
            : this.bankAccountNumber,
        bankIfsc: bankIfsc.present ? bankIfsc.value : this.bankIfsc,
        emergencyContactName: emergencyContactName.present
            ? emergencyContactName.value
            : this.emergencyContactName,
        emergencyContactNumber: emergencyContactNumber.present
            ? emergencyContactNumber.value
            : this.emergencyContactNumber,
        createdAt: createdAt ?? this.createdAt,
      );
  EmployeesTableData copyWithCompanion(EmployeesTableCompanion data) {
    return EmployeesTableData(
      employeeId:
          data.employeeId.present ? data.employeeId.value : this.employeeId,
      employeeCode: data.employeeCode.present
          ? data.employeeCode.value
          : this.employeeCode,
      employeeName: data.employeeName.present
          ? data.employeeName.value
          : this.employeeName,
      fatherName:
          data.fatherName.present ? data.fatherName.value : this.fatherName,
      dob: data.dob.present ? data.dob.value : this.dob,
      gender: data.gender.present ? data.gender.value : this.gender,
      dateOfJoining: data.dateOfJoining.present
          ? data.dateOfJoining.value
          : this.dateOfJoining,
      mobNo: data.mobNo.present ? data.mobNo.value : this.mobNo,
      alternateMobNo: data.alternateMobNo.present
          ? data.alternateMobNo.value
          : this.alternateMobNo,
      email: data.email.present ? data.email.value : this.email,
      address: data.address.present ? data.address.value : this.address,
      state: data.state.present ? data.state.value : this.state,
      city: data.city.present ? data.city.value : this.city,
      pincode: data.pincode.present ? data.pincode.value : this.pincode,
      aadhar: data.aadhar.present ? data.aadhar.value : this.aadhar,
      pan: data.pan.present ? data.pan.value : this.pan,
      designation:
          data.designation.present ? data.designation.value : this.designation,
      department:
          data.department.present ? data.department.value : this.department,
      status: data.status.present ? data.status.value : this.status,
      salary: data.salary.present ? data.salary.value : this.salary,
      salaryType:
          data.salaryType.present ? data.salaryType.value : this.salaryType,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      bankAccountNumber: data.bankAccountNumber.present
          ? data.bankAccountNumber.value
          : this.bankAccountNumber,
      bankIfsc: data.bankIfsc.present ? data.bankIfsc.value : this.bankIfsc,
      emergencyContactName: data.emergencyContactName.present
          ? data.emergencyContactName.value
          : this.emergencyContactName,
      emergencyContactNumber: data.emergencyContactNumber.present
          ? data.emergencyContactNumber.value
          : this.emergencyContactNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmployeesTableData(')
          ..write('employeeId: $employeeId, ')
          ..write('employeeCode: $employeeCode, ')
          ..write('employeeName: $employeeName, ')
          ..write('fatherName: $fatherName, ')
          ..write('dob: $dob, ')
          ..write('gender: $gender, ')
          ..write('dateOfJoining: $dateOfJoining, ')
          ..write('mobNo: $mobNo, ')
          ..write('alternateMobNo: $alternateMobNo, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('state: $state, ')
          ..write('city: $city, ')
          ..write('pincode: $pincode, ')
          ..write('aadhar: $aadhar, ')
          ..write('pan: $pan, ')
          ..write('designation: $designation, ')
          ..write('department: $department, ')
          ..write('status: $status, ')
          ..write('salary: $salary, ')
          ..write('salaryType: $salaryType, ')
          ..write('bankName: $bankName, ')
          ..write('bankAccountNumber: $bankAccountNumber, ')
          ..write('bankIfsc: $bankIfsc, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactNumber: $emergencyContactNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        employeeId,
        employeeCode,
        employeeName,
        fatherName,
        dob,
        gender,
        dateOfJoining,
        mobNo,
        alternateMobNo,
        email,
        address,
        state,
        city,
        pincode,
        aadhar,
        pan,
        designation,
        department,
        status,
        salary,
        salaryType,
        bankName,
        bankAccountNumber,
        bankIfsc,
        emergencyContactName,
        emergencyContactNumber,
        createdAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeesTableData &&
          other.employeeId == this.employeeId &&
          other.employeeCode == this.employeeCode &&
          other.employeeName == this.employeeName &&
          other.fatherName == this.fatherName &&
          other.dob == this.dob &&
          other.gender == this.gender &&
          other.dateOfJoining == this.dateOfJoining &&
          other.mobNo == this.mobNo &&
          other.alternateMobNo == this.alternateMobNo &&
          other.email == this.email &&
          other.address == this.address &&
          other.state == this.state &&
          other.city == this.city &&
          other.pincode == this.pincode &&
          other.aadhar == this.aadhar &&
          other.pan == this.pan &&
          other.designation == this.designation &&
          other.department == this.department &&
          other.status == this.status &&
          other.salary == this.salary &&
          other.salaryType == this.salaryType &&
          other.bankName == this.bankName &&
          other.bankAccountNumber == this.bankAccountNumber &&
          other.bankIfsc == this.bankIfsc &&
          other.emergencyContactName == this.emergencyContactName &&
          other.emergencyContactNumber == this.emergencyContactNumber &&
          other.createdAt == this.createdAt);
}

class EmployeesTableCompanion extends UpdateCompanion<EmployeesTableData> {
  final Value<int> employeeId;
  final Value<String> employeeCode;
  final Value<String> employeeName;
  final Value<String?> fatherName;
  final Value<DateTime?> dob;
  final Value<String?> gender;
  final Value<DateTime> dateOfJoining;
  final Value<String> mobNo;
  final Value<String?> alternateMobNo;
  final Value<String?> email;
  final Value<String?> address;
  final Value<String?> state;
  final Value<String?> city;
  final Value<String?> pincode;
  final Value<String?> aadhar;
  final Value<String?> pan;
  final Value<String?> designation;
  final Value<String?> department;
  final Value<String> status;
  final Value<double> salary;
  final Value<String> salaryType;
  final Value<String?> bankName;
  final Value<String?> bankAccountNumber;
  final Value<String?> bankIfsc;
  final Value<String?> emergencyContactName;
  final Value<String?> emergencyContactNumber;
  final Value<DateTime> createdAt;
  const EmployeesTableCompanion({
    this.employeeId = const Value.absent(),
    this.employeeCode = const Value.absent(),
    this.employeeName = const Value.absent(),
    this.fatherName = const Value.absent(),
    this.dob = const Value.absent(),
    this.gender = const Value.absent(),
    this.dateOfJoining = const Value.absent(),
    this.mobNo = const Value.absent(),
    this.alternateMobNo = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.state = const Value.absent(),
    this.city = const Value.absent(),
    this.pincode = const Value.absent(),
    this.aadhar = const Value.absent(),
    this.pan = const Value.absent(),
    this.designation = const Value.absent(),
    this.department = const Value.absent(),
    this.status = const Value.absent(),
    this.salary = const Value.absent(),
    this.salaryType = const Value.absent(),
    this.bankName = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
    this.bankIfsc = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  EmployeesTableCompanion.insert({
    this.employeeId = const Value.absent(),
    required String employeeCode,
    required String employeeName,
    this.fatherName = const Value.absent(),
    this.dob = const Value.absent(),
    this.gender = const Value.absent(),
    required DateTime dateOfJoining,
    required String mobNo,
    this.alternateMobNo = const Value.absent(),
    this.email = const Value.absent(),
    this.address = const Value.absent(),
    this.state = const Value.absent(),
    this.city = const Value.absent(),
    this.pincode = const Value.absent(),
    this.aadhar = const Value.absent(),
    this.pan = const Value.absent(),
    this.designation = const Value.absent(),
    this.department = const Value.absent(),
    this.status = const Value.absent(),
    this.salary = const Value.absent(),
    this.salaryType = const Value.absent(),
    this.bankName = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
    this.bankIfsc = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : employeeCode = Value(employeeCode),
        employeeName = Value(employeeName),
        dateOfJoining = Value(dateOfJoining),
        mobNo = Value(mobNo);
  static Insertable<EmployeesTableData> custom({
    Expression<int>? employeeId,
    Expression<String>? employeeCode,
    Expression<String>? employeeName,
    Expression<String>? fatherName,
    Expression<DateTime>? dob,
    Expression<String>? gender,
    Expression<DateTime>? dateOfJoining,
    Expression<String>? mobNo,
    Expression<String>? alternateMobNo,
    Expression<String>? email,
    Expression<String>? address,
    Expression<String>? state,
    Expression<String>? city,
    Expression<String>? pincode,
    Expression<String>? aadhar,
    Expression<String>? pan,
    Expression<String>? designation,
    Expression<String>? department,
    Expression<String>? status,
    Expression<double>? salary,
    Expression<String>? salaryType,
    Expression<String>? bankName,
    Expression<String>? bankAccountNumber,
    Expression<String>? bankIfsc,
    Expression<String>? emergencyContactName,
    Expression<String>? emergencyContactNumber,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (employeeId != null) 'employee_id': employeeId,
      if (employeeCode != null) 'employee_code': employeeCode,
      if (employeeName != null) 'employee_name': employeeName,
      if (fatherName != null) 'father_name': fatherName,
      if (dob != null) 'dob': dob,
      if (gender != null) 'gender': gender,
      if (dateOfJoining != null) 'date_of_joining': dateOfJoining,
      if (mobNo != null) 'mob_no': mobNo,
      if (alternateMobNo != null) 'alternate_mob_no': alternateMobNo,
      if (email != null) 'email': email,
      if (address != null) 'address': address,
      if (state != null) 'state': state,
      if (city != null) 'city': city,
      if (pincode != null) 'pincode': pincode,
      if (aadhar != null) 'aadhar': aadhar,
      if (pan != null) 'pan': pan,
      if (designation != null) 'designation': designation,
      if (department != null) 'department': department,
      if (status != null) 'status': status,
      if (salary != null) 'salary': salary,
      if (salaryType != null) 'salary_type': salaryType,
      if (bankName != null) 'bank_name': bankName,
      if (bankAccountNumber != null) 'bank_account_number': bankAccountNumber,
      if (bankIfsc != null) 'bank_ifsc': bankIfsc,
      if (emergencyContactName != null)
        'emergency_contact_name': emergencyContactName,
      if (emergencyContactNumber != null)
        'emergency_contact_number': emergencyContactNumber,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  EmployeesTableCompanion copyWith(
      {Value<int>? employeeId,
      Value<String>? employeeCode,
      Value<String>? employeeName,
      Value<String?>? fatherName,
      Value<DateTime?>? dob,
      Value<String?>? gender,
      Value<DateTime>? dateOfJoining,
      Value<String>? mobNo,
      Value<String?>? alternateMobNo,
      Value<String?>? email,
      Value<String?>? address,
      Value<String?>? state,
      Value<String?>? city,
      Value<String?>? pincode,
      Value<String?>? aadhar,
      Value<String?>? pan,
      Value<String?>? designation,
      Value<String?>? department,
      Value<String>? status,
      Value<double>? salary,
      Value<String>? salaryType,
      Value<String?>? bankName,
      Value<String?>? bankAccountNumber,
      Value<String?>? bankIfsc,
      Value<String?>? emergencyContactName,
      Value<String?>? emergencyContactNumber,
      Value<DateTime>? createdAt}) {
    return EmployeesTableCompanion(
      employeeId: employeeId ?? this.employeeId,
      employeeCode: employeeCode ?? this.employeeCode,
      employeeName: employeeName ?? this.employeeName,
      fatherName: fatherName ?? this.fatherName,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      dateOfJoining: dateOfJoining ?? this.dateOfJoining,
      mobNo: mobNo ?? this.mobNo,
      alternateMobNo: alternateMobNo ?? this.alternateMobNo,
      email: email ?? this.email,
      address: address ?? this.address,
      state: state ?? this.state,
      city: city ?? this.city,
      pincode: pincode ?? this.pincode,
      aadhar: aadhar ?? this.aadhar,
      pan: pan ?? this.pan,
      designation: designation ?? this.designation,
      department: department ?? this.department,
      status: status ?? this.status,
      salary: salary ?? this.salary,
      salaryType: salaryType ?? this.salaryType,
      bankName: bankName ?? this.bankName,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      bankIfsc: bankIfsc ?? this.bankIfsc,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactNumber:
          emergencyContactNumber ?? this.emergencyContactNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (employeeCode.present) {
      map['employee_code'] = Variable<String>(employeeCode.value);
    }
    if (employeeName.present) {
      map['employee_name'] = Variable<String>(employeeName.value);
    }
    if (fatherName.present) {
      map['father_name'] = Variable<String>(fatherName.value);
    }
    if (dob.present) {
      map['dob'] = Variable<DateTime>(dob.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (dateOfJoining.present) {
      map['date_of_joining'] = Variable<DateTime>(dateOfJoining.value);
    }
    if (mobNo.present) {
      map['mob_no'] = Variable<String>(mobNo.value);
    }
    if (alternateMobNo.present) {
      map['alternate_mob_no'] = Variable<String>(alternateMobNo.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (pincode.present) {
      map['pincode'] = Variable<String>(pincode.value);
    }
    if (aadhar.present) {
      map['aadhar'] = Variable<String>(aadhar.value);
    }
    if (pan.present) {
      map['pan'] = Variable<String>(pan.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String>(designation.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (salary.present) {
      map['salary'] = Variable<double>(salary.value);
    }
    if (salaryType.present) {
      map['salary_type'] = Variable<String>(salaryType.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (bankAccountNumber.present) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber.value);
    }
    if (bankIfsc.present) {
      map['bank_ifsc'] = Variable<String>(bankIfsc.value);
    }
    if (emergencyContactName.present) {
      map['emergency_contact_name'] =
          Variable<String>(emergencyContactName.value);
    }
    if (emergencyContactNumber.present) {
      map['emergency_contact_number'] =
          Variable<String>(emergencyContactNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeesTableCompanion(')
          ..write('employeeId: $employeeId, ')
          ..write('employeeCode: $employeeCode, ')
          ..write('employeeName: $employeeName, ')
          ..write('fatherName: $fatherName, ')
          ..write('dob: $dob, ')
          ..write('gender: $gender, ')
          ..write('dateOfJoining: $dateOfJoining, ')
          ..write('mobNo: $mobNo, ')
          ..write('alternateMobNo: $alternateMobNo, ')
          ..write('email: $email, ')
          ..write('address: $address, ')
          ..write('state: $state, ')
          ..write('city: $city, ')
          ..write('pincode: $pincode, ')
          ..write('aadhar: $aadhar, ')
          ..write('pan: $pan, ')
          ..write('designation: $designation, ')
          ..write('department: $department, ')
          ..write('status: $status, ')
          ..write('salary: $salary, ')
          ..write('salaryType: $salaryType, ')
          ..write('bankName: $bankName, ')
          ..write('bankAccountNumber: $bankAccountNumber, ')
          ..write('bankIfsc: $bankIfsc, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactNumber: $emergencyContactNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AttendanceTableTable extends AttendanceTable
    with TableInfo<$AttendanceTableTable, AttendanceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES employee (employee_id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, employeeId, date, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance';
  @override
  VerificationContext validateIntegrity(
      Insertable<AttendanceTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {employeeId, date},
      ];
  @override
  AttendanceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}employee_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $AttendanceTableTable createAlias(String alias) {
    return $AttendanceTableTable(attachedDatabase, alias);
  }
}

class AttendanceTableData extends DataClass
    implements Insertable<AttendanceTableData> {
  final int id;
  final int employeeId;
  final DateTime date;
  final String status;
  const AttendanceTableData(
      {required this.id,
      required this.employeeId,
      required this.date,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['employee_id'] = Variable<int>(employeeId);
    map['date'] = Variable<DateTime>(date);
    map['status'] = Variable<String>(status);
    return map;
  }

  AttendanceTableCompanion toCompanion(bool nullToAbsent) {
    return AttendanceTableCompanion(
      id: Value(id),
      employeeId: Value(employeeId),
      date: Value(date),
      status: Value(status),
    );
  }

  factory AttendanceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceTableData(
      id: serializer.fromJson<int>(json['id']),
      employeeId: serializer.fromJson<int>(json['employeeId']),
      date: serializer.fromJson<DateTime>(json['date']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'employeeId': serializer.toJson<int>(employeeId),
      'date': serializer.toJson<DateTime>(date),
      'status': serializer.toJson<String>(status),
    };
  }

  AttendanceTableData copyWith(
          {int? id, int? employeeId, DateTime? date, String? status}) =>
      AttendanceTableData(
        id: id ?? this.id,
        employeeId: employeeId ?? this.employeeId,
        date: date ?? this.date,
        status: status ?? this.status,
      );
  AttendanceTableData copyWithCompanion(AttendanceTableCompanion data) {
    return AttendanceTableData(
      id: data.id.present ? data.id.value : this.id,
      employeeId:
          data.employeeId.present ? data.employeeId.value : this.employeeId,
      date: data.date.present ? data.date.value : this.date,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceTableData(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('date: $date, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, employeeId, date, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceTableData &&
          other.id == this.id &&
          other.employeeId == this.employeeId &&
          other.date == this.date &&
          other.status == this.status);
}

class AttendanceTableCompanion extends UpdateCompanion<AttendanceTableData> {
  final Value<int> id;
  final Value<int> employeeId;
  final Value<DateTime> date;
  final Value<String> status;
  const AttendanceTableCompanion({
    this.id = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
  });
  AttendanceTableCompanion.insert({
    this.id = const Value.absent(),
    required int employeeId,
    required DateTime date,
    required String status,
  })  : employeeId = Value(employeeId),
        date = Value(date),
        status = Value(status);
  static Insertable<AttendanceTableData> custom({
    Expression<int>? id,
    Expression<int>? employeeId,
    Expression<DateTime>? date,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (employeeId != null) 'employee_id': employeeId,
      if (date != null) 'date': date,
      if (status != null) 'status': status,
    });
  }

  AttendanceTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? employeeId,
      Value<DateTime>? date,
      Value<String>? status}) {
    return AttendanceTableCompanion(
      id: id ?? this.id,
      employeeId: employeeId ?? this.employeeId,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceTableCompanion(')
          ..write('id: $id, ')
          ..write('employeeId: $employeeId, ')
          ..write('date: $date, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $EmployeePaymentsTableTable extends EmployeePaymentsTable
    with TableInfo<$EmployeePaymentsTableTable, EmployeePaymentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeePaymentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _paymentIdMeta =
      const VerificationMeta('paymentId');
  @override
  late final GeneratedColumn<int> paymentId = GeneratedColumn<int>(
      'payment_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES employee (employee_id)'));
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _journalEntryIdMeta =
      const VerificationMeta('journalEntryId');
  @override
  late final GeneratedColumn<int> journalEntryId = GeneratedColumn<int>(
      'journal_entry_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [paymentId, employeeId, paymentDate, amount, journalEntryId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employee_salary_payments';
  @override
  VerificationContext validateIntegrity(
      Insertable<EmployeePaymentsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('payment_id')) {
      context.handle(_paymentIdMeta,
          paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta));
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    } else if (isInserting) {
      context.missing(_paymentDateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('journal_entry_id')) {
      context.handle(
          _journalEntryIdMeta,
          journalEntryId.isAcceptableOrUnknown(
              data['journal_entry_id']!, _journalEntryIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {paymentId};
  @override
  EmployeePaymentsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeePaymentsTableData(
      paymentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}payment_id'])!,
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}employee_id'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      journalEntryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}journal_entry_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $EmployeePaymentsTableTable createAlias(String alias) {
    return $EmployeePaymentsTableTable(attachedDatabase, alias);
  }
}

class EmployeePaymentsTableData extends DataClass
    implements Insertable<EmployeePaymentsTableData> {
  final int paymentId;
  final int employeeId;
  final DateTime paymentDate;
  final int amount;
  final int? journalEntryId;
  final DateTime createdAt;
  const EmployeePaymentsTableData(
      {required this.paymentId,
      required this.employeeId,
      required this.paymentDate,
      required this.amount,
      this.journalEntryId,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['payment_id'] = Variable<int>(paymentId);
    map['employee_id'] = Variable<int>(employeeId);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || journalEntryId != null) {
      map['journal_entry_id'] = Variable<int>(journalEntryId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  EmployeePaymentsTableCompanion toCompanion(bool nullToAbsent) {
    return EmployeePaymentsTableCompanion(
      paymentId: Value(paymentId),
      employeeId: Value(employeeId),
      paymentDate: Value(paymentDate),
      amount: Value(amount),
      journalEntryId: journalEntryId == null && nullToAbsent
          ? const Value.absent()
          : Value(journalEntryId),
      createdAt: Value(createdAt),
    );
  }

  factory EmployeePaymentsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeePaymentsTableData(
      paymentId: serializer.fromJson<int>(json['paymentId']),
      employeeId: serializer.fromJson<int>(json['employeeId']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      amount: serializer.fromJson<int>(json['amount']),
      journalEntryId: serializer.fromJson<int?>(json['journalEntryId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'paymentId': serializer.toJson<int>(paymentId),
      'employeeId': serializer.toJson<int>(employeeId),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'amount': serializer.toJson<int>(amount),
      'journalEntryId': serializer.toJson<int?>(journalEntryId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  EmployeePaymentsTableData copyWith(
          {int? paymentId,
          int? employeeId,
          DateTime? paymentDate,
          int? amount,
          Value<int?> journalEntryId = const Value.absent(),
          DateTime? createdAt}) =>
      EmployeePaymentsTableData(
        paymentId: paymentId ?? this.paymentId,
        employeeId: employeeId ?? this.employeeId,
        paymentDate: paymentDate ?? this.paymentDate,
        amount: amount ?? this.amount,
        journalEntryId:
            journalEntryId.present ? journalEntryId.value : this.journalEntryId,
        createdAt: createdAt ?? this.createdAt,
      );
  EmployeePaymentsTableData copyWithCompanion(
      EmployeePaymentsTableCompanion data) {
    return EmployeePaymentsTableData(
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      employeeId:
          data.employeeId.present ? data.employeeId.value : this.employeeId,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      amount: data.amount.present ? data.amount.value : this.amount,
      journalEntryId: data.journalEntryId.present
          ? data.journalEntryId.value
          : this.journalEntryId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmployeePaymentsTableData(')
          ..write('paymentId: $paymentId, ')
          ..write('employeeId: $employeeId, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('amount: $amount, ')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      paymentId, employeeId, paymentDate, amount, journalEntryId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeePaymentsTableData &&
          other.paymentId == this.paymentId &&
          other.employeeId == this.employeeId &&
          other.paymentDate == this.paymentDate &&
          other.amount == this.amount &&
          other.journalEntryId == this.journalEntryId &&
          other.createdAt == this.createdAt);
}

class EmployeePaymentsTableCompanion
    extends UpdateCompanion<EmployeePaymentsTableData> {
  final Value<int> paymentId;
  final Value<int> employeeId;
  final Value<DateTime> paymentDate;
  final Value<int> amount;
  final Value<int?> journalEntryId;
  final Value<DateTime> createdAt;
  const EmployeePaymentsTableCompanion({
    this.paymentId = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.amount = const Value.absent(),
    this.journalEntryId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  EmployeePaymentsTableCompanion.insert({
    this.paymentId = const Value.absent(),
    required int employeeId,
    required DateTime paymentDate,
    required int amount,
    this.journalEntryId = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : employeeId = Value(employeeId),
        paymentDate = Value(paymentDate),
        amount = Value(amount);
  static Insertable<EmployeePaymentsTableData> custom({
    Expression<int>? paymentId,
    Expression<int>? employeeId,
    Expression<DateTime>? paymentDate,
    Expression<int>? amount,
    Expression<int>? journalEntryId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (paymentId != null) 'payment_id': paymentId,
      if (employeeId != null) 'employee_id': employeeId,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (amount != null) 'amount': amount,
      if (journalEntryId != null) 'journal_entry_id': journalEntryId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  EmployeePaymentsTableCompanion copyWith(
      {Value<int>? paymentId,
      Value<int>? employeeId,
      Value<DateTime>? paymentDate,
      Value<int>? amount,
      Value<int?>? journalEntryId,
      Value<DateTime>? createdAt}) {
    return EmployeePaymentsTableCompanion(
      paymentId: paymentId ?? this.paymentId,
      employeeId: employeeId ?? this.employeeId,
      paymentDate: paymentDate ?? this.paymentDate,
      amount: amount ?? this.amount,
      journalEntryId: journalEntryId ?? this.journalEntryId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (paymentId.present) {
      map['payment_id'] = Variable<int>(paymentId.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (journalEntryId.present) {
      map['journal_entry_id'] = Variable<int>(journalEntryId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeePaymentsTableCompanion(')
          ..write('paymentId: $paymentId, ')
          ..write('employeeId: $employeeId, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('amount: $amount, ')
          ..write('journalEntryId: $journalEntryId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $WorkTypesTableTable extends WorkTypesTable
    with TableInfo<$WorkTypesTableTable, WorkTypesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkTypesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Active'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, status, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'work_types';
  @override
  VerificationContext validateIntegrity(Insertable<WorkTypesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkTypesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkTypesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $WorkTypesTableTable createAlias(String alias) {
    return $WorkTypesTableTable(attachedDatabase, alias);
  }
}

class WorkTypesTableData extends DataClass
    implements Insertable<WorkTypesTableData> {
  final int id;
  final String name;
  final String status;
  final DateTime createdAt;
  const WorkTypesTableData(
      {required this.id,
      required this.name,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WorkTypesTableCompanion toCompanion(bool nullToAbsent) {
    return WorkTypesTableCompanion(
      id: Value(id),
      name: Value(name),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory WorkTypesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkTypesTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  WorkTypesTableData copyWith(
          {int? id, String? name, String? status, DateTime? createdAt}) =>
      WorkTypesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  WorkTypesTableData copyWithCompanion(WorkTypesTableCompanion data) {
    return WorkTypesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkTypesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkTypesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class WorkTypesTableCompanion extends UpdateCompanion<WorkTypesTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const WorkTypesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  WorkTypesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<WorkTypesTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  WorkTypesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? status,
      Value<DateTime>? createdAt}) {
    return WorkTypesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkTypesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $KarigarProductsTableTable extends KarigarProductsTable
    with TableInfo<$KarigarProductsTableTable, KarigarProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KarigarProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _workTypeIdMeta =
      const VerificationMeta('workTypeId');
  @override
  late final GeneratedColumn<int> workTypeId = GeneratedColumn<int>(
      'work_type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES work_types (id)'));
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitsMeta = const VerificationMeta('units');
  @override
  late final GeneratedColumn<String> units = GeneratedColumn<String>(
      'units', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Active'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, workTypeId, productName, units, status, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'karigar_products';
  @override
  VerificationContext validateIntegrity(
      Insertable<KarigarProductsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('work_type_id')) {
      context.handle(
          _workTypeIdMeta,
          workTypeId.isAcceptableOrUnknown(
              data['work_type_id']!, _workTypeIdMeta));
    } else if (isInserting) {
      context.missing(_workTypeIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('units')) {
      context.handle(
          _unitsMeta, units.isAcceptableOrUnknown(data['units']!, _unitsMeta));
    } else if (isInserting) {
      context.missing(_unitsMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KarigarProductsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KarigarProductsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      workTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}work_type_id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      units: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}units'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $KarigarProductsTableTable createAlias(String alias) {
    return $KarigarProductsTableTable(attachedDatabase, alias);
  }
}

class KarigarProductsTableData extends DataClass
    implements Insertable<KarigarProductsTableData> {
  final int id;
  final int workTypeId;
  final String productName;
  final String units;
  final String status;
  final DateTime createdAt;
  const KarigarProductsTableData(
      {required this.id,
      required this.workTypeId,
      required this.productName,
      required this.units,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['work_type_id'] = Variable<int>(workTypeId);
    map['product_name'] = Variable<String>(productName);
    map['units'] = Variable<String>(units);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  KarigarProductsTableCompanion toCompanion(bool nullToAbsent) {
    return KarigarProductsTableCompanion(
      id: Value(id),
      workTypeId: Value(workTypeId),
      productName: Value(productName),
      units: Value(units),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory KarigarProductsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KarigarProductsTableData(
      id: serializer.fromJson<int>(json['id']),
      workTypeId: serializer.fromJson<int>(json['workTypeId']),
      productName: serializer.fromJson<String>(json['productName']),
      units: serializer.fromJson<String>(json['units']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workTypeId': serializer.toJson<int>(workTypeId),
      'productName': serializer.toJson<String>(productName),
      'units': serializer.toJson<String>(units),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  KarigarProductsTableData copyWith(
          {int? id,
          int? workTypeId,
          String? productName,
          String? units,
          String? status,
          DateTime? createdAt}) =>
      KarigarProductsTableData(
        id: id ?? this.id,
        workTypeId: workTypeId ?? this.workTypeId,
        productName: productName ?? this.productName,
        units: units ?? this.units,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  KarigarProductsTableData copyWithCompanion(
      KarigarProductsTableCompanion data) {
    return KarigarProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      workTypeId:
          data.workTypeId.present ? data.workTypeId.value : this.workTypeId,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      units: data.units.present ? data.units.value : this.units,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KarigarProductsTableData(')
          ..write('id: $id, ')
          ..write('workTypeId: $workTypeId, ')
          ..write('productName: $productName, ')
          ..write('units: $units, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, workTypeId, productName, units, status, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KarigarProductsTableData &&
          other.id == this.id &&
          other.workTypeId == this.workTypeId &&
          other.productName == this.productName &&
          other.units == this.units &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class KarigarProductsTableCompanion
    extends UpdateCompanion<KarigarProductsTableData> {
  final Value<int> id;
  final Value<int> workTypeId;
  final Value<String> productName;
  final Value<String> units;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const KarigarProductsTableCompanion({
    this.id = const Value.absent(),
    this.workTypeId = const Value.absent(),
    this.productName = const Value.absent(),
    this.units = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  KarigarProductsTableCompanion.insert({
    this.id = const Value.absent(),
    required int workTypeId,
    required String productName,
    required String units,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : workTypeId = Value(workTypeId),
        productName = Value(productName),
        units = Value(units);
  static Insertable<KarigarProductsTableData> custom({
    Expression<int>? id,
    Expression<int>? workTypeId,
    Expression<String>? productName,
    Expression<String>? units,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workTypeId != null) 'work_type_id': workTypeId,
      if (productName != null) 'product_name': productName,
      if (units != null) 'units': units,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  KarigarProductsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? workTypeId,
      Value<String>? productName,
      Value<String>? units,
      Value<String>? status,
      Value<DateTime>? createdAt}) {
    return KarigarProductsTableCompanion(
      id: id ?? this.id,
      workTypeId: workTypeId ?? this.workTypeId,
      productName: productName ?? this.productName,
      units: units ?? this.units,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workTypeId.present) {
      map['work_type_id'] = Variable<int>(workTypeId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (units.present) {
      map['units'] = Variable<String>(units.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KarigarProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('workTypeId: $workTypeId, ')
          ..write('productName: $productName, ')
          ..write('units: $units, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $KarigarsTableTable extends KarigarsTable
    with TableInfo<$KarigarsTableTable, KarigarsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KarigarsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _karigarIdMeta =
      const VerificationMeta('karigarId');
  @override
  late final GeneratedColumn<int> karigarId = GeneratedColumn<int>(
      'karigar_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _karigarCodeMeta =
      const VerificationMeta('karigarCode');
  @override
  late final GeneratedColumn<String> karigarCode = GeneratedColumn<String>(
      'karigar_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _karigarNameMeta =
      const VerificationMeta('karigarName');
  @override
  late final GeneratedColumn<String> karigarName = GeneratedColumn<String>(
      'karigar_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mobileMeta = const VerificationMeta('mobile');
  @override
  late final GeneratedColumn<String> mobile = GeneratedColumn<String>(
      'mobile', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _aadharMeta = const VerificationMeta('aadhar');
  @override
  late final GeneratedColumn<String> aadhar = GeneratedColumn<String>(
      'aadhar', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _panMeta = const VerificationMeta('pan');
  @override
  late final GeneratedColumn<String> pan = GeneratedColumn<String>(
      'pan', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _openingBalanceMeta =
      const VerificationMeta('openingBalance');
  @override
  late final GeneratedColumn<double> openingBalance = GeneratedColumn<double>(
      'opening_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _openingBalanceTypeMeta =
      const VerificationMeta('openingBalanceType');
  @override
  late final GeneratedColumn<String> openingBalanceType =
      GeneratedColumn<String>('opening_balance_type', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _bankNameMeta =
      const VerificationMeta('bankName');
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
      'bank_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bankAccountNumberMeta =
      const VerificationMeta('bankAccountNumber');
  @override
  late final GeneratedColumn<String> bankAccountNumber =
      GeneratedColumn<String>('bank_account_number', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bankIfscMeta =
      const VerificationMeta('bankIfsc');
  @override
  late final GeneratedColumn<String> bankIfsc = GeneratedColumn<String>(
      'bank_ifsc', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _workTypeIdMeta =
      const VerificationMeta('workTypeId');
  @override
  late final GeneratedColumn<int> workTypeId = GeneratedColumn<int>(
      'work_type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES work_types (id)'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Active'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        karigarId,
        karigarCode,
        karigarName,
        mobile,
        address,
        aadhar,
        pan,
        openingBalance,
        openingBalanceType,
        bankName,
        bankAccountNumber,
        bankIfsc,
        workTypeId,
        status,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'karigar';
  @override
  VerificationContext validateIntegrity(Insertable<KarigarsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('karigar_id')) {
      context.handle(_karigarIdMeta,
          karigarId.isAcceptableOrUnknown(data['karigar_id']!, _karigarIdMeta));
    }
    if (data.containsKey('karigar_code')) {
      context.handle(
          _karigarCodeMeta,
          karigarCode.isAcceptableOrUnknown(
              data['karigar_code']!, _karigarCodeMeta));
    } else if (isInserting) {
      context.missing(_karigarCodeMeta);
    }
    if (data.containsKey('karigar_name')) {
      context.handle(
          _karigarNameMeta,
          karigarName.isAcceptableOrUnknown(
              data['karigar_name']!, _karigarNameMeta));
    } else if (isInserting) {
      context.missing(_karigarNameMeta);
    }
    if (data.containsKey('mobile')) {
      context.handle(_mobileMeta,
          mobile.isAcceptableOrUnknown(data['mobile']!, _mobileMeta));
    } else if (isInserting) {
      context.missing(_mobileMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('aadhar')) {
      context.handle(_aadharMeta,
          aadhar.isAcceptableOrUnknown(data['aadhar']!, _aadharMeta));
    }
    if (data.containsKey('pan')) {
      context.handle(
          _panMeta, pan.isAcceptableOrUnknown(data['pan']!, _panMeta));
    }
    if (data.containsKey('opening_balance')) {
      context.handle(
          _openingBalanceMeta,
          openingBalance.isAcceptableOrUnknown(
              data['opening_balance']!, _openingBalanceMeta));
    }
    if (data.containsKey('opening_balance_type')) {
      context.handle(
          _openingBalanceTypeMeta,
          openingBalanceType.isAcceptableOrUnknown(
              data['opening_balance_type']!, _openingBalanceTypeMeta));
    } else if (isInserting) {
      context.missing(_openingBalanceTypeMeta);
    }
    if (data.containsKey('bank_name')) {
      context.handle(_bankNameMeta,
          bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta));
    }
    if (data.containsKey('bank_account_number')) {
      context.handle(
          _bankAccountNumberMeta,
          bankAccountNumber.isAcceptableOrUnknown(
              data['bank_account_number']!, _bankAccountNumberMeta));
    }
    if (data.containsKey('bank_ifsc')) {
      context.handle(_bankIfscMeta,
          bankIfsc.isAcceptableOrUnknown(data['bank_ifsc']!, _bankIfscMeta));
    }
    if (data.containsKey('work_type_id')) {
      context.handle(
          _workTypeIdMeta,
          workTypeId.isAcceptableOrUnknown(
              data['work_type_id']!, _workTypeIdMeta));
    } else if (isInserting) {
      context.missing(_workTypeIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {karigarId};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {mobile},
      ];
  @override
  KarigarsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KarigarsTableData(
      karigarId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}karigar_id'])!,
      karigarCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}karigar_code'])!,
      karigarName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}karigar_name'])!,
      mobile: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mobile'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      aadhar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}aadhar']),
      pan: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pan']),
      openingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}opening_balance'])!,
      openingBalanceType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}opening_balance_type'])!,
      bankName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank_name']),
      bankAccountNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}bank_account_number']),
      bankIfsc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}bank_ifsc']),
      workTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}work_type_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $KarigarsTableTable createAlias(String alias) {
    return $KarigarsTableTable(attachedDatabase, alias);
  }
}

class KarigarsTableData extends DataClass
    implements Insertable<KarigarsTableData> {
  final int karigarId;
  final String karigarCode;
  final String karigarName;
  final String mobile;
  final String? address;
  final String? aadhar;
  final String? pan;
  final double openingBalance;
  final String openingBalanceType;
  final String? bankName;
  final String? bankAccountNumber;
  final String? bankIfsc;
  final int workTypeId;
  final String status;
  final DateTime createdAt;
  const KarigarsTableData(
      {required this.karigarId,
      required this.karigarCode,
      required this.karigarName,
      required this.mobile,
      this.address,
      this.aadhar,
      this.pan,
      required this.openingBalance,
      required this.openingBalanceType,
      this.bankName,
      this.bankAccountNumber,
      this.bankIfsc,
      required this.workTypeId,
      required this.status,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['karigar_id'] = Variable<int>(karigarId);
    map['karigar_code'] = Variable<String>(karigarCode);
    map['karigar_name'] = Variable<String>(karigarName);
    map['mobile'] = Variable<String>(mobile);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || aadhar != null) {
      map['aadhar'] = Variable<String>(aadhar);
    }
    if (!nullToAbsent || pan != null) {
      map['pan'] = Variable<String>(pan);
    }
    map['opening_balance'] = Variable<double>(openingBalance);
    map['opening_balance_type'] = Variable<String>(openingBalanceType);
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    if (!nullToAbsent || bankAccountNumber != null) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber);
    }
    if (!nullToAbsent || bankIfsc != null) {
      map['bank_ifsc'] = Variable<String>(bankIfsc);
    }
    map['work_type_id'] = Variable<int>(workTypeId);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  KarigarsTableCompanion toCompanion(bool nullToAbsent) {
    return KarigarsTableCompanion(
      karigarId: Value(karigarId),
      karigarCode: Value(karigarCode),
      karigarName: Value(karigarName),
      mobile: Value(mobile),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      aadhar:
          aadhar == null && nullToAbsent ? const Value.absent() : Value(aadhar),
      pan: pan == null && nullToAbsent ? const Value.absent() : Value(pan),
      openingBalance: Value(openingBalance),
      openingBalanceType: Value(openingBalanceType),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      bankAccountNumber: bankAccountNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(bankAccountNumber),
      bankIfsc: bankIfsc == null && nullToAbsent
          ? const Value.absent()
          : Value(bankIfsc),
      workTypeId: Value(workTypeId),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory KarigarsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KarigarsTableData(
      karigarId: serializer.fromJson<int>(json['karigarId']),
      karigarCode: serializer.fromJson<String>(json['karigarCode']),
      karigarName: serializer.fromJson<String>(json['karigarName']),
      mobile: serializer.fromJson<String>(json['mobile']),
      address: serializer.fromJson<String?>(json['address']),
      aadhar: serializer.fromJson<String?>(json['aadhar']),
      pan: serializer.fromJson<String?>(json['pan']),
      openingBalance: serializer.fromJson<double>(json['openingBalance']),
      openingBalanceType:
          serializer.fromJson<String>(json['openingBalanceType']),
      bankName: serializer.fromJson<String?>(json['bankName']),
      bankAccountNumber:
          serializer.fromJson<String?>(json['bankAccountNumber']),
      bankIfsc: serializer.fromJson<String?>(json['bankIfsc']),
      workTypeId: serializer.fromJson<int>(json['workTypeId']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'karigarId': serializer.toJson<int>(karigarId),
      'karigarCode': serializer.toJson<String>(karigarCode),
      'karigarName': serializer.toJson<String>(karigarName),
      'mobile': serializer.toJson<String>(mobile),
      'address': serializer.toJson<String?>(address),
      'aadhar': serializer.toJson<String?>(aadhar),
      'pan': serializer.toJson<String?>(pan),
      'openingBalance': serializer.toJson<double>(openingBalance),
      'openingBalanceType': serializer.toJson<String>(openingBalanceType),
      'bankName': serializer.toJson<String?>(bankName),
      'bankAccountNumber': serializer.toJson<String?>(bankAccountNumber),
      'bankIfsc': serializer.toJson<String?>(bankIfsc),
      'workTypeId': serializer.toJson<int>(workTypeId),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  KarigarsTableData copyWith(
          {int? karigarId,
          String? karigarCode,
          String? karigarName,
          String? mobile,
          Value<String?> address = const Value.absent(),
          Value<String?> aadhar = const Value.absent(),
          Value<String?> pan = const Value.absent(),
          double? openingBalance,
          String? openingBalanceType,
          Value<String?> bankName = const Value.absent(),
          Value<String?> bankAccountNumber = const Value.absent(),
          Value<String?> bankIfsc = const Value.absent(),
          int? workTypeId,
          String? status,
          DateTime? createdAt}) =>
      KarigarsTableData(
        karigarId: karigarId ?? this.karigarId,
        karigarCode: karigarCode ?? this.karigarCode,
        karigarName: karigarName ?? this.karigarName,
        mobile: mobile ?? this.mobile,
        address: address.present ? address.value : this.address,
        aadhar: aadhar.present ? aadhar.value : this.aadhar,
        pan: pan.present ? pan.value : this.pan,
        openingBalance: openingBalance ?? this.openingBalance,
        openingBalanceType: openingBalanceType ?? this.openingBalanceType,
        bankName: bankName.present ? bankName.value : this.bankName,
        bankAccountNumber: bankAccountNumber.present
            ? bankAccountNumber.value
            : this.bankAccountNumber,
        bankIfsc: bankIfsc.present ? bankIfsc.value : this.bankIfsc,
        workTypeId: workTypeId ?? this.workTypeId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
      );
  KarigarsTableData copyWithCompanion(KarigarsTableCompanion data) {
    return KarigarsTableData(
      karigarId: data.karigarId.present ? data.karigarId.value : this.karigarId,
      karigarCode:
          data.karigarCode.present ? data.karigarCode.value : this.karigarCode,
      karigarName:
          data.karigarName.present ? data.karigarName.value : this.karigarName,
      mobile: data.mobile.present ? data.mobile.value : this.mobile,
      address: data.address.present ? data.address.value : this.address,
      aadhar: data.aadhar.present ? data.aadhar.value : this.aadhar,
      pan: data.pan.present ? data.pan.value : this.pan,
      openingBalance: data.openingBalance.present
          ? data.openingBalance.value
          : this.openingBalance,
      openingBalanceType: data.openingBalanceType.present
          ? data.openingBalanceType.value
          : this.openingBalanceType,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      bankAccountNumber: data.bankAccountNumber.present
          ? data.bankAccountNumber.value
          : this.bankAccountNumber,
      bankIfsc: data.bankIfsc.present ? data.bankIfsc.value : this.bankIfsc,
      workTypeId:
          data.workTypeId.present ? data.workTypeId.value : this.workTypeId,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KarigarsTableData(')
          ..write('karigarId: $karigarId, ')
          ..write('karigarCode: $karigarCode, ')
          ..write('karigarName: $karigarName, ')
          ..write('mobile: $mobile, ')
          ..write('address: $address, ')
          ..write('aadhar: $aadhar, ')
          ..write('pan: $pan, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('openingBalanceType: $openingBalanceType, ')
          ..write('bankName: $bankName, ')
          ..write('bankAccountNumber: $bankAccountNumber, ')
          ..write('bankIfsc: $bankIfsc, ')
          ..write('workTypeId: $workTypeId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      karigarId,
      karigarCode,
      karigarName,
      mobile,
      address,
      aadhar,
      pan,
      openingBalance,
      openingBalanceType,
      bankName,
      bankAccountNumber,
      bankIfsc,
      workTypeId,
      status,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KarigarsTableData &&
          other.karigarId == this.karigarId &&
          other.karigarCode == this.karigarCode &&
          other.karigarName == this.karigarName &&
          other.mobile == this.mobile &&
          other.address == this.address &&
          other.aadhar == this.aadhar &&
          other.pan == this.pan &&
          other.openingBalance == this.openingBalance &&
          other.openingBalanceType == this.openingBalanceType &&
          other.bankName == this.bankName &&
          other.bankAccountNumber == this.bankAccountNumber &&
          other.bankIfsc == this.bankIfsc &&
          other.workTypeId == this.workTypeId &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class KarigarsTableCompanion extends UpdateCompanion<KarigarsTableData> {
  final Value<int> karigarId;
  final Value<String> karigarCode;
  final Value<String> karigarName;
  final Value<String> mobile;
  final Value<String?> address;
  final Value<String?> aadhar;
  final Value<String?> pan;
  final Value<double> openingBalance;
  final Value<String> openingBalanceType;
  final Value<String?> bankName;
  final Value<String?> bankAccountNumber;
  final Value<String?> bankIfsc;
  final Value<int> workTypeId;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const KarigarsTableCompanion({
    this.karigarId = const Value.absent(),
    this.karigarCode = const Value.absent(),
    this.karigarName = const Value.absent(),
    this.mobile = const Value.absent(),
    this.address = const Value.absent(),
    this.aadhar = const Value.absent(),
    this.pan = const Value.absent(),
    this.openingBalance = const Value.absent(),
    this.openingBalanceType = const Value.absent(),
    this.bankName = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
    this.bankIfsc = const Value.absent(),
    this.workTypeId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  KarigarsTableCompanion.insert({
    this.karigarId = const Value.absent(),
    required String karigarCode,
    required String karigarName,
    required String mobile,
    this.address = const Value.absent(),
    this.aadhar = const Value.absent(),
    this.pan = const Value.absent(),
    this.openingBalance = const Value.absent(),
    required String openingBalanceType,
    this.bankName = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
    this.bankIfsc = const Value.absent(),
    required int workTypeId,
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : karigarCode = Value(karigarCode),
        karigarName = Value(karigarName),
        mobile = Value(mobile),
        openingBalanceType = Value(openingBalanceType),
        workTypeId = Value(workTypeId);
  static Insertable<KarigarsTableData> custom({
    Expression<int>? karigarId,
    Expression<String>? karigarCode,
    Expression<String>? karigarName,
    Expression<String>? mobile,
    Expression<String>? address,
    Expression<String>? aadhar,
    Expression<String>? pan,
    Expression<double>? openingBalance,
    Expression<String>? openingBalanceType,
    Expression<String>? bankName,
    Expression<String>? bankAccountNumber,
    Expression<String>? bankIfsc,
    Expression<int>? workTypeId,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (karigarId != null) 'karigar_id': karigarId,
      if (karigarCode != null) 'karigar_code': karigarCode,
      if (karigarName != null) 'karigar_name': karigarName,
      if (mobile != null) 'mobile': mobile,
      if (address != null) 'address': address,
      if (aadhar != null) 'aadhar': aadhar,
      if (pan != null) 'pan': pan,
      if (openingBalance != null) 'opening_balance': openingBalance,
      if (openingBalanceType != null)
        'opening_balance_type': openingBalanceType,
      if (bankName != null) 'bank_name': bankName,
      if (bankAccountNumber != null) 'bank_account_number': bankAccountNumber,
      if (bankIfsc != null) 'bank_ifsc': bankIfsc,
      if (workTypeId != null) 'work_type_id': workTypeId,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  KarigarsTableCompanion copyWith(
      {Value<int>? karigarId,
      Value<String>? karigarCode,
      Value<String>? karigarName,
      Value<String>? mobile,
      Value<String?>? address,
      Value<String?>? aadhar,
      Value<String?>? pan,
      Value<double>? openingBalance,
      Value<String>? openingBalanceType,
      Value<String?>? bankName,
      Value<String?>? bankAccountNumber,
      Value<String?>? bankIfsc,
      Value<int>? workTypeId,
      Value<String>? status,
      Value<DateTime>? createdAt}) {
    return KarigarsTableCompanion(
      karigarId: karigarId ?? this.karigarId,
      karigarCode: karigarCode ?? this.karigarCode,
      karigarName: karigarName ?? this.karigarName,
      mobile: mobile ?? this.mobile,
      address: address ?? this.address,
      aadhar: aadhar ?? this.aadhar,
      pan: pan ?? this.pan,
      openingBalance: openingBalance ?? this.openingBalance,
      openingBalanceType: openingBalanceType ?? this.openingBalanceType,
      bankName: bankName ?? this.bankName,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      bankIfsc: bankIfsc ?? this.bankIfsc,
      workTypeId: workTypeId ?? this.workTypeId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (karigarId.present) {
      map['karigar_id'] = Variable<int>(karigarId.value);
    }
    if (karigarCode.present) {
      map['karigar_code'] = Variable<String>(karigarCode.value);
    }
    if (karigarName.present) {
      map['karigar_name'] = Variable<String>(karigarName.value);
    }
    if (mobile.present) {
      map['mobile'] = Variable<String>(mobile.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (aadhar.present) {
      map['aadhar'] = Variable<String>(aadhar.value);
    }
    if (pan.present) {
      map['pan'] = Variable<String>(pan.value);
    }
    if (openingBalance.present) {
      map['opening_balance'] = Variable<double>(openingBalance.value);
    }
    if (openingBalanceType.present) {
      map['opening_balance_type'] = Variable<String>(openingBalanceType.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (bankAccountNumber.present) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber.value);
    }
    if (bankIfsc.present) {
      map['bank_ifsc'] = Variable<String>(bankIfsc.value);
    }
    if (workTypeId.present) {
      map['work_type_id'] = Variable<int>(workTypeId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KarigarsTableCompanion(')
          ..write('karigarId: $karigarId, ')
          ..write('karigarCode: $karigarCode, ')
          ..write('karigarName: $karigarName, ')
          ..write('mobile: $mobile, ')
          ..write('address: $address, ')
          ..write('aadhar: $aadhar, ')
          ..write('pan: $pan, ')
          ..write('openingBalance: $openingBalance, ')
          ..write('openingBalanceType: $openingBalanceType, ')
          ..write('bankName: $bankName, ')
          ..write('bankAccountNumber: $bankAccountNumber, ')
          ..write('bankIfsc: $bankIfsc, ')
          ..write('workTypeId: $workTypeId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $KarigarProductRatesTableTable extends KarigarProductRatesTable
    with
        TableInfo<$KarigarProductRatesTableTable,
            KarigarProductRatesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KarigarProductRatesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _karigarIdMeta =
      const VerificationMeta('karigarId');
  @override
  late final GeneratedColumn<int> karigarId = GeneratedColumn<int>(
      'karigar_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES karigar (karigar_id)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES karigar_products (id)'));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
      'rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, karigarId, productId, unit, rate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'karigar_product_rates';
  @override
  VerificationContext validateIntegrity(
      Insertable<KarigarProductRatesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('karigar_id')) {
      context.handle(_karigarIdMeta,
          karigarId.isAcceptableOrUnknown(data['karigar_id']!, _karigarIdMeta));
    } else if (isInserting) {
      context.missing(_karigarIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {karigarId, productId, unit},
      ];
  @override
  KarigarProductRatesTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KarigarProductRatesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      karigarId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}karigar_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      rate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rate'])!,
    );
  }

  @override
  $KarigarProductRatesTableTable createAlias(String alias) {
    return $KarigarProductRatesTableTable(attachedDatabase, alias);
  }
}

class KarigarProductRatesTableData extends DataClass
    implements Insertable<KarigarProductRatesTableData> {
  final int id;
  final int karigarId;
  final int productId;
  final String unit;
  final double rate;
  const KarigarProductRatesTableData(
      {required this.id,
      required this.karigarId,
      required this.productId,
      required this.unit,
      required this.rate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['karigar_id'] = Variable<int>(karigarId);
    map['product_id'] = Variable<int>(productId);
    map['unit'] = Variable<String>(unit);
    map['rate'] = Variable<double>(rate);
    return map;
  }

  KarigarProductRatesTableCompanion toCompanion(bool nullToAbsent) {
    return KarigarProductRatesTableCompanion(
      id: Value(id),
      karigarId: Value(karigarId),
      productId: Value(productId),
      unit: Value(unit),
      rate: Value(rate),
    );
  }

  factory KarigarProductRatesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KarigarProductRatesTableData(
      id: serializer.fromJson<int>(json['id']),
      karigarId: serializer.fromJson<int>(json['karigarId']),
      productId: serializer.fromJson<int>(json['productId']),
      unit: serializer.fromJson<String>(json['unit']),
      rate: serializer.fromJson<double>(json['rate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'karigarId': serializer.toJson<int>(karigarId),
      'productId': serializer.toJson<int>(productId),
      'unit': serializer.toJson<String>(unit),
      'rate': serializer.toJson<double>(rate),
    };
  }

  KarigarProductRatesTableData copyWith(
          {int? id,
          int? karigarId,
          int? productId,
          String? unit,
          double? rate}) =>
      KarigarProductRatesTableData(
        id: id ?? this.id,
        karigarId: karigarId ?? this.karigarId,
        productId: productId ?? this.productId,
        unit: unit ?? this.unit,
        rate: rate ?? this.rate,
      );
  KarigarProductRatesTableData copyWithCompanion(
      KarigarProductRatesTableCompanion data) {
    return KarigarProductRatesTableData(
      id: data.id.present ? data.id.value : this.id,
      karigarId: data.karigarId.present ? data.karigarId.value : this.karigarId,
      productId: data.productId.present ? data.productId.value : this.productId,
      unit: data.unit.present ? data.unit.value : this.unit,
      rate: data.rate.present ? data.rate.value : this.rate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KarigarProductRatesTableData(')
          ..write('id: $id, ')
          ..write('karigarId: $karigarId, ')
          ..write('productId: $productId, ')
          ..write('unit: $unit, ')
          ..write('rate: $rate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, karigarId, productId, unit, rate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KarigarProductRatesTableData &&
          other.id == this.id &&
          other.karigarId == this.karigarId &&
          other.productId == this.productId &&
          other.unit == this.unit &&
          other.rate == this.rate);
}

class KarigarProductRatesTableCompanion
    extends UpdateCompanion<KarigarProductRatesTableData> {
  final Value<int> id;
  final Value<int> karigarId;
  final Value<int> productId;
  final Value<String> unit;
  final Value<double> rate;
  const KarigarProductRatesTableCompanion({
    this.id = const Value.absent(),
    this.karigarId = const Value.absent(),
    this.productId = const Value.absent(),
    this.unit = const Value.absent(),
    this.rate = const Value.absent(),
  });
  KarigarProductRatesTableCompanion.insert({
    this.id = const Value.absent(),
    required int karigarId,
    required int productId,
    required String unit,
    required double rate,
  })  : karigarId = Value(karigarId),
        productId = Value(productId),
        unit = Value(unit),
        rate = Value(rate);
  static Insertable<KarigarProductRatesTableData> custom({
    Expression<int>? id,
    Expression<int>? karigarId,
    Expression<int>? productId,
    Expression<String>? unit,
    Expression<double>? rate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (karigarId != null) 'karigar_id': karigarId,
      if (productId != null) 'product_id': productId,
      if (unit != null) 'unit': unit,
      if (rate != null) 'rate': rate,
    });
  }

  KarigarProductRatesTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? karigarId,
      Value<int>? productId,
      Value<String>? unit,
      Value<double>? rate}) {
    return KarigarProductRatesTableCompanion(
      id: id ?? this.id,
      karigarId: karigarId ?? this.karigarId,
      productId: productId ?? this.productId,
      unit: unit ?? this.unit,
      rate: rate ?? this.rate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (karigarId.present) {
      map['karigar_id'] = Variable<int>(karigarId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KarigarProductRatesTableCompanion(')
          ..write('id: $id, ')
          ..write('karigarId: $karigarId, ')
          ..write('productId: $productId, ')
          ..write('unit: $unit, ')
          ..write('rate: $rate')
          ..write(')'))
        .toString();
  }
}

class $KarigarJobWorkTableTable extends KarigarJobWorkTable
    with TableInfo<$KarigarJobWorkTableTable, KarigarJobWorkTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KarigarJobWorkTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _jobCodeMeta =
      const VerificationMeta('jobCode');
  @override
  late final GeneratedColumn<String> jobCode = GeneratedColumn<String>(
      'job_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _workTypeIdMeta =
      const VerificationMeta('workTypeId');
  @override
  late final GeneratedColumn<int> workTypeId = GeneratedColumn<int>(
      'work_type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES work_types (id)'));
  static const VerificationMeta _karigarIdMeta =
      const VerificationMeta('karigarId');
  @override
  late final GeneratedColumn<int> karigarId = GeneratedColumn<int>(
      'karigar_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES karigar (karigar_id)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES karigar_products (id)'));
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
      'rate', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<double> quantity = GeneratedColumn<double>(
      'quantity', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _quantityRecMeta =
      const VerificationMeta('quantityRec');
  @override
  late final GeneratedColumn<double> quantityRec = GeneratedColumn<double>(
      'quantity_rec', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isMultiMeta =
      const VerificationMeta('isMulti');
  @override
  late final GeneratedColumn<bool> isMulti = GeneratedColumn<bool>(
      'is_multi', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_multi" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Open'));
  static const VerificationMeta _allotDateMeta =
      const VerificationMeta('allotDate');
  @override
  late final GeneratedColumn<DateTime> allotDate = GeneratedColumn<DateTime>(
      'allot_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        jobCode,
        workTypeId,
        karigarId,
        productId,
        rate,
        unit,
        quantity,
        quantityRec,
        isMulti,
        status,
        allotDate,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'karigar_job_work';
  @override
  VerificationContext validateIntegrity(
      Insertable<KarigarJobWorkTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('job_code')) {
      context.handle(_jobCodeMeta,
          jobCode.isAcceptableOrUnknown(data['job_code']!, _jobCodeMeta));
    } else if (isInserting) {
      context.missing(_jobCodeMeta);
    }
    if (data.containsKey('work_type_id')) {
      context.handle(
          _workTypeIdMeta,
          workTypeId.isAcceptableOrUnknown(
              data['work_type_id']!, _workTypeIdMeta));
    } else if (isInserting) {
      context.missing(_workTypeIdMeta);
    }
    if (data.containsKey('karigar_id')) {
      context.handle(_karigarIdMeta,
          karigarId.isAcceptableOrUnknown(data['karigar_id']!, _karigarIdMeta));
    } else if (isInserting) {
      context.missing(_karigarIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('quantity_rec')) {
      context.handle(
          _quantityRecMeta,
          quantityRec.isAcceptableOrUnknown(
              data['quantity_rec']!, _quantityRecMeta));
    }
    if (data.containsKey('is_multi')) {
      context.handle(_isMultiMeta,
          isMulti.isAcceptableOrUnknown(data['is_multi']!, _isMultiMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('allot_date')) {
      context.handle(_allotDateMeta,
          allotDate.isAcceptableOrUnknown(data['allot_date']!, _allotDateMeta));
    } else if (isInserting) {
      context.missing(_allotDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KarigarJobWorkTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KarigarJobWorkTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      jobCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_code'])!,
      workTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}work_type_id'])!,
      karigarId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}karigar_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id']),
      rate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rate']),
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity'])!,
      quantityRec: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}quantity_rec'])!,
      isMulti: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_multi'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      allotDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}allot_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $KarigarJobWorkTableTable createAlias(String alias) {
    return $KarigarJobWorkTableTable(attachedDatabase, alias);
  }
}

class KarigarJobWorkTableData extends DataClass
    implements Insertable<KarigarJobWorkTableData> {
  final int id;
  final String jobCode;
  final int workTypeId;
  final int karigarId;
  final int? productId;
  final double? rate;
  final String? unit;
  final double quantity;
  final double quantityRec;
  final bool isMulti;
  final String status;
  final DateTime allotDate;
  final DateTime createdAt;
  const KarigarJobWorkTableData(
      {required this.id,
      required this.jobCode,
      required this.workTypeId,
      required this.karigarId,
      this.productId,
      this.rate,
      this.unit,
      required this.quantity,
      required this.quantityRec,
      required this.isMulti,
      required this.status,
      required this.allotDate,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['job_code'] = Variable<String>(jobCode);
    map['work_type_id'] = Variable<int>(workTypeId);
    map['karigar_id'] = Variable<int>(karigarId);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<int>(productId);
    }
    if (!nullToAbsent || rate != null) {
      map['rate'] = Variable<double>(rate);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    map['quantity'] = Variable<double>(quantity);
    map['quantity_rec'] = Variable<double>(quantityRec);
    map['is_multi'] = Variable<bool>(isMulti);
    map['status'] = Variable<String>(status);
    map['allot_date'] = Variable<DateTime>(allotDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  KarigarJobWorkTableCompanion toCompanion(bool nullToAbsent) {
    return KarigarJobWorkTableCompanion(
      id: Value(id),
      jobCode: Value(jobCode),
      workTypeId: Value(workTypeId),
      karigarId: Value(karigarId),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      rate: rate == null && nullToAbsent ? const Value.absent() : Value(rate),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      quantity: Value(quantity),
      quantityRec: Value(quantityRec),
      isMulti: Value(isMulti),
      status: Value(status),
      allotDate: Value(allotDate),
      createdAt: Value(createdAt),
    );
  }

  factory KarigarJobWorkTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KarigarJobWorkTableData(
      id: serializer.fromJson<int>(json['id']),
      jobCode: serializer.fromJson<String>(json['jobCode']),
      workTypeId: serializer.fromJson<int>(json['workTypeId']),
      karigarId: serializer.fromJson<int>(json['karigarId']),
      productId: serializer.fromJson<int?>(json['productId']),
      rate: serializer.fromJson<double?>(json['rate']),
      unit: serializer.fromJson<String?>(json['unit']),
      quantity: serializer.fromJson<double>(json['quantity']),
      quantityRec: serializer.fromJson<double>(json['quantityRec']),
      isMulti: serializer.fromJson<bool>(json['isMulti']),
      status: serializer.fromJson<String>(json['status']),
      allotDate: serializer.fromJson<DateTime>(json['allotDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jobCode': serializer.toJson<String>(jobCode),
      'workTypeId': serializer.toJson<int>(workTypeId),
      'karigarId': serializer.toJson<int>(karigarId),
      'productId': serializer.toJson<int?>(productId),
      'rate': serializer.toJson<double?>(rate),
      'unit': serializer.toJson<String?>(unit),
      'quantity': serializer.toJson<double>(quantity),
      'quantityRec': serializer.toJson<double>(quantityRec),
      'isMulti': serializer.toJson<bool>(isMulti),
      'status': serializer.toJson<String>(status),
      'allotDate': serializer.toJson<DateTime>(allotDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  KarigarJobWorkTableData copyWith(
          {int? id,
          String? jobCode,
          int? workTypeId,
          int? karigarId,
          Value<int?> productId = const Value.absent(),
          Value<double?> rate = const Value.absent(),
          Value<String?> unit = const Value.absent(),
          double? quantity,
          double? quantityRec,
          bool? isMulti,
          String? status,
          DateTime? allotDate,
          DateTime? createdAt}) =>
      KarigarJobWorkTableData(
        id: id ?? this.id,
        jobCode: jobCode ?? this.jobCode,
        workTypeId: workTypeId ?? this.workTypeId,
        karigarId: karigarId ?? this.karigarId,
        productId: productId.present ? productId.value : this.productId,
        rate: rate.present ? rate.value : this.rate,
        unit: unit.present ? unit.value : this.unit,
        quantity: quantity ?? this.quantity,
        quantityRec: quantityRec ?? this.quantityRec,
        isMulti: isMulti ?? this.isMulti,
        status: status ?? this.status,
        allotDate: allotDate ?? this.allotDate,
        createdAt: createdAt ?? this.createdAt,
      );
  KarigarJobWorkTableData copyWithCompanion(KarigarJobWorkTableCompanion data) {
    return KarigarJobWorkTableData(
      id: data.id.present ? data.id.value : this.id,
      jobCode: data.jobCode.present ? data.jobCode.value : this.jobCode,
      workTypeId:
          data.workTypeId.present ? data.workTypeId.value : this.workTypeId,
      karigarId: data.karigarId.present ? data.karigarId.value : this.karigarId,
      productId: data.productId.present ? data.productId.value : this.productId,
      rate: data.rate.present ? data.rate.value : this.rate,
      unit: data.unit.present ? data.unit.value : this.unit,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      quantityRec:
          data.quantityRec.present ? data.quantityRec.value : this.quantityRec,
      isMulti: data.isMulti.present ? data.isMulti.value : this.isMulti,
      status: data.status.present ? data.status.value : this.status,
      allotDate: data.allotDate.present ? data.allotDate.value : this.allotDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KarigarJobWorkTableData(')
          ..write('id: $id, ')
          ..write('jobCode: $jobCode, ')
          ..write('workTypeId: $workTypeId, ')
          ..write('karigarId: $karigarId, ')
          ..write('productId: $productId, ')
          ..write('rate: $rate, ')
          ..write('unit: $unit, ')
          ..write('quantity: $quantity, ')
          ..write('quantityRec: $quantityRec, ')
          ..write('isMulti: $isMulti, ')
          ..write('status: $status, ')
          ..write('allotDate: $allotDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, jobCode, workTypeId, karigarId, productId,
      rate, unit, quantity, quantityRec, isMulti, status, allotDate, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KarigarJobWorkTableData &&
          other.id == this.id &&
          other.jobCode == this.jobCode &&
          other.workTypeId == this.workTypeId &&
          other.karigarId == this.karigarId &&
          other.productId == this.productId &&
          other.rate == this.rate &&
          other.unit == this.unit &&
          other.quantity == this.quantity &&
          other.quantityRec == this.quantityRec &&
          other.isMulti == this.isMulti &&
          other.status == this.status &&
          other.allotDate == this.allotDate &&
          other.createdAt == this.createdAt);
}

class KarigarJobWorkTableCompanion
    extends UpdateCompanion<KarigarJobWorkTableData> {
  final Value<int> id;
  final Value<String> jobCode;
  final Value<int> workTypeId;
  final Value<int> karigarId;
  final Value<int?> productId;
  final Value<double?> rate;
  final Value<String?> unit;
  final Value<double> quantity;
  final Value<double> quantityRec;
  final Value<bool> isMulti;
  final Value<String> status;
  final Value<DateTime> allotDate;
  final Value<DateTime> createdAt;
  const KarigarJobWorkTableCompanion({
    this.id = const Value.absent(),
    this.jobCode = const Value.absent(),
    this.workTypeId = const Value.absent(),
    this.karigarId = const Value.absent(),
    this.productId = const Value.absent(),
    this.rate = const Value.absent(),
    this.unit = const Value.absent(),
    this.quantity = const Value.absent(),
    this.quantityRec = const Value.absent(),
    this.isMulti = const Value.absent(),
    this.status = const Value.absent(),
    this.allotDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  KarigarJobWorkTableCompanion.insert({
    this.id = const Value.absent(),
    required String jobCode,
    required int workTypeId,
    required int karigarId,
    this.productId = const Value.absent(),
    this.rate = const Value.absent(),
    this.unit = const Value.absent(),
    this.quantity = const Value.absent(),
    this.quantityRec = const Value.absent(),
    this.isMulti = const Value.absent(),
    this.status = const Value.absent(),
    required DateTime allotDate,
    this.createdAt = const Value.absent(),
  })  : jobCode = Value(jobCode),
        workTypeId = Value(workTypeId),
        karigarId = Value(karigarId),
        allotDate = Value(allotDate);
  static Insertable<KarigarJobWorkTableData> custom({
    Expression<int>? id,
    Expression<String>? jobCode,
    Expression<int>? workTypeId,
    Expression<int>? karigarId,
    Expression<int>? productId,
    Expression<double>? rate,
    Expression<String>? unit,
    Expression<double>? quantity,
    Expression<double>? quantityRec,
    Expression<bool>? isMulti,
    Expression<String>? status,
    Expression<DateTime>? allotDate,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobCode != null) 'job_code': jobCode,
      if (workTypeId != null) 'work_type_id': workTypeId,
      if (karigarId != null) 'karigar_id': karigarId,
      if (productId != null) 'product_id': productId,
      if (rate != null) 'rate': rate,
      if (unit != null) 'unit': unit,
      if (quantity != null) 'quantity': quantity,
      if (quantityRec != null) 'quantity_rec': quantityRec,
      if (isMulti != null) 'is_multi': isMulti,
      if (status != null) 'status': status,
      if (allotDate != null) 'allot_date': allotDate,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  KarigarJobWorkTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? jobCode,
      Value<int>? workTypeId,
      Value<int>? karigarId,
      Value<int?>? productId,
      Value<double?>? rate,
      Value<String?>? unit,
      Value<double>? quantity,
      Value<double>? quantityRec,
      Value<bool>? isMulti,
      Value<String>? status,
      Value<DateTime>? allotDate,
      Value<DateTime>? createdAt}) {
    return KarigarJobWorkTableCompanion(
      id: id ?? this.id,
      jobCode: jobCode ?? this.jobCode,
      workTypeId: workTypeId ?? this.workTypeId,
      karigarId: karigarId ?? this.karigarId,
      productId: productId ?? this.productId,
      rate: rate ?? this.rate,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
      quantityRec: quantityRec ?? this.quantityRec,
      isMulti: isMulti ?? this.isMulti,
      status: status ?? this.status,
      allotDate: allotDate ?? this.allotDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jobCode.present) {
      map['job_code'] = Variable<String>(jobCode.value);
    }
    if (workTypeId.present) {
      map['work_type_id'] = Variable<int>(workTypeId.value);
    }
    if (karigarId.present) {
      map['karigar_id'] = Variable<int>(karigarId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<double>(quantity.value);
    }
    if (quantityRec.present) {
      map['quantity_rec'] = Variable<double>(quantityRec.value);
    }
    if (isMulti.present) {
      map['is_multi'] = Variable<bool>(isMulti.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (allotDate.present) {
      map['allot_date'] = Variable<DateTime>(allotDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KarigarJobWorkTableCompanion(')
          ..write('id: $id, ')
          ..write('jobCode: $jobCode, ')
          ..write('workTypeId: $workTypeId, ')
          ..write('karigarId: $karigarId, ')
          ..write('productId: $productId, ')
          ..write('rate: $rate, ')
          ..write('unit: $unit, ')
          ..write('quantity: $quantity, ')
          ..write('quantityRec: $quantityRec, ')
          ..write('isMulti: $isMulti, ')
          ..write('status: $status, ')
          ..write('allotDate: $allotDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $KarigarJobWorkLineItemsTableTable extends KarigarJobWorkLineItemsTable
    with
        TableInfo<$KarigarJobWorkLineItemsTableTable,
            KarigarJobWorkLineItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KarigarJobWorkLineItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _jobWorkIdMeta =
      const VerificationMeta('jobWorkId');
  @override
  late final GeneratedColumn<int> jobWorkId = GeneratedColumn<int>(
      'job_work_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES karigar_job_work (id)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES karigar_products (id)'));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rateMeta = const VerificationMeta('rate');
  @override
  late final GeneratedColumn<double> rate = GeneratedColumn<double>(
      'rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _qtyAllottedMeta =
      const VerificationMeta('qtyAllotted');
  @override
  late final GeneratedColumn<double> qtyAllotted = GeneratedColumn<double>(
      'qty_allotted', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _qtyReceivedMeta =
      const VerificationMeta('qtyReceived');
  @override
  late final GeneratedColumn<double> qtyReceived = GeneratedColumn<double>(
      'qty_received', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, jobWorkId, productId, unit, rate, qtyAllotted, qtyReceived];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'karigar_job_work_line_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<KarigarJobWorkLineItemsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('job_work_id')) {
      context.handle(
          _jobWorkIdMeta,
          jobWorkId.isAcceptableOrUnknown(
              data['job_work_id']!, _jobWorkIdMeta));
    } else if (isInserting) {
      context.missing(_jobWorkIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('rate')) {
      context.handle(
          _rateMeta, rate.isAcceptableOrUnknown(data['rate']!, _rateMeta));
    } else if (isInserting) {
      context.missing(_rateMeta);
    }
    if (data.containsKey('qty_allotted')) {
      context.handle(
          _qtyAllottedMeta,
          qtyAllotted.isAcceptableOrUnknown(
              data['qty_allotted']!, _qtyAllottedMeta));
    } else if (isInserting) {
      context.missing(_qtyAllottedMeta);
    }
    if (data.containsKey('qty_received')) {
      context.handle(
          _qtyReceivedMeta,
          qtyReceived.isAcceptableOrUnknown(
              data['qty_received']!, _qtyReceivedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KarigarJobWorkLineItemsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KarigarJobWorkLineItemsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      jobWorkId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}job_work_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      rate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rate'])!,
      qtyAllotted: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}qty_allotted'])!,
      qtyReceived: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}qty_received'])!,
    );
  }

  @override
  $KarigarJobWorkLineItemsTableTable createAlias(String alias) {
    return $KarigarJobWorkLineItemsTableTable(attachedDatabase, alias);
  }
}

class KarigarJobWorkLineItemsTableData extends DataClass
    implements Insertable<KarigarJobWorkLineItemsTableData> {
  final int id;
  final int jobWorkId;
  final int productId;
  final String unit;
  final double rate;
  final double qtyAllotted;
  final double qtyReceived;
  const KarigarJobWorkLineItemsTableData(
      {required this.id,
      required this.jobWorkId,
      required this.productId,
      required this.unit,
      required this.rate,
      required this.qtyAllotted,
      required this.qtyReceived});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['job_work_id'] = Variable<int>(jobWorkId);
    map['product_id'] = Variable<int>(productId);
    map['unit'] = Variable<String>(unit);
    map['rate'] = Variable<double>(rate);
    map['qty_allotted'] = Variable<double>(qtyAllotted);
    map['qty_received'] = Variable<double>(qtyReceived);
    return map;
  }

  KarigarJobWorkLineItemsTableCompanion toCompanion(bool nullToAbsent) {
    return KarigarJobWorkLineItemsTableCompanion(
      id: Value(id),
      jobWorkId: Value(jobWorkId),
      productId: Value(productId),
      unit: Value(unit),
      rate: Value(rate),
      qtyAllotted: Value(qtyAllotted),
      qtyReceived: Value(qtyReceived),
    );
  }

  factory KarigarJobWorkLineItemsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KarigarJobWorkLineItemsTableData(
      id: serializer.fromJson<int>(json['id']),
      jobWorkId: serializer.fromJson<int>(json['jobWorkId']),
      productId: serializer.fromJson<int>(json['productId']),
      unit: serializer.fromJson<String>(json['unit']),
      rate: serializer.fromJson<double>(json['rate']),
      qtyAllotted: serializer.fromJson<double>(json['qtyAllotted']),
      qtyReceived: serializer.fromJson<double>(json['qtyReceived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jobWorkId': serializer.toJson<int>(jobWorkId),
      'productId': serializer.toJson<int>(productId),
      'unit': serializer.toJson<String>(unit),
      'rate': serializer.toJson<double>(rate),
      'qtyAllotted': serializer.toJson<double>(qtyAllotted),
      'qtyReceived': serializer.toJson<double>(qtyReceived),
    };
  }

  KarigarJobWorkLineItemsTableData copyWith(
          {int? id,
          int? jobWorkId,
          int? productId,
          String? unit,
          double? rate,
          double? qtyAllotted,
          double? qtyReceived}) =>
      KarigarJobWorkLineItemsTableData(
        id: id ?? this.id,
        jobWorkId: jobWorkId ?? this.jobWorkId,
        productId: productId ?? this.productId,
        unit: unit ?? this.unit,
        rate: rate ?? this.rate,
        qtyAllotted: qtyAllotted ?? this.qtyAllotted,
        qtyReceived: qtyReceived ?? this.qtyReceived,
      );
  KarigarJobWorkLineItemsTableData copyWithCompanion(
      KarigarJobWorkLineItemsTableCompanion data) {
    return KarigarJobWorkLineItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      jobWorkId: data.jobWorkId.present ? data.jobWorkId.value : this.jobWorkId,
      productId: data.productId.present ? data.productId.value : this.productId,
      unit: data.unit.present ? data.unit.value : this.unit,
      rate: data.rate.present ? data.rate.value : this.rate,
      qtyAllotted:
          data.qtyAllotted.present ? data.qtyAllotted.value : this.qtyAllotted,
      qtyReceived:
          data.qtyReceived.present ? data.qtyReceived.value : this.qtyReceived,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KarigarJobWorkLineItemsTableData(')
          ..write('id: $id, ')
          ..write('jobWorkId: $jobWorkId, ')
          ..write('productId: $productId, ')
          ..write('unit: $unit, ')
          ..write('rate: $rate, ')
          ..write('qtyAllotted: $qtyAllotted, ')
          ..write('qtyReceived: $qtyReceived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, jobWorkId, productId, unit, rate, qtyAllotted, qtyReceived);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KarigarJobWorkLineItemsTableData &&
          other.id == this.id &&
          other.jobWorkId == this.jobWorkId &&
          other.productId == this.productId &&
          other.unit == this.unit &&
          other.rate == this.rate &&
          other.qtyAllotted == this.qtyAllotted &&
          other.qtyReceived == this.qtyReceived);
}

class KarigarJobWorkLineItemsTableCompanion
    extends UpdateCompanion<KarigarJobWorkLineItemsTableData> {
  final Value<int> id;
  final Value<int> jobWorkId;
  final Value<int> productId;
  final Value<String> unit;
  final Value<double> rate;
  final Value<double> qtyAllotted;
  final Value<double> qtyReceived;
  const KarigarJobWorkLineItemsTableCompanion({
    this.id = const Value.absent(),
    this.jobWorkId = const Value.absent(),
    this.productId = const Value.absent(),
    this.unit = const Value.absent(),
    this.rate = const Value.absent(),
    this.qtyAllotted = const Value.absent(),
    this.qtyReceived = const Value.absent(),
  });
  KarigarJobWorkLineItemsTableCompanion.insert({
    this.id = const Value.absent(),
    required int jobWorkId,
    required int productId,
    required String unit,
    required double rate,
    required double qtyAllotted,
    this.qtyReceived = const Value.absent(),
  })  : jobWorkId = Value(jobWorkId),
        productId = Value(productId),
        unit = Value(unit),
        rate = Value(rate),
        qtyAllotted = Value(qtyAllotted);
  static Insertable<KarigarJobWorkLineItemsTableData> custom({
    Expression<int>? id,
    Expression<int>? jobWorkId,
    Expression<int>? productId,
    Expression<String>? unit,
    Expression<double>? rate,
    Expression<double>? qtyAllotted,
    Expression<double>? qtyReceived,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobWorkId != null) 'job_work_id': jobWorkId,
      if (productId != null) 'product_id': productId,
      if (unit != null) 'unit': unit,
      if (rate != null) 'rate': rate,
      if (qtyAllotted != null) 'qty_allotted': qtyAllotted,
      if (qtyReceived != null) 'qty_received': qtyReceived,
    });
  }

  KarigarJobWorkLineItemsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? jobWorkId,
      Value<int>? productId,
      Value<String>? unit,
      Value<double>? rate,
      Value<double>? qtyAllotted,
      Value<double>? qtyReceived}) {
    return KarigarJobWorkLineItemsTableCompanion(
      id: id ?? this.id,
      jobWorkId: jobWorkId ?? this.jobWorkId,
      productId: productId ?? this.productId,
      unit: unit ?? this.unit,
      rate: rate ?? this.rate,
      qtyAllotted: qtyAllotted ?? this.qtyAllotted,
      qtyReceived: qtyReceived ?? this.qtyReceived,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jobWorkId.present) {
      map['job_work_id'] = Variable<int>(jobWorkId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (rate.present) {
      map['rate'] = Variable<double>(rate.value);
    }
    if (qtyAllotted.present) {
      map['qty_allotted'] = Variable<double>(qtyAllotted.value);
    }
    if (qtyReceived.present) {
      map['qty_received'] = Variable<double>(qtyReceived.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KarigarJobWorkLineItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('jobWorkId: $jobWorkId, ')
          ..write('productId: $productId, ')
          ..write('unit: $unit, ')
          ..write('rate: $rate, ')
          ..write('qtyAllotted: $qtyAllotted, ')
          ..write('qtyReceived: $qtyReceived')
          ..write(')'))
        .toString();
  }
}

class $JobWorkAllotmentsTableTable extends JobWorkAllotmentsTable
    with TableInfo<$JobWorkAllotmentsTableTable, JobWorkAllotmentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobWorkAllotmentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _jobWorkIdMeta =
      const VerificationMeta('jobWorkId');
  @override
  late final GeneratedColumn<int> jobWorkId = GeneratedColumn<int>(
      'job_work_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES karigar_job_work (id)'));
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _allotDateMeta =
      const VerificationMeta('allotDate');
  @override
  late final GeneratedColumn<DateTime> allotDate = GeneratedColumn<DateTime>(
      'allot_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, jobWorkId, weight, allotDate, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_work_allotments';
  @override
  VerificationContext validateIntegrity(
      Insertable<JobWorkAllotmentsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('job_work_id')) {
      context.handle(
          _jobWorkIdMeta,
          jobWorkId.isAcceptableOrUnknown(
              data['job_work_id']!, _jobWorkIdMeta));
    } else if (isInserting) {
      context.missing(_jobWorkIdMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('allot_date')) {
      context.handle(_allotDateMeta,
          allotDate.isAcceptableOrUnknown(data['allot_date']!, _allotDateMeta));
    } else if (isInserting) {
      context.missing(_allotDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JobWorkAllotmentsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JobWorkAllotmentsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      jobWorkId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}job_work_id'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      allotDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}allot_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $JobWorkAllotmentsTableTable createAlias(String alias) {
    return $JobWorkAllotmentsTableTable(attachedDatabase, alias);
  }
}

class JobWorkAllotmentsTableData extends DataClass
    implements Insertable<JobWorkAllotmentsTableData> {
  final int id;
  final int jobWorkId;
  final double weight;
  final DateTime allotDate;
  final DateTime createdAt;
  const JobWorkAllotmentsTableData(
      {required this.id,
      required this.jobWorkId,
      required this.weight,
      required this.allotDate,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['job_work_id'] = Variable<int>(jobWorkId);
    map['weight'] = Variable<double>(weight);
    map['allot_date'] = Variable<DateTime>(allotDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  JobWorkAllotmentsTableCompanion toCompanion(bool nullToAbsent) {
    return JobWorkAllotmentsTableCompanion(
      id: Value(id),
      jobWorkId: Value(jobWorkId),
      weight: Value(weight),
      allotDate: Value(allotDate),
      createdAt: Value(createdAt),
    );
  }

  factory JobWorkAllotmentsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobWorkAllotmentsTableData(
      id: serializer.fromJson<int>(json['id']),
      jobWorkId: serializer.fromJson<int>(json['jobWorkId']),
      weight: serializer.fromJson<double>(json['weight']),
      allotDate: serializer.fromJson<DateTime>(json['allotDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jobWorkId': serializer.toJson<int>(jobWorkId),
      'weight': serializer.toJson<double>(weight),
      'allotDate': serializer.toJson<DateTime>(allotDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  JobWorkAllotmentsTableData copyWith(
          {int? id,
          int? jobWorkId,
          double? weight,
          DateTime? allotDate,
          DateTime? createdAt}) =>
      JobWorkAllotmentsTableData(
        id: id ?? this.id,
        jobWorkId: jobWorkId ?? this.jobWorkId,
        weight: weight ?? this.weight,
        allotDate: allotDate ?? this.allotDate,
        createdAt: createdAt ?? this.createdAt,
      );
  JobWorkAllotmentsTableData copyWithCompanion(
      JobWorkAllotmentsTableCompanion data) {
    return JobWorkAllotmentsTableData(
      id: data.id.present ? data.id.value : this.id,
      jobWorkId: data.jobWorkId.present ? data.jobWorkId.value : this.jobWorkId,
      weight: data.weight.present ? data.weight.value : this.weight,
      allotDate: data.allotDate.present ? data.allotDate.value : this.allotDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JobWorkAllotmentsTableData(')
          ..write('id: $id, ')
          ..write('jobWorkId: $jobWorkId, ')
          ..write('weight: $weight, ')
          ..write('allotDate: $allotDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, jobWorkId, weight, allotDate, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobWorkAllotmentsTableData &&
          other.id == this.id &&
          other.jobWorkId == this.jobWorkId &&
          other.weight == this.weight &&
          other.allotDate == this.allotDate &&
          other.createdAt == this.createdAt);
}

class JobWorkAllotmentsTableCompanion
    extends UpdateCompanion<JobWorkAllotmentsTableData> {
  final Value<int> id;
  final Value<int> jobWorkId;
  final Value<double> weight;
  final Value<DateTime> allotDate;
  final Value<DateTime> createdAt;
  const JobWorkAllotmentsTableCompanion({
    this.id = const Value.absent(),
    this.jobWorkId = const Value.absent(),
    this.weight = const Value.absent(),
    this.allotDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  JobWorkAllotmentsTableCompanion.insert({
    this.id = const Value.absent(),
    required int jobWorkId,
    required double weight,
    required DateTime allotDate,
    this.createdAt = const Value.absent(),
  })  : jobWorkId = Value(jobWorkId),
        weight = Value(weight),
        allotDate = Value(allotDate);
  static Insertable<JobWorkAllotmentsTableData> custom({
    Expression<int>? id,
    Expression<int>? jobWorkId,
    Expression<double>? weight,
    Expression<DateTime>? allotDate,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobWorkId != null) 'job_work_id': jobWorkId,
      if (weight != null) 'weight': weight,
      if (allotDate != null) 'allot_date': allotDate,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  JobWorkAllotmentsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? jobWorkId,
      Value<double>? weight,
      Value<DateTime>? allotDate,
      Value<DateTime>? createdAt}) {
    return JobWorkAllotmentsTableCompanion(
      id: id ?? this.id,
      jobWorkId: jobWorkId ?? this.jobWorkId,
      weight: weight ?? this.weight,
      allotDate: allotDate ?? this.allotDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jobWorkId.present) {
      map['job_work_id'] = Variable<int>(jobWorkId.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (allotDate.present) {
      map['allot_date'] = Variable<DateTime>(allotDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobWorkAllotmentsTableCompanion(')
          ..write('id: $id, ')
          ..write('jobWorkId: $jobWorkId, ')
          ..write('weight: $weight, ')
          ..write('allotDate: $allotDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $JobWorkReceiptsTableTable extends JobWorkReceiptsTable
    with TableInfo<$JobWorkReceiptsTableTable, JobWorkReceiptsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobWorkReceiptsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _jobWorkIdMeta =
      const VerificationMeta('jobWorkId');
  @override
  late final GeneratedColumn<int> jobWorkId = GeneratedColumn<int>(
      'job_work_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES karigar_job_work (id)'));
  static const VerificationMeta _weightReceivedMeta =
      const VerificationMeta('weightReceived');
  @override
  late final GeneratedColumn<double> weightReceived = GeneratedColumn<double>(
      'weight_received', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _receiveValueMeta =
      const VerificationMeta('receiveValue');
  @override
  late final GeneratedColumn<double> receiveValue = GeneratedColumn<double>(
      'receive_value', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _amountCreditedMeta =
      const VerificationMeta('amountCredited');
  @override
  late final GeneratedColumn<double> amountCredited = GeneratedColumn<double>(
      'amount_credited', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _receiveDateMeta =
      const VerificationMeta('receiveDate');
  @override
  late final GeneratedColumn<DateTime> receiveDate = GeneratedColumn<DateTime>(
      'receive_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        jobWorkId,
        weightReceived,
        receiveValue,
        amountCredited,
        receiveDate,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_work_receipts';
  @override
  VerificationContext validateIntegrity(
      Insertable<JobWorkReceiptsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('job_work_id')) {
      context.handle(
          _jobWorkIdMeta,
          jobWorkId.isAcceptableOrUnknown(
              data['job_work_id']!, _jobWorkIdMeta));
    } else if (isInserting) {
      context.missing(_jobWorkIdMeta);
    }
    if (data.containsKey('weight_received')) {
      context.handle(
          _weightReceivedMeta,
          weightReceived.isAcceptableOrUnknown(
              data['weight_received']!, _weightReceivedMeta));
    }
    if (data.containsKey('receive_value')) {
      context.handle(
          _receiveValueMeta,
          receiveValue.isAcceptableOrUnknown(
              data['receive_value']!, _receiveValueMeta));
    }
    if (data.containsKey('amount_credited')) {
      context.handle(
          _amountCreditedMeta,
          amountCredited.isAcceptableOrUnknown(
              data['amount_credited']!, _amountCreditedMeta));
    } else if (isInserting) {
      context.missing(_amountCreditedMeta);
    }
    if (data.containsKey('receive_date')) {
      context.handle(
          _receiveDateMeta,
          receiveDate.isAcceptableOrUnknown(
              data['receive_date']!, _receiveDateMeta));
    } else if (isInserting) {
      context.missing(_receiveDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JobWorkReceiptsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JobWorkReceiptsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      jobWorkId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}job_work_id'])!,
      weightReceived: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight_received']),
      receiveValue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}receive_value']),
      amountCredited: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}amount_credited'])!,
      receiveDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}receive_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $JobWorkReceiptsTableTable createAlias(String alias) {
    return $JobWorkReceiptsTableTable(attachedDatabase, alias);
  }
}

class JobWorkReceiptsTableData extends DataClass
    implements Insertable<JobWorkReceiptsTableData> {
  final int id;
  final int jobWorkId;
  final double? weightReceived;
  final double? receiveValue;
  final double amountCredited;
  final DateTime receiveDate;
  final DateTime createdAt;
  const JobWorkReceiptsTableData(
      {required this.id,
      required this.jobWorkId,
      this.weightReceived,
      this.receiveValue,
      required this.amountCredited,
      required this.receiveDate,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['job_work_id'] = Variable<int>(jobWorkId);
    if (!nullToAbsent || weightReceived != null) {
      map['weight_received'] = Variable<double>(weightReceived);
    }
    if (!nullToAbsent || receiveValue != null) {
      map['receive_value'] = Variable<double>(receiveValue);
    }
    map['amount_credited'] = Variable<double>(amountCredited);
    map['receive_date'] = Variable<DateTime>(receiveDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  JobWorkReceiptsTableCompanion toCompanion(bool nullToAbsent) {
    return JobWorkReceiptsTableCompanion(
      id: Value(id),
      jobWorkId: Value(jobWorkId),
      weightReceived: weightReceived == null && nullToAbsent
          ? const Value.absent()
          : Value(weightReceived),
      receiveValue: receiveValue == null && nullToAbsent
          ? const Value.absent()
          : Value(receiveValue),
      amountCredited: Value(amountCredited),
      receiveDate: Value(receiveDate),
      createdAt: Value(createdAt),
    );
  }

  factory JobWorkReceiptsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobWorkReceiptsTableData(
      id: serializer.fromJson<int>(json['id']),
      jobWorkId: serializer.fromJson<int>(json['jobWorkId']),
      weightReceived: serializer.fromJson<double?>(json['weightReceived']),
      receiveValue: serializer.fromJson<double?>(json['receiveValue']),
      amountCredited: serializer.fromJson<double>(json['amountCredited']),
      receiveDate: serializer.fromJson<DateTime>(json['receiveDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jobWorkId': serializer.toJson<int>(jobWorkId),
      'weightReceived': serializer.toJson<double?>(weightReceived),
      'receiveValue': serializer.toJson<double?>(receiveValue),
      'amountCredited': serializer.toJson<double>(amountCredited),
      'receiveDate': serializer.toJson<DateTime>(receiveDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  JobWorkReceiptsTableData copyWith(
          {int? id,
          int? jobWorkId,
          Value<double?> weightReceived = const Value.absent(),
          Value<double?> receiveValue = const Value.absent(),
          double? amountCredited,
          DateTime? receiveDate,
          DateTime? createdAt}) =>
      JobWorkReceiptsTableData(
        id: id ?? this.id,
        jobWorkId: jobWorkId ?? this.jobWorkId,
        weightReceived:
            weightReceived.present ? weightReceived.value : this.weightReceived,
        receiveValue:
            receiveValue.present ? receiveValue.value : this.receiveValue,
        amountCredited: amountCredited ?? this.amountCredited,
        receiveDate: receiveDate ?? this.receiveDate,
        createdAt: createdAt ?? this.createdAt,
      );
  JobWorkReceiptsTableData copyWithCompanion(
      JobWorkReceiptsTableCompanion data) {
    return JobWorkReceiptsTableData(
      id: data.id.present ? data.id.value : this.id,
      jobWorkId: data.jobWorkId.present ? data.jobWorkId.value : this.jobWorkId,
      weightReceived: data.weightReceived.present
          ? data.weightReceived.value
          : this.weightReceived,
      receiveValue: data.receiveValue.present
          ? data.receiveValue.value
          : this.receiveValue,
      amountCredited: data.amountCredited.present
          ? data.amountCredited.value
          : this.amountCredited,
      receiveDate:
          data.receiveDate.present ? data.receiveDate.value : this.receiveDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JobWorkReceiptsTableData(')
          ..write('id: $id, ')
          ..write('jobWorkId: $jobWorkId, ')
          ..write('weightReceived: $weightReceived, ')
          ..write('receiveValue: $receiveValue, ')
          ..write('amountCredited: $amountCredited, ')
          ..write('receiveDate: $receiveDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, jobWorkId, weightReceived, receiveValue,
      amountCredited, receiveDate, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobWorkReceiptsTableData &&
          other.id == this.id &&
          other.jobWorkId == this.jobWorkId &&
          other.weightReceived == this.weightReceived &&
          other.receiveValue == this.receiveValue &&
          other.amountCredited == this.amountCredited &&
          other.receiveDate == this.receiveDate &&
          other.createdAt == this.createdAt);
}

class JobWorkReceiptsTableCompanion
    extends UpdateCompanion<JobWorkReceiptsTableData> {
  final Value<int> id;
  final Value<int> jobWorkId;
  final Value<double?> weightReceived;
  final Value<double?> receiveValue;
  final Value<double> amountCredited;
  final Value<DateTime> receiveDate;
  final Value<DateTime> createdAt;
  const JobWorkReceiptsTableCompanion({
    this.id = const Value.absent(),
    this.jobWorkId = const Value.absent(),
    this.weightReceived = const Value.absent(),
    this.receiveValue = const Value.absent(),
    this.amountCredited = const Value.absent(),
    this.receiveDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  JobWorkReceiptsTableCompanion.insert({
    this.id = const Value.absent(),
    required int jobWorkId,
    this.weightReceived = const Value.absent(),
    this.receiveValue = const Value.absent(),
    required double amountCredited,
    required DateTime receiveDate,
    this.createdAt = const Value.absent(),
  })  : jobWorkId = Value(jobWorkId),
        amountCredited = Value(amountCredited),
        receiveDate = Value(receiveDate);
  static Insertable<JobWorkReceiptsTableData> custom({
    Expression<int>? id,
    Expression<int>? jobWorkId,
    Expression<double>? weightReceived,
    Expression<double>? receiveValue,
    Expression<double>? amountCredited,
    Expression<DateTime>? receiveDate,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobWorkId != null) 'job_work_id': jobWorkId,
      if (weightReceived != null) 'weight_received': weightReceived,
      if (receiveValue != null) 'receive_value': receiveValue,
      if (amountCredited != null) 'amount_credited': amountCredited,
      if (receiveDate != null) 'receive_date': receiveDate,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  JobWorkReceiptsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? jobWorkId,
      Value<double?>? weightReceived,
      Value<double?>? receiveValue,
      Value<double>? amountCredited,
      Value<DateTime>? receiveDate,
      Value<DateTime>? createdAt}) {
    return JobWorkReceiptsTableCompanion(
      id: id ?? this.id,
      jobWorkId: jobWorkId ?? this.jobWorkId,
      weightReceived: weightReceived ?? this.weightReceived,
      receiveValue: receiveValue ?? this.receiveValue,
      amountCredited: amountCredited ?? this.amountCredited,
      receiveDate: receiveDate ?? this.receiveDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jobWorkId.present) {
      map['job_work_id'] = Variable<int>(jobWorkId.value);
    }
    if (weightReceived.present) {
      map['weight_received'] = Variable<double>(weightReceived.value);
    }
    if (receiveValue.present) {
      map['receive_value'] = Variable<double>(receiveValue.value);
    }
    if (amountCredited.present) {
      map['amount_credited'] = Variable<double>(amountCredited.value);
    }
    if (receiveDate.present) {
      map['receive_date'] = Variable<DateTime>(receiveDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobWorkReceiptsTableCompanion(')
          ..write('id: $id, ')
          ..write('jobWorkId: $jobWorkId, ')
          ..write('weightReceived: $weightReceived, ')
          ..write('receiveValue: $receiveValue, ')
          ..write('amountCredited: $amountCredited, ')
          ..write('receiveDate: $receiveDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $JobWorkReceiptLineItemsTableTable extends JobWorkReceiptLineItemsTable
    with
        TableInfo<$JobWorkReceiptLineItemsTableTable,
            JobWorkReceiptLineItemsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobWorkReceiptLineItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _receiptIdMeta =
      const VerificationMeta('receiptId');
  @override
  late final GeneratedColumn<int> receiptId = GeneratedColumn<int>(
      'receipt_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES job_work_receipts (id)'));
  static const VerificationMeta _jobWorkLineItemIdMeta =
      const VerificationMeta('jobWorkLineItemId');
  @override
  late final GeneratedColumn<int> jobWorkLineItemId = GeneratedColumn<int>(
      'job_work_line_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES karigar_job_work_line_items (id)'));
  static const VerificationMeta _qtyReceivedNowMeta =
      const VerificationMeta('qtyReceivedNow');
  @override
  late final GeneratedColumn<double> qtyReceivedNow = GeneratedColumn<double>(
      'qty_received_now', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, receiptId, jobWorkLineItemId, qtyReceivedNow, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_work_receipt_line_items';
  @override
  VerificationContext validateIntegrity(
      Insertable<JobWorkReceiptLineItemsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('receipt_id')) {
      context.handle(_receiptIdMeta,
          receiptId.isAcceptableOrUnknown(data['receipt_id']!, _receiptIdMeta));
    } else if (isInserting) {
      context.missing(_receiptIdMeta);
    }
    if (data.containsKey('job_work_line_item_id')) {
      context.handle(
          _jobWorkLineItemIdMeta,
          jobWorkLineItemId.isAcceptableOrUnknown(
              data['job_work_line_item_id']!, _jobWorkLineItemIdMeta));
    } else if (isInserting) {
      context.missing(_jobWorkLineItemIdMeta);
    }
    if (data.containsKey('qty_received_now')) {
      context.handle(
          _qtyReceivedNowMeta,
          qtyReceivedNow.isAcceptableOrUnknown(
              data['qty_received_now']!, _qtyReceivedNowMeta));
    } else if (isInserting) {
      context.missing(_qtyReceivedNowMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JobWorkReceiptLineItemsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JobWorkReceiptLineItemsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      receiptId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}receipt_id'])!,
      jobWorkLineItemId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}job_work_line_item_id'])!,
      qtyReceivedNow: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}qty_received_now'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
    );
  }

  @override
  $JobWorkReceiptLineItemsTableTable createAlias(String alias) {
    return $JobWorkReceiptLineItemsTableTable(attachedDatabase, alias);
  }
}

class JobWorkReceiptLineItemsTableData extends DataClass
    implements Insertable<JobWorkReceiptLineItemsTableData> {
  final int id;
  final int receiptId;
  final int jobWorkLineItemId;
  final double qtyReceivedNow;
  final double amount;
  const JobWorkReceiptLineItemsTableData(
      {required this.id,
      required this.receiptId,
      required this.jobWorkLineItemId,
      required this.qtyReceivedNow,
      required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['receipt_id'] = Variable<int>(receiptId);
    map['job_work_line_item_id'] = Variable<int>(jobWorkLineItemId);
    map['qty_received_now'] = Variable<double>(qtyReceivedNow);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  JobWorkReceiptLineItemsTableCompanion toCompanion(bool nullToAbsent) {
    return JobWorkReceiptLineItemsTableCompanion(
      id: Value(id),
      receiptId: Value(receiptId),
      jobWorkLineItemId: Value(jobWorkLineItemId),
      qtyReceivedNow: Value(qtyReceivedNow),
      amount: Value(amount),
    );
  }

  factory JobWorkReceiptLineItemsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobWorkReceiptLineItemsTableData(
      id: serializer.fromJson<int>(json['id']),
      receiptId: serializer.fromJson<int>(json['receiptId']),
      jobWorkLineItemId: serializer.fromJson<int>(json['jobWorkLineItemId']),
      qtyReceivedNow: serializer.fromJson<double>(json['qtyReceivedNow']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'receiptId': serializer.toJson<int>(receiptId),
      'jobWorkLineItemId': serializer.toJson<int>(jobWorkLineItemId),
      'qtyReceivedNow': serializer.toJson<double>(qtyReceivedNow),
      'amount': serializer.toJson<double>(amount),
    };
  }

  JobWorkReceiptLineItemsTableData copyWith(
          {int? id,
          int? receiptId,
          int? jobWorkLineItemId,
          double? qtyReceivedNow,
          double? amount}) =>
      JobWorkReceiptLineItemsTableData(
        id: id ?? this.id,
        receiptId: receiptId ?? this.receiptId,
        jobWorkLineItemId: jobWorkLineItemId ?? this.jobWorkLineItemId,
        qtyReceivedNow: qtyReceivedNow ?? this.qtyReceivedNow,
        amount: amount ?? this.amount,
      );
  JobWorkReceiptLineItemsTableData copyWithCompanion(
      JobWorkReceiptLineItemsTableCompanion data) {
    return JobWorkReceiptLineItemsTableData(
      id: data.id.present ? data.id.value : this.id,
      receiptId: data.receiptId.present ? data.receiptId.value : this.receiptId,
      jobWorkLineItemId: data.jobWorkLineItemId.present
          ? data.jobWorkLineItemId.value
          : this.jobWorkLineItemId,
      qtyReceivedNow: data.qtyReceivedNow.present
          ? data.qtyReceivedNow.value
          : this.qtyReceivedNow,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JobWorkReceiptLineItemsTableData(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('jobWorkLineItemId: $jobWorkLineItemId, ')
          ..write('qtyReceivedNow: $qtyReceivedNow, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, receiptId, jobWorkLineItemId, qtyReceivedNow, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobWorkReceiptLineItemsTableData &&
          other.id == this.id &&
          other.receiptId == this.receiptId &&
          other.jobWorkLineItemId == this.jobWorkLineItemId &&
          other.qtyReceivedNow == this.qtyReceivedNow &&
          other.amount == this.amount);
}

class JobWorkReceiptLineItemsTableCompanion
    extends UpdateCompanion<JobWorkReceiptLineItemsTableData> {
  final Value<int> id;
  final Value<int> receiptId;
  final Value<int> jobWorkLineItemId;
  final Value<double> qtyReceivedNow;
  final Value<double> amount;
  const JobWorkReceiptLineItemsTableCompanion({
    this.id = const Value.absent(),
    this.receiptId = const Value.absent(),
    this.jobWorkLineItemId = const Value.absent(),
    this.qtyReceivedNow = const Value.absent(),
    this.amount = const Value.absent(),
  });
  JobWorkReceiptLineItemsTableCompanion.insert({
    this.id = const Value.absent(),
    required int receiptId,
    required int jobWorkLineItemId,
    required double qtyReceivedNow,
    required double amount,
  })  : receiptId = Value(receiptId),
        jobWorkLineItemId = Value(jobWorkLineItemId),
        qtyReceivedNow = Value(qtyReceivedNow),
        amount = Value(amount);
  static Insertable<JobWorkReceiptLineItemsTableData> custom({
    Expression<int>? id,
    Expression<int>? receiptId,
    Expression<int>? jobWorkLineItemId,
    Expression<double>? qtyReceivedNow,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (receiptId != null) 'receipt_id': receiptId,
      if (jobWorkLineItemId != null) 'job_work_line_item_id': jobWorkLineItemId,
      if (qtyReceivedNow != null) 'qty_received_now': qtyReceivedNow,
      if (amount != null) 'amount': amount,
    });
  }

  JobWorkReceiptLineItemsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? receiptId,
      Value<int>? jobWorkLineItemId,
      Value<double>? qtyReceivedNow,
      Value<double>? amount}) {
    return JobWorkReceiptLineItemsTableCompanion(
      id: id ?? this.id,
      receiptId: receiptId ?? this.receiptId,
      jobWorkLineItemId: jobWorkLineItemId ?? this.jobWorkLineItemId,
      qtyReceivedNow: qtyReceivedNow ?? this.qtyReceivedNow,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (receiptId.present) {
      map['receipt_id'] = Variable<int>(receiptId.value);
    }
    if (jobWorkLineItemId.present) {
      map['job_work_line_item_id'] = Variable<int>(jobWorkLineItemId.value);
    }
    if (qtyReceivedNow.present) {
      map['qty_received_now'] = Variable<double>(qtyReceivedNow.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobWorkReceiptLineItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('receiptId: $receiptId, ')
          ..write('jobWorkLineItemId: $jobWorkLineItemId, ')
          ..write('qtyReceivedNow: $qtyReceivedNow, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $JobWorkRemarksTableTable extends JobWorkRemarksTable
    with TableInfo<$JobWorkRemarksTableTable, JobWorkRemarksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobWorkRemarksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _jobWorkIdMeta =
      const VerificationMeta('jobWorkId');
  @override
  late final GeneratedColumn<int> jobWorkId = GeneratedColumn<int>(
      'job_work_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES karigar_job_work (id)'));
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
      'remark', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _remarkDateMeta =
      const VerificationMeta('remarkDate');
  @override
  late final GeneratedColumn<DateTime> remarkDate = GeneratedColumn<DateTime>(
      'remark_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, jobWorkId, remark, remarkDate, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_work_remarks';
  @override
  VerificationContext validateIntegrity(
      Insertable<JobWorkRemarksTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('job_work_id')) {
      context.handle(
          _jobWorkIdMeta,
          jobWorkId.isAcceptableOrUnknown(
              data['job_work_id']!, _jobWorkIdMeta));
    } else if (isInserting) {
      context.missing(_jobWorkIdMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    if (data.containsKey('remark_date')) {
      context.handle(
          _remarkDateMeta,
          remarkDate.isAcceptableOrUnknown(
              data['remark_date']!, _remarkDateMeta));
    } else if (isInserting) {
      context.missing(_remarkDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JobWorkRemarksTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JobWorkRemarksTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      jobWorkId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}job_work_id'])!,
      remark: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remark'])!,
      remarkDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}remark_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $JobWorkRemarksTableTable createAlias(String alias) {
    return $JobWorkRemarksTableTable(attachedDatabase, alias);
  }
}

class JobWorkRemarksTableData extends DataClass
    implements Insertable<JobWorkRemarksTableData> {
  final int id;
  final int jobWorkId;
  final String remark;
  final DateTime remarkDate;
  final DateTime createdAt;
  const JobWorkRemarksTableData(
      {required this.id,
      required this.jobWorkId,
      required this.remark,
      required this.remarkDate,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['job_work_id'] = Variable<int>(jobWorkId);
    map['remark'] = Variable<String>(remark);
    map['remark_date'] = Variable<DateTime>(remarkDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  JobWorkRemarksTableCompanion toCompanion(bool nullToAbsent) {
    return JobWorkRemarksTableCompanion(
      id: Value(id),
      jobWorkId: Value(jobWorkId),
      remark: Value(remark),
      remarkDate: Value(remarkDate),
      createdAt: Value(createdAt),
    );
  }

  factory JobWorkRemarksTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobWorkRemarksTableData(
      id: serializer.fromJson<int>(json['id']),
      jobWorkId: serializer.fromJson<int>(json['jobWorkId']),
      remark: serializer.fromJson<String>(json['remark']),
      remarkDate: serializer.fromJson<DateTime>(json['remarkDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jobWorkId': serializer.toJson<int>(jobWorkId),
      'remark': serializer.toJson<String>(remark),
      'remarkDate': serializer.toJson<DateTime>(remarkDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  JobWorkRemarksTableData copyWith(
          {int? id,
          int? jobWorkId,
          String? remark,
          DateTime? remarkDate,
          DateTime? createdAt}) =>
      JobWorkRemarksTableData(
        id: id ?? this.id,
        jobWorkId: jobWorkId ?? this.jobWorkId,
        remark: remark ?? this.remark,
        remarkDate: remarkDate ?? this.remarkDate,
        createdAt: createdAt ?? this.createdAt,
      );
  JobWorkRemarksTableData copyWithCompanion(JobWorkRemarksTableCompanion data) {
    return JobWorkRemarksTableData(
      id: data.id.present ? data.id.value : this.id,
      jobWorkId: data.jobWorkId.present ? data.jobWorkId.value : this.jobWorkId,
      remark: data.remark.present ? data.remark.value : this.remark,
      remarkDate:
          data.remarkDate.present ? data.remarkDate.value : this.remarkDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JobWorkRemarksTableData(')
          ..write('id: $id, ')
          ..write('jobWorkId: $jobWorkId, ')
          ..write('remark: $remark, ')
          ..write('remarkDate: $remarkDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, jobWorkId, remark, remarkDate, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobWorkRemarksTableData &&
          other.id == this.id &&
          other.jobWorkId == this.jobWorkId &&
          other.remark == this.remark &&
          other.remarkDate == this.remarkDate &&
          other.createdAt == this.createdAt);
}

class JobWorkRemarksTableCompanion
    extends UpdateCompanion<JobWorkRemarksTableData> {
  final Value<int> id;
  final Value<int> jobWorkId;
  final Value<String> remark;
  final Value<DateTime> remarkDate;
  final Value<DateTime> createdAt;
  const JobWorkRemarksTableCompanion({
    this.id = const Value.absent(),
    this.jobWorkId = const Value.absent(),
    this.remark = const Value.absent(),
    this.remarkDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  JobWorkRemarksTableCompanion.insert({
    this.id = const Value.absent(),
    required int jobWorkId,
    required String remark,
    required DateTime remarkDate,
    this.createdAt = const Value.absent(),
  })  : jobWorkId = Value(jobWorkId),
        remark = Value(remark),
        remarkDate = Value(remarkDate);
  static Insertable<JobWorkRemarksTableData> custom({
    Expression<int>? id,
    Expression<int>? jobWorkId,
    Expression<String>? remark,
    Expression<DateTime>? remarkDate,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobWorkId != null) 'job_work_id': jobWorkId,
      if (remark != null) 'remark': remark,
      if (remarkDate != null) 'remark_date': remarkDate,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  JobWorkRemarksTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? jobWorkId,
      Value<String>? remark,
      Value<DateTime>? remarkDate,
      Value<DateTime>? createdAt}) {
    return JobWorkRemarksTableCompanion(
      id: id ?? this.id,
      jobWorkId: jobWorkId ?? this.jobWorkId,
      remark: remark ?? this.remark,
      remarkDate: remarkDate ?? this.remarkDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jobWorkId.present) {
      map['job_work_id'] = Variable<int>(jobWorkId.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (remarkDate.present) {
      map['remark_date'] = Variable<DateTime>(remarkDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobWorkRemarksTableCompanion(')
          ..write('id: $id, ')
          ..write('jobWorkId: $jobWorkId, ')
          ..write('remark: $remark, ')
          ..write('remarkDate: $remarkDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $KarigarPaymentsTableTable extends KarigarPaymentsTable
    with TableInfo<$KarigarPaymentsTableTable, KarigarPaymentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KarigarPaymentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _karigarIdMeta =
      const VerificationMeta('karigarId');
  @override
  late final GeneratedColumn<int> karigarId = GeneratedColumn<int>(
      'karigar_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES karigar (karigar_id)'));
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<DateTime> paymentDate = GeneratedColumn<DateTime>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _amountDrMeta =
      const VerificationMeta('amountDr');
  @override
  late final GeneratedColumn<double> amountDr = GeneratedColumn<double>(
      'amount_dr', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _amountCrMeta =
      const VerificationMeta('amountCr');
  @override
  late final GeneratedColumn<double> amountCr = GeneratedColumn<double>(
      'amount_cr', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, karigarId, paymentDate, amountDr, amountCr, note, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'karigar_payments';
  @override
  VerificationContext validateIntegrity(
      Insertable<KarigarPaymentsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('karigar_id')) {
      context.handle(_karigarIdMeta,
          karigarId.isAcceptableOrUnknown(data['karigar_id']!, _karigarIdMeta));
    } else if (isInserting) {
      context.missing(_karigarIdMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    } else if (isInserting) {
      context.missing(_paymentDateMeta);
    }
    if (data.containsKey('amount_dr')) {
      context.handle(_amountDrMeta,
          amountDr.isAcceptableOrUnknown(data['amount_dr']!, _amountDrMeta));
    }
    if (data.containsKey('amount_cr')) {
      context.handle(_amountCrMeta,
          amountCr.isAcceptableOrUnknown(data['amount_cr']!, _amountCrMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KarigarPaymentsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KarigarPaymentsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      karigarId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}karigar_id'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}payment_date'])!,
      amountDr: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount_dr'])!,
      amountCr: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount_cr'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $KarigarPaymentsTableTable createAlias(String alias) {
    return $KarigarPaymentsTableTable(attachedDatabase, alias);
  }
}

class KarigarPaymentsTableData extends DataClass
    implements Insertable<KarigarPaymentsTableData> {
  final int id;
  final int karigarId;
  final DateTime paymentDate;
  final double amountDr;
  final double amountCr;
  final String? note;
  final DateTime createdAt;
  const KarigarPaymentsTableData(
      {required this.id,
      required this.karigarId,
      required this.paymentDate,
      required this.amountDr,
      required this.amountCr,
      this.note,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['karigar_id'] = Variable<int>(karigarId);
    map['payment_date'] = Variable<DateTime>(paymentDate);
    map['amount_dr'] = Variable<double>(amountDr);
    map['amount_cr'] = Variable<double>(amountCr);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  KarigarPaymentsTableCompanion toCompanion(bool nullToAbsent) {
    return KarigarPaymentsTableCompanion(
      id: Value(id),
      karigarId: Value(karigarId),
      paymentDate: Value(paymentDate),
      amountDr: Value(amountDr),
      amountCr: Value(amountCr),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory KarigarPaymentsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KarigarPaymentsTableData(
      id: serializer.fromJson<int>(json['id']),
      karigarId: serializer.fromJson<int>(json['karigarId']),
      paymentDate: serializer.fromJson<DateTime>(json['paymentDate']),
      amountDr: serializer.fromJson<double>(json['amountDr']),
      amountCr: serializer.fromJson<double>(json['amountCr']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'karigarId': serializer.toJson<int>(karigarId),
      'paymentDate': serializer.toJson<DateTime>(paymentDate),
      'amountDr': serializer.toJson<double>(amountDr),
      'amountCr': serializer.toJson<double>(amountCr),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  KarigarPaymentsTableData copyWith(
          {int? id,
          int? karigarId,
          DateTime? paymentDate,
          double? amountDr,
          double? amountCr,
          Value<String?> note = const Value.absent(),
          DateTime? createdAt}) =>
      KarigarPaymentsTableData(
        id: id ?? this.id,
        karigarId: karigarId ?? this.karigarId,
        paymentDate: paymentDate ?? this.paymentDate,
        amountDr: amountDr ?? this.amountDr,
        amountCr: amountCr ?? this.amountCr,
        note: note.present ? note.value : this.note,
        createdAt: createdAt ?? this.createdAt,
      );
  KarigarPaymentsTableData copyWithCompanion(
      KarigarPaymentsTableCompanion data) {
    return KarigarPaymentsTableData(
      id: data.id.present ? data.id.value : this.id,
      karigarId: data.karigarId.present ? data.karigarId.value : this.karigarId,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      amountDr: data.amountDr.present ? data.amountDr.value : this.amountDr,
      amountCr: data.amountCr.present ? data.amountCr.value : this.amountCr,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KarigarPaymentsTableData(')
          ..write('id: $id, ')
          ..write('karigarId: $karigarId, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('amountDr: $amountDr, ')
          ..write('amountCr: $amountCr, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, karigarId, paymentDate, amountDr, amountCr, note, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KarigarPaymentsTableData &&
          other.id == this.id &&
          other.karigarId == this.karigarId &&
          other.paymentDate == this.paymentDate &&
          other.amountDr == this.amountDr &&
          other.amountCr == this.amountCr &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class KarigarPaymentsTableCompanion
    extends UpdateCompanion<KarigarPaymentsTableData> {
  final Value<int> id;
  final Value<int> karigarId;
  final Value<DateTime> paymentDate;
  final Value<double> amountDr;
  final Value<double> amountCr;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  const KarigarPaymentsTableCompanion({
    this.id = const Value.absent(),
    this.karigarId = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.amountDr = const Value.absent(),
    this.amountCr = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  KarigarPaymentsTableCompanion.insert({
    this.id = const Value.absent(),
    required int karigarId,
    required DateTime paymentDate,
    this.amountDr = const Value.absent(),
    this.amountCr = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : karigarId = Value(karigarId),
        paymentDate = Value(paymentDate);
  static Insertable<KarigarPaymentsTableData> custom({
    Expression<int>? id,
    Expression<int>? karigarId,
    Expression<DateTime>? paymentDate,
    Expression<double>? amountDr,
    Expression<double>? amountCr,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (karigarId != null) 'karigar_id': karigarId,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (amountDr != null) 'amount_dr': amountDr,
      if (amountCr != null) 'amount_cr': amountCr,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  KarigarPaymentsTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? karigarId,
      Value<DateTime>? paymentDate,
      Value<double>? amountDr,
      Value<double>? amountCr,
      Value<String?>? note,
      Value<DateTime>? createdAt}) {
    return KarigarPaymentsTableCompanion(
      id: id ?? this.id,
      karigarId: karigarId ?? this.karigarId,
      paymentDate: paymentDate ?? this.paymentDate,
      amountDr: amountDr ?? this.amountDr,
      amountCr: amountCr ?? this.amountCr,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (karigarId.present) {
      map['karigar_id'] = Variable<int>(karigarId.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<DateTime>(paymentDate.value);
    }
    if (amountDr.present) {
      map['amount_dr'] = Variable<double>(amountDr.value);
    }
    if (amountCr.present) {
      map['amount_cr'] = Variable<double>(amountCr.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KarigarPaymentsTableCompanion(')
          ..write('id: $id, ')
          ..write('karigarId: $karigarId, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('amountDr: $amountDr, ')
          ..write('amountCr: $amountCr, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $LedgerTableTable ledgerTable = $LedgerTableTable(this);
  late final $JournalEntriesTableTable journalEntriesTable =
      $JournalEntriesTableTable(this);
  late final $JournalEntryDetailsTableTable journalEntryDetailsTable =
      $JournalEntryDetailsTableTable(this);
  late final $DailyCashBalanceTableTable dailyCashBalanceTable =
      $DailyCashBalanceTableTable(this);
  late final $TradersTableTable tradersTable = $TradersTableTable(this);
  late final $ProductsTableTable productsTable = $ProductsTableTable(this);
  late final $PartyRatesTableTable partyRatesTable =
      $PartyRatesTableTable(this);
  late final $SalesTableTable salesTable = $SalesTableTable(this);
  late final $SalesLineItemsTableTable salesLineItemsTable =
      $SalesLineItemsTableTable(this);
  late final $ProcurementTableTable procurementTable =
      $ProcurementTableTable(this);
  late final $ProcurementLineItemsTableTable procurementLineItemsTable =
      $ProcurementLineItemsTableTable(this);
  late final $EmployeesTableTable employeesTable = $EmployeesTableTable(this);
  late final $AttendanceTableTable attendanceTable =
      $AttendanceTableTable(this);
  late final $EmployeePaymentsTableTable employeePaymentsTable =
      $EmployeePaymentsTableTable(this);
  late final $WorkTypesTableTable workTypesTable = $WorkTypesTableTable(this);
  late final $KarigarProductsTableTable karigarProductsTable =
      $KarigarProductsTableTable(this);
  late final $KarigarsTableTable karigarsTable = $KarigarsTableTable(this);
  late final $KarigarProductRatesTableTable karigarProductRatesTable =
      $KarigarProductRatesTableTable(this);
  late final $KarigarJobWorkTableTable karigarJobWorkTable =
      $KarigarJobWorkTableTable(this);
  late final $KarigarJobWorkLineItemsTableTable karigarJobWorkLineItemsTable =
      $KarigarJobWorkLineItemsTableTable(this);
  late final $JobWorkAllotmentsTableTable jobWorkAllotmentsTable =
      $JobWorkAllotmentsTableTable(this);
  late final $JobWorkReceiptsTableTable jobWorkReceiptsTable =
      $JobWorkReceiptsTableTable(this);
  late final $JobWorkReceiptLineItemsTableTable jobWorkReceiptLineItemsTable =
      $JobWorkReceiptLineItemsTableTable(this);
  late final $JobWorkRemarksTableTable jobWorkRemarksTable =
      $JobWorkRemarksTableTable(this);
  late final $KarigarPaymentsTableTable karigarPaymentsTable =
      $KarigarPaymentsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        usersTable,
        ledgerTable,
        journalEntriesTable,
        journalEntryDetailsTable,
        dailyCashBalanceTable,
        tradersTable,
        productsTable,
        partyRatesTable,
        salesTable,
        salesLineItemsTable,
        procurementTable,
        procurementLineItemsTable,
        employeesTable,
        attendanceTable,
        employeePaymentsTable,
        workTypesTable,
        karigarProductsTable,
        karigarsTable,
        karigarProductRatesTable,
        karigarJobWorkTable,
        karigarJobWorkLineItemsTable,
        jobWorkAllotmentsTable,
        jobWorkReceiptsTable,
        jobWorkReceiptLineItemsTable,
        jobWorkRemarksTable,
        karigarPaymentsTable
      ];
}

typedef $$UsersTableTableCreateCompanionBuilder = UsersTableCompanion Function({
  Value<int> id,
  required String email,
  required String username,
  required String password,
  required String fullName,
  Value<String?> gender,
  Value<String?> city,
  Value<String?> state,
  Value<DateTime?> lastLogin,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$UsersTableTableUpdateCompanionBuilder = UsersTableCompanion Function({
  Value<int> id,
  Value<String> email,
  Value<String> username,
  Value<String> password,
  Value<String> fullName,
  Value<String?> gender,
  Value<String?> city,
  Value<String?> state,
  Value<DateTime?> lastLogin,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$UsersTableTableFilterComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastLogin => $composableBuilder(
      column: $table.lastLogin, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$UsersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastLogin => $composableBuilder(
      column: $table.lastLogin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<DateTime> get lastLogin =>
      $composableBuilder(column: $table.lastLogin, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UsersTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTableTable,
    UsersTableData,
    $$UsersTableTableFilterComposer,
    $$UsersTableTableOrderingComposer,
    $$UsersTableTableAnnotationComposer,
    $$UsersTableTableCreateCompanionBuilder,
    $$UsersTableTableUpdateCompanionBuilder,
    (
      UsersTableData,
      BaseReferences<_$AppDatabase, $UsersTableTable, UsersTableData>
    ),
    UsersTableData,
    PrefetchHooks Function()> {
  $$UsersTableTableTableManager(_$AppDatabase db, $UsersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<DateTime?> lastLogin = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UsersTableCompanion(
            id: id,
            email: email,
            username: username,
            password: password,
            fullName: fullName,
            gender: gender,
            city: city,
            state: state,
            lastLogin: lastLogin,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String email,
            required String username,
            required String password,
            required String fullName,
            Value<String?> gender = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<DateTime?> lastLogin = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UsersTableCompanion.insert(
            id: id,
            email: email,
            username: username,
            password: password,
            fullName: fullName,
            gender: gender,
            city: city,
            state: state,
            lastLogin: lastLogin,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTableTable,
    UsersTableData,
    $$UsersTableTableFilterComposer,
    $$UsersTableTableOrderingComposer,
    $$UsersTableTableAnnotationComposer,
    $$UsersTableTableCreateCompanionBuilder,
    $$UsersTableTableUpdateCompanionBuilder,
    (
      UsersTableData,
      BaseReferences<_$AppDatabase, $UsersTableTable, UsersTableData>
    ),
    UsersTableData,
    PrefetchHooks Function()>;
typedef $$LedgerTableTableCreateCompanionBuilder = LedgerTableCompanion
    Function({
  Value<int> lid,
  required String accountType,
  required String accountName,
  Value<String> accountCode,
  Value<double> openingBalance,
  Value<int> dc,
  Value<String?> other,
  Value<String?> description,
  Value<double> currentBalance,
  Value<int> dcCurrent,
  Value<DateTime> transDate,
  Value<String> status,
  Value<DateTime> createdAt,
});
typedef $$LedgerTableTableUpdateCompanionBuilder = LedgerTableCompanion
    Function({
  Value<int> lid,
  Value<String> accountType,
  Value<String> accountName,
  Value<String> accountCode,
  Value<double> openingBalance,
  Value<int> dc,
  Value<String?> other,
  Value<String?> description,
  Value<double> currentBalance,
  Value<int> dcCurrent,
  Value<DateTime> transDate,
  Value<String> status,
  Value<DateTime> createdAt,
});

final class $$LedgerTableTableReferences
    extends BaseReferences<_$AppDatabase, $LedgerTableTable, LedgerTableData> {
  $$LedgerTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JournalEntryDetailsTableTable,
      List<JournalEntryDetailsTableData>> _journalEntryDetailsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.journalEntryDetailsTable,
          aliasName: $_aliasNameGenerator(
              db.ledgerTable.lid, db.journalEntryDetailsTable.accountId));

  $$JournalEntryDetailsTableTableProcessedTableManager
      get journalEntryDetailsTableRefs {
    final manager = $$JournalEntryDetailsTableTableTableManager(
            $_db, $_db.journalEntryDetailsTable)
        .filter((f) => f.accountId.lid.sqlEquals($_itemColumn<int>('lid')!));

    final cache =
        $_typedResult.readTableOrNull(_journalEntryDetailsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TradersTableTable, List<TradersTableData>>
      _tradersTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.tradersTable,
              aliasName: $_aliasNameGenerator(
                  db.ledgerTable.lid, db.tradersTable.ledgerId));

  $$TradersTableTableProcessedTableManager get tradersTableRefs {
    final manager = $$TradersTableTableTableManager($_db, $_db.tradersTable)
        .filter((f) => f.ledgerId.lid.sqlEquals($_itemColumn<int>('lid')!));

    final cache = $_typedResult.readTableOrNull(_tradersTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$LedgerTableTableFilterComposer
    extends Composer<_$AppDatabase, $LedgerTableTable> {
  $$LedgerTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get lid => $composableBuilder(
      column: $table.lid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountCode => $composableBuilder(
      column: $table.accountCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dc => $composableBuilder(
      column: $table.dc, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get other => $composableBuilder(
      column: $table.other, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dcCurrent => $composableBuilder(
      column: $table.dcCurrent, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get transDate => $composableBuilder(
      column: $table.transDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> journalEntryDetailsTableRefs(
      Expression<bool> Function($$JournalEntryDetailsTableTableFilterComposer f)
          f) {
    final $$JournalEntryDetailsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.lid,
            referencedTable: $db.journalEntryDetailsTable,
            getReferencedColumn: (t) => t.accountId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JournalEntryDetailsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.journalEntryDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> tradersTableRefs(
      Expression<bool> Function($$TradersTableTableFilterComposer f) f) {
    final $$TradersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.lid,
        referencedTable: $db.tradersTable,
        getReferencedColumn: (t) => t.ledgerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TradersTableTableFilterComposer(
              $db: $db,
              $table: $db.tradersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LedgerTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LedgerTableTable> {
  $$LedgerTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get lid => $composableBuilder(
      column: $table.lid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountCode => $composableBuilder(
      column: $table.accountCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dc => $composableBuilder(
      column: $table.dc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get other => $composableBuilder(
      column: $table.other, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dcCurrent => $composableBuilder(
      column: $table.dcCurrent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get transDate => $composableBuilder(
      column: $table.transDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$LedgerTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LedgerTableTable> {
  $$LedgerTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get lid =>
      $composableBuilder(column: $table.lid, builder: (column) => column);

  GeneratedColumn<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => column);

  GeneratedColumn<String> get accountName => $composableBuilder(
      column: $table.accountName, builder: (column) => column);

  GeneratedColumn<String> get accountCode => $composableBuilder(
      column: $table.accountCode, builder: (column) => column);

  GeneratedColumn<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance, builder: (column) => column);

  GeneratedColumn<int> get dc =>
      $composableBuilder(column: $table.dc, builder: (column) => column);

  GeneratedColumn<String> get other =>
      $composableBuilder(column: $table.other, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get currentBalance => $composableBuilder(
      column: $table.currentBalance, builder: (column) => column);

  GeneratedColumn<int> get dcCurrent =>
      $composableBuilder(column: $table.dcCurrent, builder: (column) => column);

  GeneratedColumn<DateTime> get transDate =>
      $composableBuilder(column: $table.transDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> journalEntryDetailsTableRefs<T extends Object>(
      Expression<T> Function(
              $$JournalEntryDetailsTableTableAnnotationComposer a)
          f) {
    final $$JournalEntryDetailsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.lid,
            referencedTable: $db.journalEntryDetailsTable,
            getReferencedColumn: (t) => t.accountId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JournalEntryDetailsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.journalEntryDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> tradersTableRefs<T extends Object>(
      Expression<T> Function($$TradersTableTableAnnotationComposer a) f) {
    final $$TradersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.lid,
        referencedTable: $db.tradersTable,
        getReferencedColumn: (t) => t.ledgerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TradersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.tradersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LedgerTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LedgerTableTable,
    LedgerTableData,
    $$LedgerTableTableFilterComposer,
    $$LedgerTableTableOrderingComposer,
    $$LedgerTableTableAnnotationComposer,
    $$LedgerTableTableCreateCompanionBuilder,
    $$LedgerTableTableUpdateCompanionBuilder,
    (LedgerTableData, $$LedgerTableTableReferences),
    LedgerTableData,
    PrefetchHooks Function(
        {bool journalEntryDetailsTableRefs, bool tradersTableRefs})> {
  $$LedgerTableTableTableManager(_$AppDatabase db, $LedgerTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LedgerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LedgerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LedgerTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> lid = const Value.absent(),
            Value<String> accountType = const Value.absent(),
            Value<String> accountName = const Value.absent(),
            Value<String> accountCode = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<int> dc = const Value.absent(),
            Value<String?> other = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<double> currentBalance = const Value.absent(),
            Value<int> dcCurrent = const Value.absent(),
            Value<DateTime> transDate = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              LedgerTableCompanion(
            lid: lid,
            accountType: accountType,
            accountName: accountName,
            accountCode: accountCode,
            openingBalance: openingBalance,
            dc: dc,
            other: other,
            description: description,
            currentBalance: currentBalance,
            dcCurrent: dcCurrent,
            transDate: transDate,
            status: status,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> lid = const Value.absent(),
            required String accountType,
            required String accountName,
            Value<String> accountCode = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<int> dc = const Value.absent(),
            Value<String?> other = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<double> currentBalance = const Value.absent(),
            Value<int> dcCurrent = const Value.absent(),
            Value<DateTime> transDate = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              LedgerTableCompanion.insert(
            lid: lid,
            accountType: accountType,
            accountName: accountName,
            accountCode: accountCode,
            openingBalance: openingBalance,
            dc: dc,
            other: other,
            description: description,
            currentBalance: currentBalance,
            dcCurrent: dcCurrent,
            transDate: transDate,
            status: status,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LedgerTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {journalEntryDetailsTableRefs = false,
              tradersTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (journalEntryDetailsTableRefs) db.journalEntryDetailsTable,
                if (tradersTableRefs) db.tradersTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (journalEntryDetailsTableRefs)
                    await $_getPrefetchedData<LedgerTableData,
                            $LedgerTableTable, JournalEntryDetailsTableData>(
                        currentTable: table,
                        referencedTable: $$LedgerTableTableReferences
                            ._journalEntryDetailsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$LedgerTableTableReferences(db, table, p0)
                                .journalEntryDetailsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.accountId == item.lid),
                        typedResults: items),
                  if (tradersTableRefs)
                    await $_getPrefetchedData<LedgerTableData,
                            $LedgerTableTable, TradersTableData>(
                        currentTable: table,
                        referencedTable: $$LedgerTableTableReferences
                            ._tradersTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$LedgerTableTableReferences(db, table, p0)
                                .tradersTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.ledgerId == item.lid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$LedgerTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LedgerTableTable,
    LedgerTableData,
    $$LedgerTableTableFilterComposer,
    $$LedgerTableTableOrderingComposer,
    $$LedgerTableTableAnnotationComposer,
    $$LedgerTableTableCreateCompanionBuilder,
    $$LedgerTableTableUpdateCompanionBuilder,
    (LedgerTableData, $$LedgerTableTableReferences),
    LedgerTableData,
    PrefetchHooks Function(
        {bool journalEntryDetailsTableRefs, bool tradersTableRefs})>;
typedef $$JournalEntriesTableTableCreateCompanionBuilder
    = JournalEntriesTableCompanion Function({
  Value<int> entryId,
  required String voucherType,
  required String voucherNo,
  required DateTime entryDate,
  Value<String?> narration,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$JournalEntriesTableTableUpdateCompanionBuilder
    = JournalEntriesTableCompanion Function({
  Value<int> entryId,
  Value<String> voucherType,
  Value<String> voucherNo,
  Value<DateTime> entryDate,
  Value<String?> narration,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$JournalEntriesTableTableReferences extends BaseReferences<
    _$AppDatabase, $JournalEntriesTableTable, JournalEntriesTableData> {
  $$JournalEntriesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JournalEntryDetailsTableTable,
      List<JournalEntryDetailsTableData>> _journalEntryDetailsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.journalEntryDetailsTable,
          aliasName: $_aliasNameGenerator(db.journalEntriesTable.entryId,
              db.journalEntryDetailsTable.entryId));

  $$JournalEntryDetailsTableTableProcessedTableManager
      get journalEntryDetailsTableRefs {
    final manager = $$JournalEntryDetailsTableTableTableManager(
            $_db, $_db.journalEntryDetailsTable)
        .filter(
            (f) => f.entryId.entryId.sqlEquals($_itemColumn<int>('entry_id')!));

    final cache =
        $_typedResult.readTableOrNull(_journalEntryDetailsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$JournalEntriesTableTableFilterComposer
    extends Composer<_$AppDatabase, $JournalEntriesTableTable> {
  $$JournalEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get entryId => $composableBuilder(
      column: $table.entryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get voucherType => $composableBuilder(
      column: $table.voucherType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get voucherNo => $composableBuilder(
      column: $table.voucherNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get entryDate => $composableBuilder(
      column: $table.entryDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get narration => $composableBuilder(
      column: $table.narration, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> journalEntryDetailsTableRefs(
      Expression<bool> Function($$JournalEntryDetailsTableTableFilterComposer f)
          f) {
    final $$JournalEntryDetailsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.entryId,
            referencedTable: $db.journalEntryDetailsTable,
            getReferencedColumn: (t) => t.entryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JournalEntryDetailsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.journalEntryDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$JournalEntriesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalEntriesTableTable> {
  $$JournalEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get entryId => $composableBuilder(
      column: $table.entryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get voucherType => $composableBuilder(
      column: $table.voucherType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get voucherNo => $composableBuilder(
      column: $table.voucherNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get entryDate => $composableBuilder(
      column: $table.entryDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get narration => $composableBuilder(
      column: $table.narration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$JournalEntriesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalEntriesTableTable> {
  $$JournalEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get entryId =>
      $composableBuilder(column: $table.entryId, builder: (column) => column);

  GeneratedColumn<String> get voucherType => $composableBuilder(
      column: $table.voucherType, builder: (column) => column);

  GeneratedColumn<String> get voucherNo =>
      $composableBuilder(column: $table.voucherNo, builder: (column) => column);

  GeneratedColumn<DateTime> get entryDate =>
      $composableBuilder(column: $table.entryDate, builder: (column) => column);

  GeneratedColumn<String> get narration =>
      $composableBuilder(column: $table.narration, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> journalEntryDetailsTableRefs<T extends Object>(
      Expression<T> Function(
              $$JournalEntryDetailsTableTableAnnotationComposer a)
          f) {
    final $$JournalEntryDetailsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.entryId,
            referencedTable: $db.journalEntryDetailsTable,
            getReferencedColumn: (t) => t.entryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JournalEntryDetailsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.journalEntryDetailsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$JournalEntriesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JournalEntriesTableTable,
    JournalEntriesTableData,
    $$JournalEntriesTableTableFilterComposer,
    $$JournalEntriesTableTableOrderingComposer,
    $$JournalEntriesTableTableAnnotationComposer,
    $$JournalEntriesTableTableCreateCompanionBuilder,
    $$JournalEntriesTableTableUpdateCompanionBuilder,
    (JournalEntriesTableData, $$JournalEntriesTableTableReferences),
    JournalEntriesTableData,
    PrefetchHooks Function({bool journalEntryDetailsTableRefs})> {
  $$JournalEntriesTableTableTableManager(
      _$AppDatabase db, $JournalEntriesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntriesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntriesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntriesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> entryId = const Value.absent(),
            Value<String> voucherType = const Value.absent(),
            Value<String> voucherNo = const Value.absent(),
            Value<DateTime> entryDate = const Value.absent(),
            Value<String?> narration = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              JournalEntriesTableCompanion(
            entryId: entryId,
            voucherType: voucherType,
            voucherNo: voucherNo,
            entryDate: entryDate,
            narration: narration,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> entryId = const Value.absent(),
            required String voucherType,
            required String voucherNo,
            required DateTime entryDate,
            Value<String?> narration = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              JournalEntriesTableCompanion.insert(
            entryId: entryId,
            voucherType: voucherType,
            voucherNo: voucherNo,
            entryDate: entryDate,
            narration: narration,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$JournalEntriesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({journalEntryDetailsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (journalEntryDetailsTableRefs) db.journalEntryDetailsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (journalEntryDetailsTableRefs)
                    await $_getPrefetchedData<
                            JournalEntriesTableData,
                            $JournalEntriesTableTable,
                            JournalEntryDetailsTableData>(
                        currentTable: table,
                        referencedTable: $$JournalEntriesTableTableReferences
                            ._journalEntryDetailsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$JournalEntriesTableTableReferences(db, table, p0)
                                .journalEntryDetailsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.entryId == item.entryId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$JournalEntriesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JournalEntriesTableTable,
    JournalEntriesTableData,
    $$JournalEntriesTableTableFilterComposer,
    $$JournalEntriesTableTableOrderingComposer,
    $$JournalEntriesTableTableAnnotationComposer,
    $$JournalEntriesTableTableCreateCompanionBuilder,
    $$JournalEntriesTableTableUpdateCompanionBuilder,
    (JournalEntriesTableData, $$JournalEntriesTableTableReferences),
    JournalEntriesTableData,
    PrefetchHooks Function({bool journalEntryDetailsTableRefs})>;
typedef $$JournalEntryDetailsTableTableCreateCompanionBuilder
    = JournalEntryDetailsTableCompanion Function({
  Value<int> detailId,
  required int entryId,
  required int accountId,
  Value<double> debit,
  Value<double> credit,
});
typedef $$JournalEntryDetailsTableTableUpdateCompanionBuilder
    = JournalEntryDetailsTableCompanion Function({
  Value<int> detailId,
  Value<int> entryId,
  Value<int> accountId,
  Value<double> debit,
  Value<double> credit,
});

final class $$JournalEntryDetailsTableTableReferences extends BaseReferences<
    _$AppDatabase,
    $JournalEntryDetailsTableTable,
    JournalEntryDetailsTableData> {
  $$JournalEntryDetailsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $JournalEntriesTableTable _entryIdTable(_$AppDatabase db) =>
      db.journalEntriesTable.createAlias($_aliasNameGenerator(
          db.journalEntryDetailsTable.entryId, db.journalEntriesTable.entryId));

  $$JournalEntriesTableTableProcessedTableManager get entryId {
    final $_column = $_itemColumn<int>('entry_id')!;

    final manager =
        $$JournalEntriesTableTableTableManager($_db, $_db.journalEntriesTable)
            .filter((f) => f.entryId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_entryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $LedgerTableTable _accountIdTable(_$AppDatabase db) =>
      db.ledgerTable.createAlias($_aliasNameGenerator(
          db.journalEntryDetailsTable.accountId, db.ledgerTable.lid));

  $$LedgerTableTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$LedgerTableTableTableManager($_db, $_db.ledgerTable)
        .filter((f) => f.lid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$JournalEntryDetailsTableTableFilterComposer
    extends Composer<_$AppDatabase, $JournalEntryDetailsTableTable> {
  $$JournalEntryDetailsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get detailId => $composableBuilder(
      column: $table.detailId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get debit => $composableBuilder(
      column: $table.debit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get credit => $composableBuilder(
      column: $table.credit, builder: (column) => ColumnFilters(column));

  $$JournalEntriesTableTableFilterComposer get entryId {
    final $$JournalEntriesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.entryId,
        referencedTable: $db.journalEntriesTable,
        getReferencedColumn: (t) => t.entryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JournalEntriesTableTableFilterComposer(
              $db: $db,
              $table: $db.journalEntriesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$LedgerTableTableFilterComposer get accountId {
    final $$LedgerTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.ledgerTable,
        getReferencedColumn: (t) => t.lid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LedgerTableTableFilterComposer(
              $db: $db,
              $table: $db.ledgerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JournalEntryDetailsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $JournalEntryDetailsTableTable> {
  $$JournalEntryDetailsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get detailId => $composableBuilder(
      column: $table.detailId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get debit => $composableBuilder(
      column: $table.debit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get credit => $composableBuilder(
      column: $table.credit, builder: (column) => ColumnOrderings(column));

  $$JournalEntriesTableTableOrderingComposer get entryId {
    final $$JournalEntriesTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.entryId,
            referencedTable: $db.journalEntriesTable,
            getReferencedColumn: (t) => t.entryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JournalEntriesTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.journalEntriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$LedgerTableTableOrderingComposer get accountId {
    final $$LedgerTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.ledgerTable,
        getReferencedColumn: (t) => t.lid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LedgerTableTableOrderingComposer(
              $db: $db,
              $table: $db.ledgerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JournalEntryDetailsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $JournalEntryDetailsTableTable> {
  $$JournalEntryDetailsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get detailId =>
      $composableBuilder(column: $table.detailId, builder: (column) => column);

  GeneratedColumn<double> get debit =>
      $composableBuilder(column: $table.debit, builder: (column) => column);

  GeneratedColumn<double> get credit =>
      $composableBuilder(column: $table.credit, builder: (column) => column);

  $$JournalEntriesTableTableAnnotationComposer get entryId {
    final $$JournalEntriesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.entryId,
            referencedTable: $db.journalEntriesTable,
            getReferencedColumn: (t) => t.entryId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JournalEntriesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.journalEntriesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$LedgerTableTableAnnotationComposer get accountId {
    final $$LedgerTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.ledgerTable,
        getReferencedColumn: (t) => t.lid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LedgerTableTableAnnotationComposer(
              $db: $db,
              $table: $db.ledgerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JournalEntryDetailsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JournalEntryDetailsTableTable,
    JournalEntryDetailsTableData,
    $$JournalEntryDetailsTableTableFilterComposer,
    $$JournalEntryDetailsTableTableOrderingComposer,
    $$JournalEntryDetailsTableTableAnnotationComposer,
    $$JournalEntryDetailsTableTableCreateCompanionBuilder,
    $$JournalEntryDetailsTableTableUpdateCompanionBuilder,
    (JournalEntryDetailsTableData, $$JournalEntryDetailsTableTableReferences),
    JournalEntryDetailsTableData,
    PrefetchHooks Function({bool entryId, bool accountId})> {
  $$JournalEntryDetailsTableTableTableManager(
      _$AppDatabase db, $JournalEntryDetailsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JournalEntryDetailsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$JournalEntryDetailsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JournalEntryDetailsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> detailId = const Value.absent(),
            Value<int> entryId = const Value.absent(),
            Value<int> accountId = const Value.absent(),
            Value<double> debit = const Value.absent(),
            Value<double> credit = const Value.absent(),
          }) =>
              JournalEntryDetailsTableCompanion(
            detailId: detailId,
            entryId: entryId,
            accountId: accountId,
            debit: debit,
            credit: credit,
          ),
          createCompanionCallback: ({
            Value<int> detailId = const Value.absent(),
            required int entryId,
            required int accountId,
            Value<double> debit = const Value.absent(),
            Value<double> credit = const Value.absent(),
          }) =>
              JournalEntryDetailsTableCompanion.insert(
            detailId: detailId,
            entryId: entryId,
            accountId: accountId,
            debit: debit,
            credit: credit,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$JournalEntryDetailsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({entryId = false, accountId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (entryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.entryId,
                    referencedTable: $$JournalEntryDetailsTableTableReferences
                        ._entryIdTable(db),
                    referencedColumn: $$JournalEntryDetailsTableTableReferences
                        ._entryIdTable(db)
                        .entryId,
                  ) as T;
                }
                if (accountId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountId,
                    referencedTable: $$JournalEntryDetailsTableTableReferences
                        ._accountIdTable(db),
                    referencedColumn: $$JournalEntryDetailsTableTableReferences
                        ._accountIdTable(db)
                        .lid,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$JournalEntryDetailsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $JournalEntryDetailsTableTable,
        JournalEntryDetailsTableData,
        $$JournalEntryDetailsTableTableFilterComposer,
        $$JournalEntryDetailsTableTableOrderingComposer,
        $$JournalEntryDetailsTableTableAnnotationComposer,
        $$JournalEntryDetailsTableTableCreateCompanionBuilder,
        $$JournalEntryDetailsTableTableUpdateCompanionBuilder,
        (
          JournalEntryDetailsTableData,
          $$JournalEntryDetailsTableTableReferences
        ),
        JournalEntryDetailsTableData,
        PrefetchHooks Function({bool entryId, bool accountId})>;
typedef $$DailyCashBalanceTableTableCreateCompanionBuilder
    = DailyCashBalanceTableCompanion Function({
  Value<int> id,
  required DateTime balanceDate,
  Value<double> openingBalance,
  Value<double> closingBalance,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$DailyCashBalanceTableTableUpdateCompanionBuilder
    = DailyCashBalanceTableCompanion Function({
  Value<int> id,
  Value<DateTime> balanceDate,
  Value<double> openingBalance,
  Value<double> closingBalance,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$DailyCashBalanceTableTableFilterComposer
    extends Composer<_$AppDatabase, $DailyCashBalanceTableTable> {
  $$DailyCashBalanceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get balanceDate => $composableBuilder(
      column: $table.balanceDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get closingBalance => $composableBuilder(
      column: $table.closingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$DailyCashBalanceTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyCashBalanceTableTable> {
  $$DailyCashBalanceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get balanceDate => $composableBuilder(
      column: $table.balanceDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get closingBalance => $composableBuilder(
      column: $table.closingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$DailyCashBalanceTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyCashBalanceTableTable> {
  $$DailyCashBalanceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get balanceDate => $composableBuilder(
      column: $table.balanceDate, builder: (column) => column);

  GeneratedColumn<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance, builder: (column) => column);

  GeneratedColumn<double> get closingBalance => $composableBuilder(
      column: $table.closingBalance, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DailyCashBalanceTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DailyCashBalanceTableTable,
    DailyCashBalanceTableData,
    $$DailyCashBalanceTableTableFilterComposer,
    $$DailyCashBalanceTableTableOrderingComposer,
    $$DailyCashBalanceTableTableAnnotationComposer,
    $$DailyCashBalanceTableTableCreateCompanionBuilder,
    $$DailyCashBalanceTableTableUpdateCompanionBuilder,
    (
      DailyCashBalanceTableData,
      BaseReferences<_$AppDatabase, $DailyCashBalanceTableTable,
          DailyCashBalanceTableData>
    ),
    DailyCashBalanceTableData,
    PrefetchHooks Function()> {
  $$DailyCashBalanceTableTableTableManager(
      _$AppDatabase db, $DailyCashBalanceTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyCashBalanceTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyCashBalanceTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyCashBalanceTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> balanceDate = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<double> closingBalance = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DailyCashBalanceTableCompanion(
            id: id,
            balanceDate: balanceDate,
            openingBalance: openingBalance,
            closingBalance: closingBalance,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime balanceDate,
            Value<double> openingBalance = const Value.absent(),
            Value<double> closingBalance = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              DailyCashBalanceTableCompanion.insert(
            id: id,
            balanceDate: balanceDate,
            openingBalance: openingBalance,
            closingBalance: closingBalance,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DailyCashBalanceTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $DailyCashBalanceTableTable,
        DailyCashBalanceTableData,
        $$DailyCashBalanceTableTableFilterComposer,
        $$DailyCashBalanceTableTableOrderingComposer,
        $$DailyCashBalanceTableTableAnnotationComposer,
        $$DailyCashBalanceTableTableCreateCompanionBuilder,
        $$DailyCashBalanceTableTableUpdateCompanionBuilder,
        (
          DailyCashBalanceTableData,
          BaseReferences<_$AppDatabase, $DailyCashBalanceTableTable,
              DailyCashBalanceTableData>
        ),
        DailyCashBalanceTableData,
        PrefetchHooks Function()>;
typedef $$TradersTableTableCreateCompanionBuilder = TradersTableCompanion
    Function({
  Value<int> id,
  required String traderCode,
  required int ledgerId,
  required String traderName,
  required String traderType,
  Value<String?> gstin,
  Value<String?> panCard,
  Value<String?> phone,
  Value<String?> telephone,
  Value<String?> email,
  Value<String?> address,
  Value<String?> city,
  Value<String?> state,
  Value<String?> pincode,
  Value<String> status,
  Value<DateTime> createdAt,
});
typedef $$TradersTableTableUpdateCompanionBuilder = TradersTableCompanion
    Function({
  Value<int> id,
  Value<String> traderCode,
  Value<int> ledgerId,
  Value<String> traderName,
  Value<String> traderType,
  Value<String?> gstin,
  Value<String?> panCard,
  Value<String?> phone,
  Value<String?> telephone,
  Value<String?> email,
  Value<String?> address,
  Value<String?> city,
  Value<String?> state,
  Value<String?> pincode,
  Value<String> status,
  Value<DateTime> createdAt,
});

final class $$TradersTableTableReferences extends BaseReferences<_$AppDatabase,
    $TradersTableTable, TradersTableData> {
  $$TradersTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LedgerTableTable _ledgerIdTable(_$AppDatabase db) =>
      db.ledgerTable.createAlias(
          $_aliasNameGenerator(db.tradersTable.ledgerId, db.ledgerTable.lid));

  $$LedgerTableTableProcessedTableManager get ledgerId {
    final $_column = $_itemColumn<int>('ledger_id')!;

    final manager = $$LedgerTableTableTableManager($_db, $_db.ledgerTable)
        .filter((f) => f.lid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ledgerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PartyRatesTableTable, List<PartyRatesTableData>>
      _partyRatesTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.partyRatesTable,
              aliasName: $_aliasNameGenerator(
                  db.tradersTable.id, db.partyRatesTable.partyId));

  $$PartyRatesTableTableProcessedTableManager get partyRatesTableRefs {
    final manager =
        $$PartyRatesTableTableTableManager($_db, $_db.partyRatesTable)
            .filter((f) => f.partyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_partyRatesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$SalesTableTable, List<SalesTableData>>
      _salesTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.salesTable,
          aliasName:
              $_aliasNameGenerator(db.tradersTable.id, db.salesTable.traderId));

  $$SalesTableTableProcessedTableManager get salesTableRefs {
    final manager = $$SalesTableTableTableManager($_db, $_db.salesTable)
        .filter((f) => f.traderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_salesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ProcurementTableTable, List<ProcurementTableData>>
      _procurementTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.procurementTable,
              aliasName: $_aliasNameGenerator(
                  db.tradersTable.id, db.procurementTable.traderId));

  $$ProcurementTableTableProcessedTableManager get procurementTableRefs {
    final manager =
        $$ProcurementTableTableTableManager($_db, $_db.procurementTable)
            .filter((f) => f.traderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_procurementTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TradersTableTableFilterComposer
    extends Composer<_$AppDatabase, $TradersTableTable> {
  $$TradersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get traderCode => $composableBuilder(
      column: $table.traderCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get traderName => $composableBuilder(
      column: $table.traderName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get traderType => $composableBuilder(
      column: $table.traderType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gstin => $composableBuilder(
      column: $table.gstin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get panCard => $composableBuilder(
      column: $table.panCard, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get telephone => $composableBuilder(
      column: $table.telephone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pincode => $composableBuilder(
      column: $table.pincode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$LedgerTableTableFilterComposer get ledgerId {
    final $$LedgerTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ledgerId,
        referencedTable: $db.ledgerTable,
        getReferencedColumn: (t) => t.lid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LedgerTableTableFilterComposer(
              $db: $db,
              $table: $db.ledgerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> partyRatesTableRefs(
      Expression<bool> Function($$PartyRatesTableTableFilterComposer f) f) {
    final $$PartyRatesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.partyRatesTable,
        getReferencedColumn: (t) => t.partyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PartyRatesTableTableFilterComposer(
              $db: $db,
              $table: $db.partyRatesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> salesTableRefs(
      Expression<bool> Function($$SalesTableTableFilterComposer f) f) {
    final $$SalesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.salesTable,
        getReferencedColumn: (t) => t.traderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SalesTableTableFilterComposer(
              $db: $db,
              $table: $db.salesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> procurementTableRefs(
      Expression<bool> Function($$ProcurementTableTableFilterComposer f) f) {
    final $$ProcurementTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.procurementTable,
        getReferencedColumn: (t) => t.traderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProcurementTableTableFilterComposer(
              $db: $db,
              $table: $db.procurementTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TradersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TradersTableTable> {
  $$TradersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get traderCode => $composableBuilder(
      column: $table.traderCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get traderName => $composableBuilder(
      column: $table.traderName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get traderType => $composableBuilder(
      column: $table.traderType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gstin => $composableBuilder(
      column: $table.gstin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get panCard => $composableBuilder(
      column: $table.panCard, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get telephone => $composableBuilder(
      column: $table.telephone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pincode => $composableBuilder(
      column: $table.pincode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$LedgerTableTableOrderingComposer get ledgerId {
    final $$LedgerTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ledgerId,
        referencedTable: $db.ledgerTable,
        getReferencedColumn: (t) => t.lid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LedgerTableTableOrderingComposer(
              $db: $db,
              $table: $db.ledgerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TradersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TradersTableTable> {
  $$TradersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get traderCode => $composableBuilder(
      column: $table.traderCode, builder: (column) => column);

  GeneratedColumn<String> get traderName => $composableBuilder(
      column: $table.traderName, builder: (column) => column);

  GeneratedColumn<String> get traderType => $composableBuilder(
      column: $table.traderType, builder: (column) => column);

  GeneratedColumn<String> get gstin =>
      $composableBuilder(column: $table.gstin, builder: (column) => column);

  GeneratedColumn<String> get panCard =>
      $composableBuilder(column: $table.panCard, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get telephone =>
      $composableBuilder(column: $table.telephone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get pincode =>
      $composableBuilder(column: $table.pincode, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$LedgerTableTableAnnotationComposer get ledgerId {
    final $$LedgerTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ledgerId,
        referencedTable: $db.ledgerTable,
        getReferencedColumn: (t) => t.lid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LedgerTableTableAnnotationComposer(
              $db: $db,
              $table: $db.ledgerTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> partyRatesTableRefs<T extends Object>(
      Expression<T> Function($$PartyRatesTableTableAnnotationComposer a) f) {
    final $$PartyRatesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.partyRatesTable,
        getReferencedColumn: (t) => t.partyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PartyRatesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.partyRatesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> salesTableRefs<T extends Object>(
      Expression<T> Function($$SalesTableTableAnnotationComposer a) f) {
    final $$SalesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.salesTable,
        getReferencedColumn: (t) => t.traderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SalesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.salesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> procurementTableRefs<T extends Object>(
      Expression<T> Function($$ProcurementTableTableAnnotationComposer a) f) {
    final $$ProcurementTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.procurementTable,
        getReferencedColumn: (t) => t.traderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProcurementTableTableAnnotationComposer(
              $db: $db,
              $table: $db.procurementTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TradersTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TradersTableTable,
    TradersTableData,
    $$TradersTableTableFilterComposer,
    $$TradersTableTableOrderingComposer,
    $$TradersTableTableAnnotationComposer,
    $$TradersTableTableCreateCompanionBuilder,
    $$TradersTableTableUpdateCompanionBuilder,
    (TradersTableData, $$TradersTableTableReferences),
    TradersTableData,
    PrefetchHooks Function(
        {bool ledgerId,
        bool partyRatesTableRefs,
        bool salesTableRefs,
        bool procurementTableRefs})> {
  $$TradersTableTableTableManager(_$AppDatabase db, $TradersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TradersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TradersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TradersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> traderCode = const Value.absent(),
            Value<int> ledgerId = const Value.absent(),
            Value<String> traderName = const Value.absent(),
            Value<String> traderType = const Value.absent(),
            Value<String?> gstin = const Value.absent(),
            Value<String?> panCard = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> telephone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<String?> pincode = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TradersTableCompanion(
            id: id,
            traderCode: traderCode,
            ledgerId: ledgerId,
            traderName: traderName,
            traderType: traderType,
            gstin: gstin,
            panCard: panCard,
            phone: phone,
            telephone: telephone,
            email: email,
            address: address,
            city: city,
            state: state,
            pincode: pincode,
            status: status,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String traderCode,
            required int ledgerId,
            required String traderName,
            required String traderType,
            Value<String?> gstin = const Value.absent(),
            Value<String?> panCard = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> telephone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<String?> pincode = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              TradersTableCompanion.insert(
            id: id,
            traderCode: traderCode,
            ledgerId: ledgerId,
            traderName: traderName,
            traderType: traderType,
            gstin: gstin,
            panCard: panCard,
            phone: phone,
            telephone: telephone,
            email: email,
            address: address,
            city: city,
            state: state,
            pincode: pincode,
            status: status,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TradersTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {ledgerId = false,
              partyRatesTableRefs = false,
              salesTableRefs = false,
              procurementTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (partyRatesTableRefs) db.partyRatesTable,
                if (salesTableRefs) db.salesTable,
                if (procurementTableRefs) db.procurementTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (ledgerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.ledgerId,
                    referencedTable:
                        $$TradersTableTableReferences._ledgerIdTable(db),
                    referencedColumn:
                        $$TradersTableTableReferences._ledgerIdTable(db).lid,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (partyRatesTableRefs)
                    await $_getPrefetchedData<TradersTableData,
                            $TradersTableTable, PartyRatesTableData>(
                        currentTable: table,
                        referencedTable: $$TradersTableTableReferences
                            ._partyRatesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TradersTableTableReferences(db, table, p0)
                                .partyRatesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.partyId == item.id),
                        typedResults: items),
                  if (salesTableRefs)
                    await $_getPrefetchedData<TradersTableData,
                            $TradersTableTable, SalesTableData>(
                        currentTable: table,
                        referencedTable: $$TradersTableTableReferences
                            ._salesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TradersTableTableReferences(db, table, p0)
                                .salesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.traderId == item.id),
                        typedResults: items),
                  if (procurementTableRefs)
                    await $_getPrefetchedData<TradersTableData,
                            $TradersTableTable, ProcurementTableData>(
                        currentTable: table,
                        referencedTable: $$TradersTableTableReferences
                            ._procurementTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TradersTableTableReferences(db, table, p0)
                                .procurementTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.traderId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TradersTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TradersTableTable,
    TradersTableData,
    $$TradersTableTableFilterComposer,
    $$TradersTableTableOrderingComposer,
    $$TradersTableTableAnnotationComposer,
    $$TradersTableTableCreateCompanionBuilder,
    $$TradersTableTableUpdateCompanionBuilder,
    (TradersTableData, $$TradersTableTableReferences),
    TradersTableData,
    PrefetchHooks Function(
        {bool ledgerId,
        bool partyRatesTableRefs,
        bool salesTableRefs,
        bool procurementTableRefs})>;
typedef $$ProductsTableTableCreateCompanionBuilder = ProductsTableCompanion
    Function({
  Value<int> pid,
  required String productCode,
  required String productName,
  Value<double> basePrice,
  required String units,
  required String transactionType,
  Value<String> status,
  Value<DateTime> createdAt,
});
typedef $$ProductsTableTableUpdateCompanionBuilder = ProductsTableCompanion
    Function({
  Value<int> pid,
  Value<String> productCode,
  Value<String> productName,
  Value<double> basePrice,
  Value<String> units,
  Value<String> transactionType,
  Value<String> status,
  Value<DateTime> createdAt,
});

final class $$ProductsTableTableReferences extends BaseReferences<_$AppDatabase,
    $ProductsTableTable, ProductsTableData> {
  $$ProductsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PartyRatesTableTable, List<PartyRatesTableData>>
      _partyRatesTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.partyRatesTable,
              aliasName: $_aliasNameGenerator(
                  db.productsTable.pid, db.partyRatesTable.productId));

  $$PartyRatesTableTableProcessedTableManager get partyRatesTableRefs {
    final manager = $$PartyRatesTableTableTableManager(
            $_db, $_db.partyRatesTable)
        .filter((f) => f.productId.pid.sqlEquals($_itemColumn<int>('pid')!));

    final cache =
        $_typedResult.readTableOrNull(_partyRatesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$SalesLineItemsTableTable,
      List<SalesLineItemsTableData>> _salesLineItemsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.salesLineItemsTable,
          aliasName: $_aliasNameGenerator(
              db.productsTable.pid, db.salesLineItemsTable.productId));

  $$SalesLineItemsTableTableProcessedTableManager get salesLineItemsTableRefs {
    final manager = $$SalesLineItemsTableTableTableManager(
            $_db, $_db.salesLineItemsTable)
        .filter((f) => f.productId.pid.sqlEquals($_itemColumn<int>('pid')!));

    final cache =
        $_typedResult.readTableOrNull(_salesLineItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ProcurementLineItemsTableTable,
      List<ProcurementLineItemsTableData>> _procurementLineItemsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.procurementLineItemsTable,
          aliasName: $_aliasNameGenerator(
              db.productsTable.pid, db.procurementLineItemsTable.productId));

  $$ProcurementLineItemsTableTableProcessedTableManager
      get procurementLineItemsTableRefs {
    final manager = $$ProcurementLineItemsTableTableTableManager(
            $_db, $_db.procurementLineItemsTable)
        .filter((f) => f.productId.pid.sqlEquals($_itemColumn<int>('pid')!));

    final cache = $_typedResult
        .readTableOrNull(_procurementLineItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get pid => $composableBuilder(
      column: $table.pid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productCode => $composableBuilder(
      column: $table.productCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get basePrice => $composableBuilder(
      column: $table.basePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get units => $composableBuilder(
      column: $table.units, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionType => $composableBuilder(
      column: $table.transactionType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> partyRatesTableRefs(
      Expression<bool> Function($$PartyRatesTableTableFilterComposer f) f) {
    final $$PartyRatesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pid,
        referencedTable: $db.partyRatesTable,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PartyRatesTableTableFilterComposer(
              $db: $db,
              $table: $db.partyRatesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> salesLineItemsTableRefs(
      Expression<bool> Function($$SalesLineItemsTableTableFilterComposer f) f) {
    final $$SalesLineItemsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pid,
        referencedTable: $db.salesLineItemsTable,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SalesLineItemsTableTableFilterComposer(
              $db: $db,
              $table: $db.salesLineItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> procurementLineItemsTableRefs(
      Expression<bool> Function(
              $$ProcurementLineItemsTableTableFilterComposer f)
          f) {
    final $$ProcurementLineItemsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.pid,
            referencedTable: $db.procurementLineItemsTable,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProcurementLineItemsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.procurementLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get pid => $composableBuilder(
      column: $table.pid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productCode => $composableBuilder(
      column: $table.productCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get basePrice => $composableBuilder(
      column: $table.basePrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get units => $composableBuilder(
      column: $table.units, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionType => $composableBuilder(
      column: $table.transactionType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTableTable> {
  $$ProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pid =>
      $composableBuilder(column: $table.pid, builder: (column) => column);

  GeneratedColumn<String> get productCode => $composableBuilder(
      column: $table.productCode, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => column);

  GeneratedColumn<double> get basePrice =>
      $composableBuilder(column: $table.basePrice, builder: (column) => column);

  GeneratedColumn<String> get units =>
      $composableBuilder(column: $table.units, builder: (column) => column);

  GeneratedColumn<String> get transactionType => $composableBuilder(
      column: $table.transactionType, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> partyRatesTableRefs<T extends Object>(
      Expression<T> Function($$PartyRatesTableTableAnnotationComposer a) f) {
    final $$PartyRatesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pid,
        referencedTable: $db.partyRatesTable,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PartyRatesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.partyRatesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> salesLineItemsTableRefs<T extends Object>(
      Expression<T> Function($$SalesLineItemsTableTableAnnotationComposer a)
          f) {
    final $$SalesLineItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.pid,
            referencedTable: $db.salesLineItemsTable,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$SalesLineItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.salesLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> procurementLineItemsTableRefs<T extends Object>(
      Expression<T> Function(
              $$ProcurementLineItemsTableTableAnnotationComposer a)
          f) {
    final $$ProcurementLineItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.pid,
            referencedTable: $db.procurementLineItemsTable,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProcurementLineItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.procurementLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ProductsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsTableTable,
    ProductsTableData,
    $$ProductsTableTableFilterComposer,
    $$ProductsTableTableOrderingComposer,
    $$ProductsTableTableAnnotationComposer,
    $$ProductsTableTableCreateCompanionBuilder,
    $$ProductsTableTableUpdateCompanionBuilder,
    (ProductsTableData, $$ProductsTableTableReferences),
    ProductsTableData,
    PrefetchHooks Function(
        {bool partyRatesTableRefs,
        bool salesLineItemsTableRefs,
        bool procurementLineItemsTableRefs})> {
  $$ProductsTableTableTableManager(_$AppDatabase db, $ProductsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> pid = const Value.absent(),
            Value<String> productCode = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<double> basePrice = const Value.absent(),
            Value<String> units = const Value.absent(),
            Value<String> transactionType = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ProductsTableCompanion(
            pid: pid,
            productCode: productCode,
            productName: productName,
            basePrice: basePrice,
            units: units,
            transactionType: transactionType,
            status: status,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> pid = const Value.absent(),
            required String productCode,
            required String productName,
            Value<double> basePrice = const Value.absent(),
            required String units,
            required String transactionType,
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ProductsTableCompanion.insert(
            pid: pid,
            productCode: productCode,
            productName: productName,
            basePrice: basePrice,
            units: units,
            transactionType: transactionType,
            status: status,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {partyRatesTableRefs = false,
              salesLineItemsTableRefs = false,
              procurementLineItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (partyRatesTableRefs) db.partyRatesTable,
                if (salesLineItemsTableRefs) db.salesLineItemsTable,
                if (procurementLineItemsTableRefs) db.procurementLineItemsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (partyRatesTableRefs)
                    await $_getPrefetchedData<ProductsTableData,
                            $ProductsTableTable, PartyRatesTableData>(
                        currentTable: table,
                        referencedTable: $$ProductsTableTableReferences
                            ._partyRatesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableTableReferences(db, table, p0)
                                .partyRatesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.pid),
                        typedResults: items),
                  if (salesLineItemsTableRefs)
                    await $_getPrefetchedData<ProductsTableData,
                            $ProductsTableTable, SalesLineItemsTableData>(
                        currentTable: table,
                        referencedTable: $$ProductsTableTableReferences
                            ._salesLineItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableTableReferences(db, table, p0)
                                .salesLineItemsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.pid),
                        typedResults: items),
                  if (procurementLineItemsTableRefs)
                    await $_getPrefetchedData<ProductsTableData,
                            $ProductsTableTable, ProcurementLineItemsTableData>(
                        currentTable: table,
                        referencedTable: $$ProductsTableTableReferences
                            ._procurementLineItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsTableTableReferences(db, table, p0)
                                .procurementLineItemsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.pid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsTableTable,
    ProductsTableData,
    $$ProductsTableTableFilterComposer,
    $$ProductsTableTableOrderingComposer,
    $$ProductsTableTableAnnotationComposer,
    $$ProductsTableTableCreateCompanionBuilder,
    $$ProductsTableTableUpdateCompanionBuilder,
    (ProductsTableData, $$ProductsTableTableReferences),
    ProductsTableData,
    PrefetchHooks Function(
        {bool partyRatesTableRefs,
        bool salesLineItemsTableRefs,
        bool procurementLineItemsTableRefs})>;
typedef $$PartyRatesTableTableCreateCompanionBuilder = PartyRatesTableCompanion
    Function({
  Value<int> id,
  required int partyId,
  required int productId,
  required String unit,
  required double rate,
});
typedef $$PartyRatesTableTableUpdateCompanionBuilder = PartyRatesTableCompanion
    Function({
  Value<int> id,
  Value<int> partyId,
  Value<int> productId,
  Value<String> unit,
  Value<double> rate,
});

final class $$PartyRatesTableTableReferences extends BaseReferences<
    _$AppDatabase, $PartyRatesTableTable, PartyRatesTableData> {
  $$PartyRatesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TradersTableTable _partyIdTable(_$AppDatabase db) =>
      db.tradersTable.createAlias(
          $_aliasNameGenerator(db.partyRatesTable.partyId, db.tradersTable.id));

  $$TradersTableTableProcessedTableManager get partyId {
    final $_column = $_itemColumn<int>('party_id')!;

    final manager = $$TradersTableTableTableManager($_db, $_db.tradersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_partyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ProductsTableTable _productIdTable(_$AppDatabase db) =>
      db.productsTable.createAlias($_aliasNameGenerator(
          db.partyRatesTable.productId, db.productsTable.pid));

  $$ProductsTableTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableTableManager($_db, $_db.productsTable)
        .filter((f) => f.pid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PartyRatesTableTableFilterComposer
    extends Composer<_$AppDatabase, $PartyRatesTableTable> {
  $$PartyRatesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnFilters(column));

  $$TradersTableTableFilterComposer get partyId {
    final $$TradersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.partyId,
        referencedTable: $db.tradersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TradersTableTableFilterComposer(
              $db: $db,
              $table: $db.tradersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableTableFilterComposer get productId {
    final $$ProductsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableTableFilterComposer(
              $db: $db,
              $table: $db.productsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PartyRatesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PartyRatesTableTable> {
  $$PartyRatesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnOrderings(column));

  $$TradersTableTableOrderingComposer get partyId {
    final $$TradersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.partyId,
        referencedTable: $db.tradersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TradersTableTableOrderingComposer(
              $db: $db,
              $table: $db.tradersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableTableOrderingComposer get productId {
    final $$ProductsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableTableOrderingComposer(
              $db: $db,
              $table: $db.productsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PartyRatesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PartyRatesTableTable> {
  $$PartyRatesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  $$TradersTableTableAnnotationComposer get partyId {
    final $$TradersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.partyId,
        referencedTable: $db.tradersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TradersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.tradersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableTableAnnotationComposer get productId {
    final $$ProductsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.productsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PartyRatesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PartyRatesTableTable,
    PartyRatesTableData,
    $$PartyRatesTableTableFilterComposer,
    $$PartyRatesTableTableOrderingComposer,
    $$PartyRatesTableTableAnnotationComposer,
    $$PartyRatesTableTableCreateCompanionBuilder,
    $$PartyRatesTableTableUpdateCompanionBuilder,
    (PartyRatesTableData, $$PartyRatesTableTableReferences),
    PartyRatesTableData,
    PrefetchHooks Function({bool partyId, bool productId})> {
  $$PartyRatesTableTableTableManager(
      _$AppDatabase db, $PartyRatesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartyRatesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartyRatesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartyRatesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> partyId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> rate = const Value.absent(),
          }) =>
              PartyRatesTableCompanion(
            id: id,
            partyId: partyId,
            productId: productId,
            unit: unit,
            rate: rate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int partyId,
            required int productId,
            required String unit,
            required double rate,
          }) =>
              PartyRatesTableCompanion.insert(
            id: id,
            partyId: partyId,
            productId: productId,
            unit: unit,
            rate: rate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PartyRatesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({partyId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (partyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.partyId,
                    referencedTable:
                        $$PartyRatesTableTableReferences._partyIdTable(db),
                    referencedColumn:
                        $$PartyRatesTableTableReferences._partyIdTable(db).id,
                  ) as T;
                }
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$PartyRatesTableTableReferences._productIdTable(db),
                    referencedColumn: $$PartyRatesTableTableReferences
                        ._productIdTable(db)
                        .pid,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PartyRatesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PartyRatesTableTable,
    PartyRatesTableData,
    $$PartyRatesTableTableFilterComposer,
    $$PartyRatesTableTableOrderingComposer,
    $$PartyRatesTableTableAnnotationComposer,
    $$PartyRatesTableTableCreateCompanionBuilder,
    $$PartyRatesTableTableUpdateCompanionBuilder,
    (PartyRatesTableData, $$PartyRatesTableTableReferences),
    PartyRatesTableData,
    PrefetchHooks Function({bool partyId, bool productId})>;
typedef $$SalesTableTableCreateCompanionBuilder = SalesTableCompanion Function({
  Value<int> sid,
  required String salesCode,
  required int traderId,
  required DateTime saleDate,
  required double taxableValue,
  Value<double> cgstPercent,
  Value<double> sgstPercent,
  Value<double> igstPercent,
  required double totalAfterTax,
  Value<String?> deliveryMode,
  Value<DateTime?> dateOfDelivery,
  Value<String> paymentStatus,
  Value<int?> journalEntryId,
  Value<bool> reversed,
  Value<DateTime> createdAt,
});
typedef $$SalesTableTableUpdateCompanionBuilder = SalesTableCompanion Function({
  Value<int> sid,
  Value<String> salesCode,
  Value<int> traderId,
  Value<DateTime> saleDate,
  Value<double> taxableValue,
  Value<double> cgstPercent,
  Value<double> sgstPercent,
  Value<double> igstPercent,
  Value<double> totalAfterTax,
  Value<String?> deliveryMode,
  Value<DateTime?> dateOfDelivery,
  Value<String> paymentStatus,
  Value<int?> journalEntryId,
  Value<bool> reversed,
  Value<DateTime> createdAt,
});

final class $$SalesTableTableReferences
    extends BaseReferences<_$AppDatabase, $SalesTableTable, SalesTableData> {
  $$SalesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TradersTableTable _traderIdTable(_$AppDatabase db) =>
      db.tradersTable.createAlias(
          $_aliasNameGenerator(db.salesTable.traderId, db.tradersTable.id));

  $$TradersTableTableProcessedTableManager get traderId {
    final $_column = $_itemColumn<int>('trader_id')!;

    final manager = $$TradersTableTableTableManager($_db, $_db.tradersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_traderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$SalesLineItemsTableTable,
      List<SalesLineItemsTableData>> _salesLineItemsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.salesLineItemsTable,
          aliasName: $_aliasNameGenerator(
              db.salesTable.sid, db.salesLineItemsTable.salesId));

  $$SalesLineItemsTableTableProcessedTableManager get salesLineItemsTableRefs {
    final manager =
        $$SalesLineItemsTableTableTableManager($_db, $_db.salesLineItemsTable)
            .filter((f) => f.salesId.sid.sqlEquals($_itemColumn<int>('sid')!));

    final cache =
        $_typedResult.readTableOrNull(_salesLineItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SalesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SalesTableTable> {
  $$SalesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get sid => $composableBuilder(
      column: $table.sid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get salesCode => $composableBuilder(
      column: $table.salesCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get saleDate => $composableBuilder(
      column: $table.saleDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cgstPercent => $composableBuilder(
      column: $table.cgstPercent, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sgstPercent => $composableBuilder(
      column: $table.sgstPercent, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get igstPercent => $composableBuilder(
      column: $table.igstPercent, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalAfterTax => $composableBuilder(
      column: $table.totalAfterTax, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deliveryMode => $composableBuilder(
      column: $table.deliveryMode, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateOfDelivery => $composableBuilder(
      column: $table.dateOfDelivery,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get reversed => $composableBuilder(
      column: $table.reversed, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$TradersTableTableFilterComposer get traderId {
    final $$TradersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.traderId,
        referencedTable: $db.tradersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TradersTableTableFilterComposer(
              $db: $db,
              $table: $db.tradersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> salesLineItemsTableRefs(
      Expression<bool> Function($$SalesLineItemsTableTableFilterComposer f) f) {
    final $$SalesLineItemsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sid,
        referencedTable: $db.salesLineItemsTable,
        getReferencedColumn: (t) => t.salesId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SalesLineItemsTableTableFilterComposer(
              $db: $db,
              $table: $db.salesLineItemsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SalesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesTableTable> {
  $$SalesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get sid => $composableBuilder(
      column: $table.sid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get salesCode => $composableBuilder(
      column: $table.salesCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get saleDate => $composableBuilder(
      column: $table.saleDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cgstPercent => $composableBuilder(
      column: $table.cgstPercent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sgstPercent => $composableBuilder(
      column: $table.sgstPercent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get igstPercent => $composableBuilder(
      column: $table.igstPercent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalAfterTax => $composableBuilder(
      column: $table.totalAfterTax,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deliveryMode => $composableBuilder(
      column: $table.deliveryMode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateOfDelivery => $composableBuilder(
      column: $table.dateOfDelivery,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get reversed => $composableBuilder(
      column: $table.reversed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$TradersTableTableOrderingComposer get traderId {
    final $$TradersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.traderId,
        referencedTable: $db.tradersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TradersTableTableOrderingComposer(
              $db: $db,
              $table: $db.tradersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SalesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesTableTable> {
  $$SalesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get sid =>
      $composableBuilder(column: $table.sid, builder: (column) => column);

  GeneratedColumn<String> get salesCode =>
      $composableBuilder(column: $table.salesCode, builder: (column) => column);

  GeneratedColumn<DateTime> get saleDate =>
      $composableBuilder(column: $table.saleDate, builder: (column) => column);

  GeneratedColumn<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue, builder: (column) => column);

  GeneratedColumn<double> get cgstPercent => $composableBuilder(
      column: $table.cgstPercent, builder: (column) => column);

  GeneratedColumn<double> get sgstPercent => $composableBuilder(
      column: $table.sgstPercent, builder: (column) => column);

  GeneratedColumn<double> get igstPercent => $composableBuilder(
      column: $table.igstPercent, builder: (column) => column);

  GeneratedColumn<double> get totalAfterTax => $composableBuilder(
      column: $table.totalAfterTax, builder: (column) => column);

  GeneratedColumn<String> get deliveryMode => $composableBuilder(
      column: $table.deliveryMode, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfDelivery => $composableBuilder(
      column: $table.dateOfDelivery, builder: (column) => column);

  GeneratedColumn<String> get paymentStatus => $composableBuilder(
      column: $table.paymentStatus, builder: (column) => column);

  GeneratedColumn<int> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId, builder: (column) => column);

  GeneratedColumn<bool> get reversed =>
      $composableBuilder(column: $table.reversed, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TradersTableTableAnnotationComposer get traderId {
    final $$TradersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.traderId,
        referencedTable: $db.tradersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TradersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.tradersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> salesLineItemsTableRefs<T extends Object>(
      Expression<T> Function($$SalesLineItemsTableTableAnnotationComposer a)
          f) {
    final $$SalesLineItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.sid,
            referencedTable: $db.salesLineItemsTable,
            getReferencedColumn: (t) => t.salesId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$SalesLineItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.salesLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$SalesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SalesTableTable,
    SalesTableData,
    $$SalesTableTableFilterComposer,
    $$SalesTableTableOrderingComposer,
    $$SalesTableTableAnnotationComposer,
    $$SalesTableTableCreateCompanionBuilder,
    $$SalesTableTableUpdateCompanionBuilder,
    (SalesTableData, $$SalesTableTableReferences),
    SalesTableData,
    PrefetchHooks Function({bool traderId, bool salesLineItemsTableRefs})> {
  $$SalesTableTableTableManager(_$AppDatabase db, $SalesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> sid = const Value.absent(),
            Value<String> salesCode = const Value.absent(),
            Value<int> traderId = const Value.absent(),
            Value<DateTime> saleDate = const Value.absent(),
            Value<double> taxableValue = const Value.absent(),
            Value<double> cgstPercent = const Value.absent(),
            Value<double> sgstPercent = const Value.absent(),
            Value<double> igstPercent = const Value.absent(),
            Value<double> totalAfterTax = const Value.absent(),
            Value<String?> deliveryMode = const Value.absent(),
            Value<DateTime?> dateOfDelivery = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<int?> journalEntryId = const Value.absent(),
            Value<bool> reversed = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SalesTableCompanion(
            sid: sid,
            salesCode: salesCode,
            traderId: traderId,
            saleDate: saleDate,
            taxableValue: taxableValue,
            cgstPercent: cgstPercent,
            sgstPercent: sgstPercent,
            igstPercent: igstPercent,
            totalAfterTax: totalAfterTax,
            deliveryMode: deliveryMode,
            dateOfDelivery: dateOfDelivery,
            paymentStatus: paymentStatus,
            journalEntryId: journalEntryId,
            reversed: reversed,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> sid = const Value.absent(),
            required String salesCode,
            required int traderId,
            required DateTime saleDate,
            required double taxableValue,
            Value<double> cgstPercent = const Value.absent(),
            Value<double> sgstPercent = const Value.absent(),
            Value<double> igstPercent = const Value.absent(),
            required double totalAfterTax,
            Value<String?> deliveryMode = const Value.absent(),
            Value<DateTime?> dateOfDelivery = const Value.absent(),
            Value<String> paymentStatus = const Value.absent(),
            Value<int?> journalEntryId = const Value.absent(),
            Value<bool> reversed = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              SalesTableCompanion.insert(
            sid: sid,
            salesCode: salesCode,
            traderId: traderId,
            saleDate: saleDate,
            taxableValue: taxableValue,
            cgstPercent: cgstPercent,
            sgstPercent: sgstPercent,
            igstPercent: igstPercent,
            totalAfterTax: totalAfterTax,
            deliveryMode: deliveryMode,
            dateOfDelivery: dateOfDelivery,
            paymentStatus: paymentStatus,
            journalEntryId: journalEntryId,
            reversed: reversed,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SalesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {traderId = false, salesLineItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (salesLineItemsTableRefs) db.salesLineItemsTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (traderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.traderId,
                    referencedTable:
                        $$SalesTableTableReferences._traderIdTable(db),
                    referencedColumn:
                        $$SalesTableTableReferences._traderIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (salesLineItemsTableRefs)
                    await $_getPrefetchedData<SalesTableData, $SalesTableTable,
                            SalesLineItemsTableData>(
                        currentTable: table,
                        referencedTable: $$SalesTableTableReferences
                            ._salesLineItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SalesTableTableReferences(db, table, p0)
                                .salesLineItemsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.salesId == item.sid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SalesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SalesTableTable,
    SalesTableData,
    $$SalesTableTableFilterComposer,
    $$SalesTableTableOrderingComposer,
    $$SalesTableTableAnnotationComposer,
    $$SalesTableTableCreateCompanionBuilder,
    $$SalesTableTableUpdateCompanionBuilder,
    (SalesTableData, $$SalesTableTableReferences),
    SalesTableData,
    PrefetchHooks Function({bool traderId, bool salesLineItemsTableRefs})>;
typedef $$SalesLineItemsTableTableCreateCompanionBuilder
    = SalesLineItemsTableCompanion Function({
  Value<int> id,
  required int salesId,
  required int productId,
  required String productName,
  required String unit,
  required double qty,
  required double priceOfProduct,
  required double taxableValue,
});
typedef $$SalesLineItemsTableTableUpdateCompanionBuilder
    = SalesLineItemsTableCompanion Function({
  Value<int> id,
  Value<int> salesId,
  Value<int> productId,
  Value<String> productName,
  Value<String> unit,
  Value<double> qty,
  Value<double> priceOfProduct,
  Value<double> taxableValue,
});

final class $$SalesLineItemsTableTableReferences extends BaseReferences<
    _$AppDatabase, $SalesLineItemsTableTable, SalesLineItemsTableData> {
  $$SalesLineItemsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $SalesTableTable _salesIdTable(_$AppDatabase db) =>
      db.salesTable.createAlias($_aliasNameGenerator(
          db.salesLineItemsTable.salesId, db.salesTable.sid));

  $$SalesTableTableProcessedTableManager get salesId {
    final $_column = $_itemColumn<int>('sales_id')!;

    final manager = $$SalesTableTableTableManager($_db, $_db.salesTable)
        .filter((f) => f.sid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_salesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ProductsTableTable _productIdTable(_$AppDatabase db) =>
      db.productsTable.createAlias($_aliasNameGenerator(
          db.salesLineItemsTable.productId, db.productsTable.pid));

  $$ProductsTableTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableTableManager($_db, $_db.productsTable)
        .filter((f) => f.pid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SalesLineItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SalesLineItemsTableTable> {
  $$SalesLineItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get priceOfProduct => $composableBuilder(
      column: $table.priceOfProduct,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue, builder: (column) => ColumnFilters(column));

  $$SalesTableTableFilterComposer get salesId {
    final $$SalesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.salesId,
        referencedTable: $db.salesTable,
        getReferencedColumn: (t) => t.sid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SalesTableTableFilterComposer(
              $db: $db,
              $table: $db.salesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableTableFilterComposer get productId {
    final $$ProductsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableTableFilterComposer(
              $db: $db,
              $table: $db.productsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SalesLineItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SalesLineItemsTableTable> {
  $$SalesLineItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get priceOfProduct => $composableBuilder(
      column: $table.priceOfProduct,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue,
      builder: (column) => ColumnOrderings(column));

  $$SalesTableTableOrderingComposer get salesId {
    final $$SalesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.salesId,
        referencedTable: $db.salesTable,
        getReferencedColumn: (t) => t.sid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SalesTableTableOrderingComposer(
              $db: $db,
              $table: $db.salesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableTableOrderingComposer get productId {
    final $$ProductsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableTableOrderingComposer(
              $db: $db,
              $table: $db.productsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SalesLineItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SalesLineItemsTableTable> {
  $$SalesLineItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  GeneratedColumn<double> get priceOfProduct => $composableBuilder(
      column: $table.priceOfProduct, builder: (column) => column);

  GeneratedColumn<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue, builder: (column) => column);

  $$SalesTableTableAnnotationComposer get salesId {
    final $$SalesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.salesId,
        referencedTable: $db.salesTable,
        getReferencedColumn: (t) => t.sid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SalesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.salesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableTableAnnotationComposer get productId {
    final $$ProductsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.productsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SalesLineItemsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SalesLineItemsTableTable,
    SalesLineItemsTableData,
    $$SalesLineItemsTableTableFilterComposer,
    $$SalesLineItemsTableTableOrderingComposer,
    $$SalesLineItemsTableTableAnnotationComposer,
    $$SalesLineItemsTableTableCreateCompanionBuilder,
    $$SalesLineItemsTableTableUpdateCompanionBuilder,
    (SalesLineItemsTableData, $$SalesLineItemsTableTableReferences),
    SalesLineItemsTableData,
    PrefetchHooks Function({bool salesId, bool productId})> {
  $$SalesLineItemsTableTableTableManager(
      _$AppDatabase db, $SalesLineItemsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SalesLineItemsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SalesLineItemsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SalesLineItemsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> salesId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> qty = const Value.absent(),
            Value<double> priceOfProduct = const Value.absent(),
            Value<double> taxableValue = const Value.absent(),
          }) =>
              SalesLineItemsTableCompanion(
            id: id,
            salesId: salesId,
            productId: productId,
            productName: productName,
            unit: unit,
            qty: qty,
            priceOfProduct: priceOfProduct,
            taxableValue: taxableValue,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int salesId,
            required int productId,
            required String productName,
            required String unit,
            required double qty,
            required double priceOfProduct,
            required double taxableValue,
          }) =>
              SalesLineItemsTableCompanion.insert(
            id: id,
            salesId: salesId,
            productId: productId,
            productName: productName,
            unit: unit,
            qty: qty,
            priceOfProduct: priceOfProduct,
            taxableValue: taxableValue,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SalesLineItemsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({salesId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (salesId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.salesId,
                    referencedTable:
                        $$SalesLineItemsTableTableReferences._salesIdTable(db),
                    referencedColumn: $$SalesLineItemsTableTableReferences
                        ._salesIdTable(db)
                        .sid,
                  ) as T;
                }
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable: $$SalesLineItemsTableTableReferences
                        ._productIdTable(db),
                    referencedColumn: $$SalesLineItemsTableTableReferences
                        ._productIdTable(db)
                        .pid,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SalesLineItemsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SalesLineItemsTableTable,
    SalesLineItemsTableData,
    $$SalesLineItemsTableTableFilterComposer,
    $$SalesLineItemsTableTableOrderingComposer,
    $$SalesLineItemsTableTableAnnotationComposer,
    $$SalesLineItemsTableTableCreateCompanionBuilder,
    $$SalesLineItemsTableTableUpdateCompanionBuilder,
    (SalesLineItemsTableData, $$SalesLineItemsTableTableReferences),
    SalesLineItemsTableData,
    PrefetchHooks Function({bool salesId, bool productId})>;
typedef $$ProcurementTableTableCreateCompanionBuilder
    = ProcurementTableCompanion Function({
  Value<int> pid,
  required String purchaseCode,
  required int traderId,
  required DateTime purchaseDate,
  required double taxableValue,
  Value<double> cgstPercent,
  Value<double> sgstPercent,
  Value<double> igstPercent,
  Value<double> otherExpenses,
  required double totalAfterTax,
  Value<int?> journalEntryId,
  Value<bool> reversed,
  Value<DateTime> createdAt,
});
typedef $$ProcurementTableTableUpdateCompanionBuilder
    = ProcurementTableCompanion Function({
  Value<int> pid,
  Value<String> purchaseCode,
  Value<int> traderId,
  Value<DateTime> purchaseDate,
  Value<double> taxableValue,
  Value<double> cgstPercent,
  Value<double> sgstPercent,
  Value<double> igstPercent,
  Value<double> otherExpenses,
  Value<double> totalAfterTax,
  Value<int?> journalEntryId,
  Value<bool> reversed,
  Value<DateTime> createdAt,
});

final class $$ProcurementTableTableReferences extends BaseReferences<
    _$AppDatabase, $ProcurementTableTable, ProcurementTableData> {
  $$ProcurementTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TradersTableTable _traderIdTable(_$AppDatabase db) =>
      db.tradersTable.createAlias($_aliasNameGenerator(
          db.procurementTable.traderId, db.tradersTable.id));

  $$TradersTableTableProcessedTableManager get traderId {
    final $_column = $_itemColumn<int>('trader_id')!;

    final manager = $$TradersTableTableTableManager($_db, $_db.tradersTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_traderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ProcurementLineItemsTableTable,
      List<ProcurementLineItemsTableData>> _procurementLineItemsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.procurementLineItemsTable,
          aliasName: $_aliasNameGenerator(db.procurementTable.pid,
              db.procurementLineItemsTable.purchaseId));

  $$ProcurementLineItemsTableTableProcessedTableManager
      get procurementLineItemsTableRefs {
    final manager = $$ProcurementLineItemsTableTableTableManager(
            $_db, $_db.procurementLineItemsTable)
        .filter((f) => f.purchaseId.pid.sqlEquals($_itemColumn<int>('pid')!));

    final cache = $_typedResult
        .readTableOrNull(_procurementLineItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProcurementTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProcurementTableTable> {
  $$ProcurementTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get pid => $composableBuilder(
      column: $table.pid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get purchaseCode => $composableBuilder(
      column: $table.purchaseCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get cgstPercent => $composableBuilder(
      column: $table.cgstPercent, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get sgstPercent => $composableBuilder(
      column: $table.sgstPercent, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get igstPercent => $composableBuilder(
      column: $table.igstPercent, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get otherExpenses => $composableBuilder(
      column: $table.otherExpenses, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalAfterTax => $composableBuilder(
      column: $table.totalAfterTax, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get reversed => $composableBuilder(
      column: $table.reversed, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$TradersTableTableFilterComposer get traderId {
    final $$TradersTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.traderId,
        referencedTable: $db.tradersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TradersTableTableFilterComposer(
              $db: $db,
              $table: $db.tradersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> procurementLineItemsTableRefs(
      Expression<bool> Function(
              $$ProcurementLineItemsTableTableFilterComposer f)
          f) {
    final $$ProcurementLineItemsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.pid,
            referencedTable: $db.procurementLineItemsTable,
            getReferencedColumn: (t) => t.purchaseId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProcurementLineItemsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.procurementLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ProcurementTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProcurementTableTable> {
  $$ProcurementTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get pid => $composableBuilder(
      column: $table.pid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get purchaseCode => $composableBuilder(
      column: $table.purchaseCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get cgstPercent => $composableBuilder(
      column: $table.cgstPercent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get sgstPercent => $composableBuilder(
      column: $table.sgstPercent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get igstPercent => $composableBuilder(
      column: $table.igstPercent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get otherExpenses => $composableBuilder(
      column: $table.otherExpenses,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalAfterTax => $composableBuilder(
      column: $table.totalAfterTax,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get reversed => $composableBuilder(
      column: $table.reversed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$TradersTableTableOrderingComposer get traderId {
    final $$TradersTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.traderId,
        referencedTable: $db.tradersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TradersTableTableOrderingComposer(
              $db: $db,
              $table: $db.tradersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProcurementTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProcurementTableTable> {
  $$ProcurementTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pid =>
      $composableBuilder(column: $table.pid, builder: (column) => column);

  GeneratedColumn<String> get purchaseCode => $composableBuilder(
      column: $table.purchaseCode, builder: (column) => column);

  GeneratedColumn<DateTime> get purchaseDate => $composableBuilder(
      column: $table.purchaseDate, builder: (column) => column);

  GeneratedColumn<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue, builder: (column) => column);

  GeneratedColumn<double> get cgstPercent => $composableBuilder(
      column: $table.cgstPercent, builder: (column) => column);

  GeneratedColumn<double> get sgstPercent => $composableBuilder(
      column: $table.sgstPercent, builder: (column) => column);

  GeneratedColumn<double> get igstPercent => $composableBuilder(
      column: $table.igstPercent, builder: (column) => column);

  GeneratedColumn<double> get otherExpenses => $composableBuilder(
      column: $table.otherExpenses, builder: (column) => column);

  GeneratedColumn<double> get totalAfterTax => $composableBuilder(
      column: $table.totalAfterTax, builder: (column) => column);

  GeneratedColumn<int> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId, builder: (column) => column);

  GeneratedColumn<bool> get reversed =>
      $composableBuilder(column: $table.reversed, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TradersTableTableAnnotationComposer get traderId {
    final $$TradersTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.traderId,
        referencedTable: $db.tradersTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TradersTableTableAnnotationComposer(
              $db: $db,
              $table: $db.tradersTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> procurementLineItemsTableRefs<T extends Object>(
      Expression<T> Function(
              $$ProcurementLineItemsTableTableAnnotationComposer a)
          f) {
    final $$ProcurementLineItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.pid,
            referencedTable: $db.procurementLineItemsTable,
            getReferencedColumn: (t) => t.purchaseId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProcurementLineItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.procurementLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ProcurementTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProcurementTableTable,
    ProcurementTableData,
    $$ProcurementTableTableFilterComposer,
    $$ProcurementTableTableOrderingComposer,
    $$ProcurementTableTableAnnotationComposer,
    $$ProcurementTableTableCreateCompanionBuilder,
    $$ProcurementTableTableUpdateCompanionBuilder,
    (ProcurementTableData, $$ProcurementTableTableReferences),
    ProcurementTableData,
    PrefetchHooks Function(
        {bool traderId, bool procurementLineItemsTableRefs})> {
  $$ProcurementTableTableTableManager(
      _$AppDatabase db, $ProcurementTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProcurementTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProcurementTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProcurementTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> pid = const Value.absent(),
            Value<String> purchaseCode = const Value.absent(),
            Value<int> traderId = const Value.absent(),
            Value<DateTime> purchaseDate = const Value.absent(),
            Value<double> taxableValue = const Value.absent(),
            Value<double> cgstPercent = const Value.absent(),
            Value<double> sgstPercent = const Value.absent(),
            Value<double> igstPercent = const Value.absent(),
            Value<double> otherExpenses = const Value.absent(),
            Value<double> totalAfterTax = const Value.absent(),
            Value<int?> journalEntryId = const Value.absent(),
            Value<bool> reversed = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ProcurementTableCompanion(
            pid: pid,
            purchaseCode: purchaseCode,
            traderId: traderId,
            purchaseDate: purchaseDate,
            taxableValue: taxableValue,
            cgstPercent: cgstPercent,
            sgstPercent: sgstPercent,
            igstPercent: igstPercent,
            otherExpenses: otherExpenses,
            totalAfterTax: totalAfterTax,
            journalEntryId: journalEntryId,
            reversed: reversed,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> pid = const Value.absent(),
            required String purchaseCode,
            required int traderId,
            required DateTime purchaseDate,
            required double taxableValue,
            Value<double> cgstPercent = const Value.absent(),
            Value<double> sgstPercent = const Value.absent(),
            Value<double> igstPercent = const Value.absent(),
            Value<double> otherExpenses = const Value.absent(),
            required double totalAfterTax,
            Value<int?> journalEntryId = const Value.absent(),
            Value<bool> reversed = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ProcurementTableCompanion.insert(
            pid: pid,
            purchaseCode: purchaseCode,
            traderId: traderId,
            purchaseDate: purchaseDate,
            taxableValue: taxableValue,
            cgstPercent: cgstPercent,
            sgstPercent: sgstPercent,
            igstPercent: igstPercent,
            otherExpenses: otherExpenses,
            totalAfterTax: totalAfterTax,
            journalEntryId: journalEntryId,
            reversed: reversed,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProcurementTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {traderId = false, procurementLineItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (procurementLineItemsTableRefs) db.procurementLineItemsTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (traderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.traderId,
                    referencedTable:
                        $$ProcurementTableTableReferences._traderIdTable(db),
                    referencedColumn:
                        $$ProcurementTableTableReferences._traderIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (procurementLineItemsTableRefs)
                    await $_getPrefetchedData<
                            ProcurementTableData,
                            $ProcurementTableTable,
                            ProcurementLineItemsTableData>(
                        currentTable: table,
                        referencedTable: $$ProcurementTableTableReferences
                            ._procurementLineItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProcurementTableTableReferences(db, table, p0)
                                .procurementLineItemsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.purchaseId == item.pid),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProcurementTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProcurementTableTable,
    ProcurementTableData,
    $$ProcurementTableTableFilterComposer,
    $$ProcurementTableTableOrderingComposer,
    $$ProcurementTableTableAnnotationComposer,
    $$ProcurementTableTableCreateCompanionBuilder,
    $$ProcurementTableTableUpdateCompanionBuilder,
    (ProcurementTableData, $$ProcurementTableTableReferences),
    ProcurementTableData,
    PrefetchHooks Function(
        {bool traderId, bool procurementLineItemsTableRefs})>;
typedef $$ProcurementLineItemsTableTableCreateCompanionBuilder
    = ProcurementLineItemsTableCompanion Function({
  Value<int> id,
  required int purchaseId,
  required int productId,
  required String productName,
  required String unit,
  required double qty,
  required double priceOfProduct,
  required double taxableValue,
});
typedef $$ProcurementLineItemsTableTableUpdateCompanionBuilder
    = ProcurementLineItemsTableCompanion Function({
  Value<int> id,
  Value<int> purchaseId,
  Value<int> productId,
  Value<String> productName,
  Value<String> unit,
  Value<double> qty,
  Value<double> priceOfProduct,
  Value<double> taxableValue,
});

final class $$ProcurementLineItemsTableTableReferences extends BaseReferences<
    _$AppDatabase,
    $ProcurementLineItemsTableTable,
    ProcurementLineItemsTableData> {
  $$ProcurementLineItemsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProcurementTableTable _purchaseIdTable(_$AppDatabase db) =>
      db.procurementTable.createAlias($_aliasNameGenerator(
          db.procurementLineItemsTable.purchaseId, db.procurementTable.pid));

  $$ProcurementTableTableProcessedTableManager get purchaseId {
    final $_column = $_itemColumn<int>('purchase_id')!;

    final manager =
        $$ProcurementTableTableTableManager($_db, $_db.procurementTable)
            .filter((f) => f.pid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_purchaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ProductsTableTable _productIdTable(_$AppDatabase db) =>
      db.productsTable.createAlias($_aliasNameGenerator(
          db.procurementLineItemsTable.productId, db.productsTable.pid));

  $$ProductsTableTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager = $$ProductsTableTableTableManager($_db, $_db.productsTable)
        .filter((f) => f.pid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ProcurementLineItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProcurementLineItemsTableTable> {
  $$ProcurementLineItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get priceOfProduct => $composableBuilder(
      column: $table.priceOfProduct,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue, builder: (column) => ColumnFilters(column));

  $$ProcurementTableTableFilterComposer get purchaseId {
    final $$ProcurementTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.purchaseId,
        referencedTable: $db.procurementTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProcurementTableTableFilterComposer(
              $db: $db,
              $table: $db.procurementTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableTableFilterComposer get productId {
    final $$ProductsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableTableFilterComposer(
              $db: $db,
              $table: $db.productsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProcurementLineItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProcurementLineItemsTableTable> {
  $$ProcurementLineItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get qty => $composableBuilder(
      column: $table.qty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get priceOfProduct => $composableBuilder(
      column: $table.priceOfProduct,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue,
      builder: (column) => ColumnOrderings(column));

  $$ProcurementTableTableOrderingComposer get purchaseId {
    final $$ProcurementTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.purchaseId,
        referencedTable: $db.procurementTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProcurementTableTableOrderingComposer(
              $db: $db,
              $table: $db.procurementTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableTableOrderingComposer get productId {
    final $$ProductsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableTableOrderingComposer(
              $db: $db,
              $table: $db.productsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProcurementLineItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProcurementLineItemsTableTable> {
  $$ProcurementLineItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get qty =>
      $composableBuilder(column: $table.qty, builder: (column) => column);

  GeneratedColumn<double> get priceOfProduct => $composableBuilder(
      column: $table.priceOfProduct, builder: (column) => column);

  GeneratedColumn<double> get taxableValue => $composableBuilder(
      column: $table.taxableValue, builder: (column) => column);

  $$ProcurementTableTableAnnotationComposer get purchaseId {
    final $$ProcurementTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.purchaseId,
        referencedTable: $db.procurementTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProcurementTableTableAnnotationComposer(
              $db: $db,
              $table: $db.procurementTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$ProductsTableTableAnnotationComposer get productId {
    final $$ProductsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsTable,
        getReferencedColumn: (t) => t.pid,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.productsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProcurementLineItemsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProcurementLineItemsTableTable,
    ProcurementLineItemsTableData,
    $$ProcurementLineItemsTableTableFilterComposer,
    $$ProcurementLineItemsTableTableOrderingComposer,
    $$ProcurementLineItemsTableTableAnnotationComposer,
    $$ProcurementLineItemsTableTableCreateCompanionBuilder,
    $$ProcurementLineItemsTableTableUpdateCompanionBuilder,
    (ProcurementLineItemsTableData, $$ProcurementLineItemsTableTableReferences),
    ProcurementLineItemsTableData,
    PrefetchHooks Function({bool purchaseId, bool productId})> {
  $$ProcurementLineItemsTableTableTableManager(
      _$AppDatabase db, $ProcurementLineItemsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProcurementLineItemsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ProcurementLineItemsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProcurementLineItemsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> purchaseId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> qty = const Value.absent(),
            Value<double> priceOfProduct = const Value.absent(),
            Value<double> taxableValue = const Value.absent(),
          }) =>
              ProcurementLineItemsTableCompanion(
            id: id,
            purchaseId: purchaseId,
            productId: productId,
            productName: productName,
            unit: unit,
            qty: qty,
            priceOfProduct: priceOfProduct,
            taxableValue: taxableValue,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int purchaseId,
            required int productId,
            required String productName,
            required String unit,
            required double qty,
            required double priceOfProduct,
            required double taxableValue,
          }) =>
              ProcurementLineItemsTableCompanion.insert(
            id: id,
            purchaseId: purchaseId,
            productId: productId,
            productName: productName,
            unit: unit,
            qty: qty,
            priceOfProduct: priceOfProduct,
            taxableValue: taxableValue,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProcurementLineItemsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({purchaseId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (purchaseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.purchaseId,
                    referencedTable: $$ProcurementLineItemsTableTableReferences
                        ._purchaseIdTable(db),
                    referencedColumn: $$ProcurementLineItemsTableTableReferences
                        ._purchaseIdTable(db)
                        .pid,
                  ) as T;
                }
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable: $$ProcurementLineItemsTableTableReferences
                        ._productIdTable(db),
                    referencedColumn: $$ProcurementLineItemsTableTableReferences
                        ._productIdTable(db)
                        .pid,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ProcurementLineItemsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ProcurementLineItemsTableTable,
        ProcurementLineItemsTableData,
        $$ProcurementLineItemsTableTableFilterComposer,
        $$ProcurementLineItemsTableTableOrderingComposer,
        $$ProcurementLineItemsTableTableAnnotationComposer,
        $$ProcurementLineItemsTableTableCreateCompanionBuilder,
        $$ProcurementLineItemsTableTableUpdateCompanionBuilder,
        (
          ProcurementLineItemsTableData,
          $$ProcurementLineItemsTableTableReferences
        ),
        ProcurementLineItemsTableData,
        PrefetchHooks Function({bool purchaseId, bool productId})>;
typedef $$EmployeesTableTableCreateCompanionBuilder = EmployeesTableCompanion
    Function({
  Value<int> employeeId,
  required String employeeCode,
  required String employeeName,
  Value<String?> fatherName,
  Value<DateTime?> dob,
  Value<String?> gender,
  required DateTime dateOfJoining,
  required String mobNo,
  Value<String?> alternateMobNo,
  Value<String?> email,
  Value<String?> address,
  Value<String?> state,
  Value<String?> city,
  Value<String?> pincode,
  Value<String?> aadhar,
  Value<String?> pan,
  Value<String?> designation,
  Value<String?> department,
  Value<String> status,
  Value<double> salary,
  Value<String> salaryType,
  Value<String?> bankName,
  Value<String?> bankAccountNumber,
  Value<String?> bankIfsc,
  Value<String?> emergencyContactName,
  Value<String?> emergencyContactNumber,
  Value<DateTime> createdAt,
});
typedef $$EmployeesTableTableUpdateCompanionBuilder = EmployeesTableCompanion
    Function({
  Value<int> employeeId,
  Value<String> employeeCode,
  Value<String> employeeName,
  Value<String?> fatherName,
  Value<DateTime?> dob,
  Value<String?> gender,
  Value<DateTime> dateOfJoining,
  Value<String> mobNo,
  Value<String?> alternateMobNo,
  Value<String?> email,
  Value<String?> address,
  Value<String?> state,
  Value<String?> city,
  Value<String?> pincode,
  Value<String?> aadhar,
  Value<String?> pan,
  Value<String?> designation,
  Value<String?> department,
  Value<String> status,
  Value<double> salary,
  Value<String> salaryType,
  Value<String?> bankName,
  Value<String?> bankAccountNumber,
  Value<String?> bankIfsc,
  Value<String?> emergencyContactName,
  Value<String?> emergencyContactNumber,
  Value<DateTime> createdAt,
});

final class $$EmployeesTableTableReferences extends BaseReferences<
    _$AppDatabase, $EmployeesTableTable, EmployeesTableData> {
  $$EmployeesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AttendanceTableTable, List<AttendanceTableData>>
      _attendanceTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.attendanceTable,
              aliasName: $_aliasNameGenerator(
                  db.employeesTable.employeeId, db.attendanceTable.employeeId));

  $$AttendanceTableTableProcessedTableManager get attendanceTableRefs {
    final manager =
        $$AttendanceTableTableTableManager($_db, $_db.attendanceTable).filter(
            (f) => f.employeeId.employeeId
                .sqlEquals($_itemColumn<int>('employee_id')!));

    final cache =
        $_typedResult.readTableOrNull(_attendanceTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$EmployeePaymentsTableTable,
      List<EmployeePaymentsTableData>> _employeePaymentsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.employeePaymentsTable,
          aliasName: $_aliasNameGenerator(db.employeesTable.employeeId,
              db.employeePaymentsTable.employeeId));

  $$EmployeePaymentsTableTableProcessedTableManager
      get employeePaymentsTableRefs {
    final manager = $$EmployeePaymentsTableTableTableManager(
            $_db, $_db.employeePaymentsTable)
        .filter((f) => f.employeeId.employeeId
            .sqlEquals($_itemColumn<int>('employee_id')!));

    final cache =
        $_typedResult.readTableOrNull(_employeePaymentsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$EmployeesTableTableFilterComposer
    extends Composer<_$AppDatabase, $EmployeesTableTable> {
  $$EmployeesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employeeCode => $composableBuilder(
      column: $table.employeeCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get employeeName => $composableBuilder(
      column: $table.employeeName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fatherName => $composableBuilder(
      column: $table.fatherName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dob => $composableBuilder(
      column: $table.dob, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateOfJoining => $composableBuilder(
      column: $table.dateOfJoining, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mobNo => $composableBuilder(
      column: $table.mobNo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get alternateMobNo => $composableBuilder(
      column: $table.alternateMobNo,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pincode => $composableBuilder(
      column: $table.pincode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get aadhar => $composableBuilder(
      column: $table.aadhar, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pan => $composableBuilder(
      column: $table.pan, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get designation => $composableBuilder(
      column: $table.designation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get department => $composableBuilder(
      column: $table.department, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get salary => $composableBuilder(
      column: $table.salary, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get salaryType => $composableBuilder(
      column: $table.salaryType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankName => $composableBuilder(
      column: $table.bankName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankAccountNumber => $composableBuilder(
      column: $table.bankAccountNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankIfsc => $composableBuilder(
      column: $table.bankIfsc, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emergencyContactName => $composableBuilder(
      column: $table.emergencyContactName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get emergencyContactNumber => $composableBuilder(
      column: $table.emergencyContactNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> attendanceTableRefs(
      Expression<bool> Function($$AttendanceTableTableFilterComposer f) f) {
    final $$AttendanceTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employeeId,
        referencedTable: $db.attendanceTable,
        getReferencedColumn: (t) => t.employeeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttendanceTableTableFilterComposer(
              $db: $db,
              $table: $db.attendanceTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> employeePaymentsTableRefs(
      Expression<bool> Function($$EmployeePaymentsTableTableFilterComposer f)
          f) {
    final $$EmployeePaymentsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.employeeId,
            referencedTable: $db.employeePaymentsTable,
            getReferencedColumn: (t) => t.employeeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$EmployeePaymentsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.employeePaymentsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$EmployeesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EmployeesTableTable> {
  $$EmployeesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employeeCode => $composableBuilder(
      column: $table.employeeCode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get employeeName => $composableBuilder(
      column: $table.employeeName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fatherName => $composableBuilder(
      column: $table.fatherName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dob => $composableBuilder(
      column: $table.dob, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateOfJoining => $composableBuilder(
      column: $table.dateOfJoining,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mobNo => $composableBuilder(
      column: $table.mobNo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get alternateMobNo => $composableBuilder(
      column: $table.alternateMobNo,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pincode => $composableBuilder(
      column: $table.pincode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get aadhar => $composableBuilder(
      column: $table.aadhar, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pan => $composableBuilder(
      column: $table.pan, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get designation => $composableBuilder(
      column: $table.designation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get department => $composableBuilder(
      column: $table.department, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get salary => $composableBuilder(
      column: $table.salary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get salaryType => $composableBuilder(
      column: $table.salaryType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankName => $composableBuilder(
      column: $table.bankName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankAccountNumber => $composableBuilder(
      column: $table.bankAccountNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankIfsc => $composableBuilder(
      column: $table.bankIfsc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emergencyContactName => $composableBuilder(
      column: $table.emergencyContactName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get emergencyContactNumber => $composableBuilder(
      column: $table.emergencyContactNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$EmployeesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmployeesTableTable> {
  $$EmployeesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get employeeId => $composableBuilder(
      column: $table.employeeId, builder: (column) => column);

  GeneratedColumn<String> get employeeCode => $composableBuilder(
      column: $table.employeeCode, builder: (column) => column);

  GeneratedColumn<String> get employeeName => $composableBuilder(
      column: $table.employeeName, builder: (column) => column);

  GeneratedColumn<String> get fatherName => $composableBuilder(
      column: $table.fatherName, builder: (column) => column);

  GeneratedColumn<DateTime> get dob =>
      $composableBuilder(column: $table.dob, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfJoining => $composableBuilder(
      column: $table.dateOfJoining, builder: (column) => column);

  GeneratedColumn<String> get mobNo =>
      $composableBuilder(column: $table.mobNo, builder: (column) => column);

  GeneratedColumn<String> get alternateMobNo => $composableBuilder(
      column: $table.alternateMobNo, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get pincode =>
      $composableBuilder(column: $table.pincode, builder: (column) => column);

  GeneratedColumn<String> get aadhar =>
      $composableBuilder(column: $table.aadhar, builder: (column) => column);

  GeneratedColumn<String> get pan =>
      $composableBuilder(column: $table.pan, builder: (column) => column);

  GeneratedColumn<String> get designation => $composableBuilder(
      column: $table.designation, builder: (column) => column);

  GeneratedColumn<String> get department => $composableBuilder(
      column: $table.department, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get salary =>
      $composableBuilder(column: $table.salary, builder: (column) => column);

  GeneratedColumn<String> get salaryType => $composableBuilder(
      column: $table.salaryType, builder: (column) => column);

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get bankAccountNumber => $composableBuilder(
      column: $table.bankAccountNumber, builder: (column) => column);

  GeneratedColumn<String> get bankIfsc =>
      $composableBuilder(column: $table.bankIfsc, builder: (column) => column);

  GeneratedColumn<String> get emergencyContactName => $composableBuilder(
      column: $table.emergencyContactName, builder: (column) => column);

  GeneratedColumn<String> get emergencyContactNumber => $composableBuilder(
      column: $table.emergencyContactNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> attendanceTableRefs<T extends Object>(
      Expression<T> Function($$AttendanceTableTableAnnotationComposer a) f) {
    final $$AttendanceTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employeeId,
        referencedTable: $db.attendanceTable,
        getReferencedColumn: (t) => t.employeeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AttendanceTableTableAnnotationComposer(
              $db: $db,
              $table: $db.attendanceTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> employeePaymentsTableRefs<T extends Object>(
      Expression<T> Function($$EmployeePaymentsTableTableAnnotationComposer a)
          f) {
    final $$EmployeePaymentsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.employeeId,
            referencedTable: $db.employeePaymentsTable,
            getReferencedColumn: (t) => t.employeeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$EmployeePaymentsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.employeePaymentsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$EmployeesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EmployeesTableTable,
    EmployeesTableData,
    $$EmployeesTableTableFilterComposer,
    $$EmployeesTableTableOrderingComposer,
    $$EmployeesTableTableAnnotationComposer,
    $$EmployeesTableTableCreateCompanionBuilder,
    $$EmployeesTableTableUpdateCompanionBuilder,
    (EmployeesTableData, $$EmployeesTableTableReferences),
    EmployeesTableData,
    PrefetchHooks Function(
        {bool attendanceTableRefs, bool employeePaymentsTableRefs})> {
  $$EmployeesTableTableTableManager(
      _$AppDatabase db, $EmployeesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmployeesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmployeesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmployeesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> employeeId = const Value.absent(),
            Value<String> employeeCode = const Value.absent(),
            Value<String> employeeName = const Value.absent(),
            Value<String?> fatherName = const Value.absent(),
            Value<DateTime?> dob = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<DateTime> dateOfJoining = const Value.absent(),
            Value<String> mobNo = const Value.absent(),
            Value<String?> alternateMobNo = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> pincode = const Value.absent(),
            Value<String?> aadhar = const Value.absent(),
            Value<String?> pan = const Value.absent(),
            Value<String?> designation = const Value.absent(),
            Value<String?> department = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<double> salary = const Value.absent(),
            Value<String> salaryType = const Value.absent(),
            Value<String?> bankName = const Value.absent(),
            Value<String?> bankAccountNumber = const Value.absent(),
            Value<String?> bankIfsc = const Value.absent(),
            Value<String?> emergencyContactName = const Value.absent(),
            Value<String?> emergencyContactNumber = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              EmployeesTableCompanion(
            employeeId: employeeId,
            employeeCode: employeeCode,
            employeeName: employeeName,
            fatherName: fatherName,
            dob: dob,
            gender: gender,
            dateOfJoining: dateOfJoining,
            mobNo: mobNo,
            alternateMobNo: alternateMobNo,
            email: email,
            address: address,
            state: state,
            city: city,
            pincode: pincode,
            aadhar: aadhar,
            pan: pan,
            designation: designation,
            department: department,
            status: status,
            salary: salary,
            salaryType: salaryType,
            bankName: bankName,
            bankAccountNumber: bankAccountNumber,
            bankIfsc: bankIfsc,
            emergencyContactName: emergencyContactName,
            emergencyContactNumber: emergencyContactNumber,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> employeeId = const Value.absent(),
            required String employeeCode,
            required String employeeName,
            Value<String?> fatherName = const Value.absent(),
            Value<DateTime?> dob = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            required DateTime dateOfJoining,
            required String mobNo,
            Value<String?> alternateMobNo = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String?> pincode = const Value.absent(),
            Value<String?> aadhar = const Value.absent(),
            Value<String?> pan = const Value.absent(),
            Value<String?> designation = const Value.absent(),
            Value<String?> department = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<double> salary = const Value.absent(),
            Value<String> salaryType = const Value.absent(),
            Value<String?> bankName = const Value.absent(),
            Value<String?> bankAccountNumber = const Value.absent(),
            Value<String?> bankIfsc = const Value.absent(),
            Value<String?> emergencyContactName = const Value.absent(),
            Value<String?> emergencyContactNumber = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              EmployeesTableCompanion.insert(
            employeeId: employeeId,
            employeeCode: employeeCode,
            employeeName: employeeName,
            fatherName: fatherName,
            dob: dob,
            gender: gender,
            dateOfJoining: dateOfJoining,
            mobNo: mobNo,
            alternateMobNo: alternateMobNo,
            email: email,
            address: address,
            state: state,
            city: city,
            pincode: pincode,
            aadhar: aadhar,
            pan: pan,
            designation: designation,
            department: department,
            status: status,
            salary: salary,
            salaryType: salaryType,
            bankName: bankName,
            bankAccountNumber: bankAccountNumber,
            bankIfsc: bankIfsc,
            emergencyContactName: emergencyContactName,
            emergencyContactNumber: emergencyContactNumber,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$EmployeesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {attendanceTableRefs = false,
              employeePaymentsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (attendanceTableRefs) db.attendanceTable,
                if (employeePaymentsTableRefs) db.employeePaymentsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (attendanceTableRefs)
                    await $_getPrefetchedData<EmployeesTableData,
                            $EmployeesTableTable, AttendanceTableData>(
                        currentTable: table,
                        referencedTable: $$EmployeesTableTableReferences
                            ._attendanceTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$EmployeesTableTableReferences(db, table, p0)
                                .attendanceTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.employeeId == item.employeeId),
                        typedResults: items),
                  if (employeePaymentsTableRefs)
                    await $_getPrefetchedData<EmployeesTableData,
                            $EmployeesTableTable, EmployeePaymentsTableData>(
                        currentTable: table,
                        referencedTable: $$EmployeesTableTableReferences
                            ._employeePaymentsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$EmployeesTableTableReferences(db, table, p0)
                                .employeePaymentsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.employeeId == item.employeeId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$EmployeesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EmployeesTableTable,
    EmployeesTableData,
    $$EmployeesTableTableFilterComposer,
    $$EmployeesTableTableOrderingComposer,
    $$EmployeesTableTableAnnotationComposer,
    $$EmployeesTableTableCreateCompanionBuilder,
    $$EmployeesTableTableUpdateCompanionBuilder,
    (EmployeesTableData, $$EmployeesTableTableReferences),
    EmployeesTableData,
    PrefetchHooks Function(
        {bool attendanceTableRefs, bool employeePaymentsTableRefs})>;
typedef $$AttendanceTableTableCreateCompanionBuilder = AttendanceTableCompanion
    Function({
  Value<int> id,
  required int employeeId,
  required DateTime date,
  required String status,
});
typedef $$AttendanceTableTableUpdateCompanionBuilder = AttendanceTableCompanion
    Function({
  Value<int> id,
  Value<int> employeeId,
  Value<DateTime> date,
  Value<String> status,
});

final class $$AttendanceTableTableReferences extends BaseReferences<
    _$AppDatabase, $AttendanceTableTable, AttendanceTableData> {
  $$AttendanceTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $EmployeesTableTable _employeeIdTable(_$AppDatabase db) =>
      db.employeesTable.createAlias($_aliasNameGenerator(
          db.attendanceTable.employeeId, db.employeesTable.employeeId));

  $$EmployeesTableTableProcessedTableManager get employeeId {
    final $_column = $_itemColumn<int>('employee_id')!;

    final manager = $$EmployeesTableTableTableManager($_db, $_db.employeesTable)
        .filter((f) => f.employeeId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_employeeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AttendanceTableTableFilterComposer
    extends Composer<_$AppDatabase, $AttendanceTableTable> {
  $$AttendanceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  $$EmployeesTableTableFilterComposer get employeeId {
    final $$EmployeesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employeeId,
        referencedTable: $db.employeesTable,
        getReferencedColumn: (t) => t.employeeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EmployeesTableTableFilterComposer(
              $db: $db,
              $table: $db.employeesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AttendanceTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AttendanceTableTable> {
  $$AttendanceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  $$EmployeesTableTableOrderingComposer get employeeId {
    final $$EmployeesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employeeId,
        referencedTable: $db.employeesTable,
        getReferencedColumn: (t) => t.employeeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EmployeesTableTableOrderingComposer(
              $db: $db,
              $table: $db.employeesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AttendanceTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttendanceTableTable> {
  $$AttendanceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$EmployeesTableTableAnnotationComposer get employeeId {
    final $$EmployeesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employeeId,
        referencedTable: $db.employeesTable,
        getReferencedColumn: (t) => t.employeeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EmployeesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.employeesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AttendanceTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AttendanceTableTable,
    AttendanceTableData,
    $$AttendanceTableTableFilterComposer,
    $$AttendanceTableTableOrderingComposer,
    $$AttendanceTableTableAnnotationComposer,
    $$AttendanceTableTableCreateCompanionBuilder,
    $$AttendanceTableTableUpdateCompanionBuilder,
    (AttendanceTableData, $$AttendanceTableTableReferences),
    AttendanceTableData,
    PrefetchHooks Function({bool employeeId})> {
  $$AttendanceTableTableTableManager(
      _$AppDatabase db, $AttendanceTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttendanceTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttendanceTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttendanceTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> employeeId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              AttendanceTableCompanion(
            id: id,
            employeeId: employeeId,
            date: date,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int employeeId,
            required DateTime date,
            required String status,
          }) =>
              AttendanceTableCompanion.insert(
            id: id,
            employeeId: employeeId,
            date: date,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AttendanceTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({employeeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (employeeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.employeeId,
                    referencedTable:
                        $$AttendanceTableTableReferences._employeeIdTable(db),
                    referencedColumn: $$AttendanceTableTableReferences
                        ._employeeIdTable(db)
                        .employeeId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AttendanceTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AttendanceTableTable,
    AttendanceTableData,
    $$AttendanceTableTableFilterComposer,
    $$AttendanceTableTableOrderingComposer,
    $$AttendanceTableTableAnnotationComposer,
    $$AttendanceTableTableCreateCompanionBuilder,
    $$AttendanceTableTableUpdateCompanionBuilder,
    (AttendanceTableData, $$AttendanceTableTableReferences),
    AttendanceTableData,
    PrefetchHooks Function({bool employeeId})>;
typedef $$EmployeePaymentsTableTableCreateCompanionBuilder
    = EmployeePaymentsTableCompanion Function({
  Value<int> paymentId,
  required int employeeId,
  required DateTime paymentDate,
  required int amount,
  Value<int?> journalEntryId,
  Value<DateTime> createdAt,
});
typedef $$EmployeePaymentsTableTableUpdateCompanionBuilder
    = EmployeePaymentsTableCompanion Function({
  Value<int> paymentId,
  Value<int> employeeId,
  Value<DateTime> paymentDate,
  Value<int> amount,
  Value<int?> journalEntryId,
  Value<DateTime> createdAt,
});

final class $$EmployeePaymentsTableTableReferences extends BaseReferences<
    _$AppDatabase, $EmployeePaymentsTableTable, EmployeePaymentsTableData> {
  $$EmployeePaymentsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $EmployeesTableTable _employeeIdTable(_$AppDatabase db) =>
      db.employeesTable.createAlias($_aliasNameGenerator(
          db.employeePaymentsTable.employeeId, db.employeesTable.employeeId));

  $$EmployeesTableTableProcessedTableManager get employeeId {
    final $_column = $_itemColumn<int>('employee_id')!;

    final manager = $$EmployeesTableTableTableManager($_db, $_db.employeesTable)
        .filter((f) => f.employeeId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_employeeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$EmployeePaymentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $EmployeePaymentsTableTable> {
  $$EmployeePaymentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get paymentId => $composableBuilder(
      column: $table.paymentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$EmployeesTableTableFilterComposer get employeeId {
    final $$EmployeesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employeeId,
        referencedTable: $db.employeesTable,
        getReferencedColumn: (t) => t.employeeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EmployeesTableTableFilterComposer(
              $db: $db,
              $table: $db.employeesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EmployeePaymentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $EmployeePaymentsTableTable> {
  $$EmployeePaymentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get paymentId => $composableBuilder(
      column: $table.paymentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$EmployeesTableTableOrderingComposer get employeeId {
    final $$EmployeesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employeeId,
        referencedTable: $db.employeesTable,
        getReferencedColumn: (t) => t.employeeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EmployeesTableTableOrderingComposer(
              $db: $db,
              $table: $db.employeesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EmployeePaymentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmployeePaymentsTableTable> {
  $$EmployeePaymentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get paymentId =>
      $composableBuilder(column: $table.paymentId, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get journalEntryId => $composableBuilder(
      column: $table.journalEntryId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$EmployeesTableTableAnnotationComposer get employeeId {
    final $$EmployeesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employeeId,
        referencedTable: $db.employeesTable,
        getReferencedColumn: (t) => t.employeeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EmployeesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.employeesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EmployeePaymentsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EmployeePaymentsTableTable,
    EmployeePaymentsTableData,
    $$EmployeePaymentsTableTableFilterComposer,
    $$EmployeePaymentsTableTableOrderingComposer,
    $$EmployeePaymentsTableTableAnnotationComposer,
    $$EmployeePaymentsTableTableCreateCompanionBuilder,
    $$EmployeePaymentsTableTableUpdateCompanionBuilder,
    (EmployeePaymentsTableData, $$EmployeePaymentsTableTableReferences),
    EmployeePaymentsTableData,
    PrefetchHooks Function({bool employeeId})> {
  $$EmployeePaymentsTableTableTableManager(
      _$AppDatabase db, $EmployeePaymentsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmployeePaymentsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$EmployeePaymentsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmployeePaymentsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> paymentId = const Value.absent(),
            Value<int> employeeId = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<int?> journalEntryId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              EmployeePaymentsTableCompanion(
            paymentId: paymentId,
            employeeId: employeeId,
            paymentDate: paymentDate,
            amount: amount,
            journalEntryId: journalEntryId,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> paymentId = const Value.absent(),
            required int employeeId,
            required DateTime paymentDate,
            required int amount,
            Value<int?> journalEntryId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              EmployeePaymentsTableCompanion.insert(
            paymentId: paymentId,
            employeeId: employeeId,
            paymentDate: paymentDate,
            amount: amount,
            journalEntryId: journalEntryId,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$EmployeePaymentsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({employeeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (employeeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.employeeId,
                    referencedTable: $$EmployeePaymentsTableTableReferences
                        ._employeeIdTable(db),
                    referencedColumn: $$EmployeePaymentsTableTableReferences
                        ._employeeIdTable(db)
                        .employeeId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$EmployeePaymentsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $EmployeePaymentsTableTable,
        EmployeePaymentsTableData,
        $$EmployeePaymentsTableTableFilterComposer,
        $$EmployeePaymentsTableTableOrderingComposer,
        $$EmployeePaymentsTableTableAnnotationComposer,
        $$EmployeePaymentsTableTableCreateCompanionBuilder,
        $$EmployeePaymentsTableTableUpdateCompanionBuilder,
        (EmployeePaymentsTableData, $$EmployeePaymentsTableTableReferences),
        EmployeePaymentsTableData,
        PrefetchHooks Function({bool employeeId})>;
typedef $$WorkTypesTableTableCreateCompanionBuilder = WorkTypesTableCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String> status,
  Value<DateTime> createdAt,
});
typedef $$WorkTypesTableTableUpdateCompanionBuilder = WorkTypesTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> status,
  Value<DateTime> createdAt,
});

final class $$WorkTypesTableTableReferences extends BaseReferences<
    _$AppDatabase, $WorkTypesTableTable, WorkTypesTableData> {
  $$WorkTypesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$KarigarProductsTableTable,
      List<KarigarProductsTableData>> _karigarProductsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.karigarProductsTable,
          aliasName: $_aliasNameGenerator(
              db.workTypesTable.id, db.karigarProductsTable.workTypeId));

  $$KarigarProductsTableTableProcessedTableManager
      get karigarProductsTableRefs {
    final manager =
        $$KarigarProductsTableTableTableManager($_db, $_db.karigarProductsTable)
            .filter((f) => f.workTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_karigarProductsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$KarigarsTableTable, List<KarigarsTableData>>
      _karigarsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.karigarsTable,
              aliasName: $_aliasNameGenerator(
                  db.workTypesTable.id, db.karigarsTable.workTypeId));

  $$KarigarsTableTableProcessedTableManager get karigarsTableRefs {
    final manager = $$KarigarsTableTableTableManager($_db, $_db.karigarsTable)
        .filter((f) => f.workTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_karigarsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$KarigarJobWorkTableTable,
      List<KarigarJobWorkTableData>> _karigarJobWorkTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.karigarJobWorkTable,
          aliasName: $_aliasNameGenerator(
              db.workTypesTable.id, db.karigarJobWorkTable.workTypeId));

  $$KarigarJobWorkTableTableProcessedTableManager get karigarJobWorkTableRefs {
    final manager =
        $$KarigarJobWorkTableTableTableManager($_db, $_db.karigarJobWorkTable)
            .filter((f) => f.workTypeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_karigarJobWorkTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$WorkTypesTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorkTypesTableTable> {
  $$WorkTypesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> karigarProductsTableRefs(
      Expression<bool> Function($$KarigarProductsTableTableFilterComposer f)
          f) {
    final $$KarigarProductsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.karigarProductsTable,
        getReferencedColumn: (t) => t.workTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarProductsTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarProductsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> karigarsTableRefs(
      Expression<bool> Function($$KarigarsTableTableFilterComposer f) f) {
    final $$KarigarsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.karigarsTable,
        getReferencedColumn: (t) => t.workTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarsTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> karigarJobWorkTableRefs(
      Expression<bool> Function($$KarigarJobWorkTableTableFilterComposer f) f) {
    final $$KarigarJobWorkTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.karigarJobWorkTable,
        getReferencedColumn: (t) => t.workTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarJobWorkTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarJobWorkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$WorkTypesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkTypesTableTable> {
  $$WorkTypesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$WorkTypesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkTypesTableTable> {
  $$WorkTypesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> karigarProductsTableRefs<T extends Object>(
      Expression<T> Function($$KarigarProductsTableTableAnnotationComposer a)
          f) {
    final $$KarigarProductsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.karigarProductsTable,
            getReferencedColumn: (t) => t.workTypeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarProductsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarProductsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> karigarsTableRefs<T extends Object>(
      Expression<T> Function($$KarigarsTableTableAnnotationComposer a) f) {
    final $$KarigarsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.karigarsTable,
        getReferencedColumn: (t) => t.workTypeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.karigarsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> karigarJobWorkTableRefs<T extends Object>(
      Expression<T> Function($$KarigarJobWorkTableTableAnnotationComposer a)
          f) {
    final $$KarigarJobWorkTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.karigarJobWorkTable,
            getReferencedColumn: (t) => t.workTypeId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$WorkTypesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WorkTypesTableTable,
    WorkTypesTableData,
    $$WorkTypesTableTableFilterComposer,
    $$WorkTypesTableTableOrderingComposer,
    $$WorkTypesTableTableAnnotationComposer,
    $$WorkTypesTableTableCreateCompanionBuilder,
    $$WorkTypesTableTableUpdateCompanionBuilder,
    (WorkTypesTableData, $$WorkTypesTableTableReferences),
    WorkTypesTableData,
    PrefetchHooks Function(
        {bool karigarProductsTableRefs,
        bool karigarsTableRefs,
        bool karigarJobWorkTableRefs})> {
  $$WorkTypesTableTableTableManager(
      _$AppDatabase db, $WorkTypesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkTypesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkTypesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkTypesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              WorkTypesTableCompanion(
            id: id,
            name: name,
            status: status,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              WorkTypesTableCompanion.insert(
            id: id,
            name: name,
            status: status,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WorkTypesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {karigarProductsTableRefs = false,
              karigarsTableRefs = false,
              karigarJobWorkTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (karigarProductsTableRefs) db.karigarProductsTable,
                if (karigarsTableRefs) db.karigarsTable,
                if (karigarJobWorkTableRefs) db.karigarJobWorkTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (karigarProductsTableRefs)
                    await $_getPrefetchedData<WorkTypesTableData,
                            $WorkTypesTableTable, KarigarProductsTableData>(
                        currentTable: table,
                        referencedTable: $$WorkTypesTableTableReferences
                            ._karigarProductsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkTypesTableTableReferences(db, table, p0)
                                .karigarProductsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workTypeId == item.id),
                        typedResults: items),
                  if (karigarsTableRefs)
                    await $_getPrefetchedData<WorkTypesTableData,
                            $WorkTypesTableTable, KarigarsTableData>(
                        currentTable: table,
                        referencedTable: $$WorkTypesTableTableReferences
                            ._karigarsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkTypesTableTableReferences(db, table, p0)
                                .karigarsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workTypeId == item.id),
                        typedResults: items),
                  if (karigarJobWorkTableRefs)
                    await $_getPrefetchedData<WorkTypesTableData,
                            $WorkTypesTableTable, KarigarJobWorkTableData>(
                        currentTable: table,
                        referencedTable: $$WorkTypesTableTableReferences
                            ._karigarJobWorkTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$WorkTypesTableTableReferences(db, table, p0)
                                .karigarJobWorkTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.workTypeId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$WorkTypesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WorkTypesTableTable,
    WorkTypesTableData,
    $$WorkTypesTableTableFilterComposer,
    $$WorkTypesTableTableOrderingComposer,
    $$WorkTypesTableTableAnnotationComposer,
    $$WorkTypesTableTableCreateCompanionBuilder,
    $$WorkTypesTableTableUpdateCompanionBuilder,
    (WorkTypesTableData, $$WorkTypesTableTableReferences),
    WorkTypesTableData,
    PrefetchHooks Function(
        {bool karigarProductsTableRefs,
        bool karigarsTableRefs,
        bool karigarJobWorkTableRefs})>;
typedef $$KarigarProductsTableTableCreateCompanionBuilder
    = KarigarProductsTableCompanion Function({
  Value<int> id,
  required int workTypeId,
  required String productName,
  required String units,
  Value<String> status,
  Value<DateTime> createdAt,
});
typedef $$KarigarProductsTableTableUpdateCompanionBuilder
    = KarigarProductsTableCompanion Function({
  Value<int> id,
  Value<int> workTypeId,
  Value<String> productName,
  Value<String> units,
  Value<String> status,
  Value<DateTime> createdAt,
});

final class $$KarigarProductsTableTableReferences extends BaseReferences<
    _$AppDatabase, $KarigarProductsTableTable, KarigarProductsTableData> {
  $$KarigarProductsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkTypesTableTable _workTypeIdTable(_$AppDatabase db) =>
      db.workTypesTable.createAlias($_aliasNameGenerator(
          db.karigarProductsTable.workTypeId, db.workTypesTable.id));

  $$WorkTypesTableTableProcessedTableManager get workTypeId {
    final $_column = $_itemColumn<int>('work_type_id')!;

    final manager = $$WorkTypesTableTableTableManager($_db, $_db.workTypesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$KarigarProductRatesTableTable,
      List<KarigarProductRatesTableData>> _karigarProductRatesTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.karigarProductRatesTable,
          aliasName: $_aliasNameGenerator(db.karigarProductsTable.id,
              db.karigarProductRatesTable.productId));

  $$KarigarProductRatesTableTableProcessedTableManager
      get karigarProductRatesTableRefs {
    final manager = $$KarigarProductRatesTableTableTableManager(
            $_db, $_db.karigarProductRatesTable)
        .filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_karigarProductRatesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$KarigarJobWorkTableTable,
      List<KarigarJobWorkTableData>> _karigarJobWorkTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.karigarJobWorkTable,
          aliasName: $_aliasNameGenerator(
              db.karigarProductsTable.id, db.karigarJobWorkTable.productId));

  $$KarigarJobWorkTableTableProcessedTableManager get karigarJobWorkTableRefs {
    final manager =
        $$KarigarJobWorkTableTableTableManager($_db, $_db.karigarJobWorkTable)
            .filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_karigarJobWorkTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$KarigarJobWorkLineItemsTableTable,
          List<KarigarJobWorkLineItemsTableData>>
      _karigarJobWorkLineItemsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.karigarJobWorkLineItemsTable,
              aliasName: $_aliasNameGenerator(db.karigarProductsTable.id,
                  db.karigarJobWorkLineItemsTable.productId));

  $$KarigarJobWorkLineItemsTableTableProcessedTableManager
      get karigarJobWorkLineItemsTableRefs {
    final manager = $$KarigarJobWorkLineItemsTableTableTableManager(
            $_db, $_db.karigarJobWorkLineItemsTable)
        .filter((f) => f.productId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_karigarJobWorkLineItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$KarigarProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $KarigarProductsTableTable> {
  $$KarigarProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get units => $composableBuilder(
      column: $table.units, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$WorkTypesTableTableFilterComposer get workTypeId {
    final $$WorkTypesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTypeId,
        referencedTable: $db.workTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTypesTableTableFilterComposer(
              $db: $db,
              $table: $db.workTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> karigarProductRatesTableRefs(
      Expression<bool> Function($$KarigarProductRatesTableTableFilterComposer f)
          f) {
    final $$KarigarProductRatesTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.karigarProductRatesTable,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarProductRatesTableTableFilterComposer(
                  $db: $db,
                  $table: $db.karigarProductRatesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> karigarJobWorkTableRefs(
      Expression<bool> Function($$KarigarJobWorkTableTableFilterComposer f) f) {
    final $$KarigarJobWorkTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.karigarJobWorkTable,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarJobWorkTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarJobWorkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> karigarJobWorkLineItemsTableRefs(
      Expression<bool> Function(
              $$KarigarJobWorkLineItemsTableTableFilterComposer f)
          f) {
    final $$KarigarJobWorkLineItemsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.karigarJobWorkLineItemsTable,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkLineItemsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$KarigarProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $KarigarProductsTableTable> {
  $$KarigarProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get units => $composableBuilder(
      column: $table.units, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$WorkTypesTableTableOrderingComposer get workTypeId {
    final $$WorkTypesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTypeId,
        referencedTable: $db.workTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTypesTableTableOrderingComposer(
              $db: $db,
              $table: $db.workTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$KarigarProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $KarigarProductsTableTable> {
  $$KarigarProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => column);

  GeneratedColumn<String> get units =>
      $composableBuilder(column: $table.units, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$WorkTypesTableTableAnnotationComposer get workTypeId {
    final $$WorkTypesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTypeId,
        referencedTable: $db.workTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTypesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.workTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> karigarProductRatesTableRefs<T extends Object>(
      Expression<T> Function(
              $$KarigarProductRatesTableTableAnnotationComposer a)
          f) {
    final $$KarigarProductRatesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.karigarProductRatesTable,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarProductRatesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarProductRatesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> karigarJobWorkTableRefs<T extends Object>(
      Expression<T> Function($$KarigarJobWorkTableTableAnnotationComposer a)
          f) {
    final $$KarigarJobWorkTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.karigarJobWorkTable,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> karigarJobWorkLineItemsTableRefs<T extends Object>(
      Expression<T> Function(
              $$KarigarJobWorkLineItemsTableTableAnnotationComposer a)
          f) {
    final $$KarigarJobWorkLineItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.karigarJobWorkLineItemsTable,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkLineItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$KarigarProductsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KarigarProductsTableTable,
    KarigarProductsTableData,
    $$KarigarProductsTableTableFilterComposer,
    $$KarigarProductsTableTableOrderingComposer,
    $$KarigarProductsTableTableAnnotationComposer,
    $$KarigarProductsTableTableCreateCompanionBuilder,
    $$KarigarProductsTableTableUpdateCompanionBuilder,
    (KarigarProductsTableData, $$KarigarProductsTableTableReferences),
    KarigarProductsTableData,
    PrefetchHooks Function(
        {bool workTypeId,
        bool karigarProductRatesTableRefs,
        bool karigarJobWorkTableRefs,
        bool karigarJobWorkLineItemsTableRefs})> {
  $$KarigarProductsTableTableTableManager(
      _$AppDatabase db, $KarigarProductsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KarigarProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KarigarProductsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KarigarProductsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> workTypeId = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<String> units = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              KarigarProductsTableCompanion(
            id: id,
            workTypeId: workTypeId,
            productName: productName,
            units: units,
            status: status,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int workTypeId,
            required String productName,
            required String units,
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              KarigarProductsTableCompanion.insert(
            id: id,
            workTypeId: workTypeId,
            productName: productName,
            units: units,
            status: status,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$KarigarProductsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {workTypeId = false,
              karigarProductRatesTableRefs = false,
              karigarJobWorkTableRefs = false,
              karigarJobWorkLineItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (karigarProductRatesTableRefs) db.karigarProductRatesTable,
                if (karigarJobWorkTableRefs) db.karigarJobWorkTable,
                if (karigarJobWorkLineItemsTableRefs)
                  db.karigarJobWorkLineItemsTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workTypeId,
                    referencedTable: $$KarigarProductsTableTableReferences
                        ._workTypeIdTable(db),
                    referencedColumn: $$KarigarProductsTableTableReferences
                        ._workTypeIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (karigarProductRatesTableRefs)
                    await $_getPrefetchedData<
                            KarigarProductsTableData,
                            $KarigarProductsTableTable,
                            KarigarProductRatesTableData>(
                        currentTable: table,
                        referencedTable: $$KarigarProductsTableTableReferences
                            ._karigarProductRatesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KarigarProductsTableTableReferences(db, table, p0)
                                .karigarProductRatesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items),
                  if (karigarJobWorkTableRefs)
                    await $_getPrefetchedData<
                            KarigarProductsTableData,
                            $KarigarProductsTableTable,
                            KarigarJobWorkTableData>(
                        currentTable: table,
                        referencedTable: $$KarigarProductsTableTableReferences
                            ._karigarJobWorkTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KarigarProductsTableTableReferences(db, table, p0)
                                .karigarJobWorkTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items),
                  if (karigarJobWorkLineItemsTableRefs)
                    await $_getPrefetchedData<
                            KarigarProductsTableData,
                            $KarigarProductsTableTable,
                            KarigarJobWorkLineItemsTableData>(
                        currentTable: table,
                        referencedTable: $$KarigarProductsTableTableReferences
                            ._karigarJobWorkLineItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KarigarProductsTableTableReferences(db, table, p0)
                                .karigarJobWorkLineItemsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$KarigarProductsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $KarigarProductsTableTable,
        KarigarProductsTableData,
        $$KarigarProductsTableTableFilterComposer,
        $$KarigarProductsTableTableOrderingComposer,
        $$KarigarProductsTableTableAnnotationComposer,
        $$KarigarProductsTableTableCreateCompanionBuilder,
        $$KarigarProductsTableTableUpdateCompanionBuilder,
        (KarigarProductsTableData, $$KarigarProductsTableTableReferences),
        KarigarProductsTableData,
        PrefetchHooks Function(
            {bool workTypeId,
            bool karigarProductRatesTableRefs,
            bool karigarJobWorkTableRefs,
            bool karigarJobWorkLineItemsTableRefs})>;
typedef $$KarigarsTableTableCreateCompanionBuilder = KarigarsTableCompanion
    Function({
  Value<int> karigarId,
  required String karigarCode,
  required String karigarName,
  required String mobile,
  Value<String?> address,
  Value<String?> aadhar,
  Value<String?> pan,
  Value<double> openingBalance,
  required String openingBalanceType,
  Value<String?> bankName,
  Value<String?> bankAccountNumber,
  Value<String?> bankIfsc,
  required int workTypeId,
  Value<String> status,
  Value<DateTime> createdAt,
});
typedef $$KarigarsTableTableUpdateCompanionBuilder = KarigarsTableCompanion
    Function({
  Value<int> karigarId,
  Value<String> karigarCode,
  Value<String> karigarName,
  Value<String> mobile,
  Value<String?> address,
  Value<String?> aadhar,
  Value<String?> pan,
  Value<double> openingBalance,
  Value<String> openingBalanceType,
  Value<String?> bankName,
  Value<String?> bankAccountNumber,
  Value<String?> bankIfsc,
  Value<int> workTypeId,
  Value<String> status,
  Value<DateTime> createdAt,
});

final class $$KarigarsTableTableReferences extends BaseReferences<_$AppDatabase,
    $KarigarsTableTable, KarigarsTableData> {
  $$KarigarsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkTypesTableTable _workTypeIdTable(_$AppDatabase db) =>
      db.workTypesTable.createAlias($_aliasNameGenerator(
          db.karigarsTable.workTypeId, db.workTypesTable.id));

  $$WorkTypesTableTableProcessedTableManager get workTypeId {
    final $_column = $_itemColumn<int>('work_type_id')!;

    final manager = $$WorkTypesTableTableTableManager($_db, $_db.workTypesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$KarigarProductRatesTableTable,
      List<KarigarProductRatesTableData>> _karigarProductRatesTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.karigarProductRatesTable,
          aliasName: $_aliasNameGenerator(db.karigarsTable.karigarId,
              db.karigarProductRatesTable.karigarId));

  $$KarigarProductRatesTableTableProcessedTableManager
      get karigarProductRatesTableRefs {
    final manager = $$KarigarProductRatesTableTableTableManager(
            $_db, $_db.karigarProductRatesTable)
        .filter((f) =>
            f.karigarId.karigarId.sqlEquals($_itemColumn<int>('karigar_id')!));

    final cache =
        $_typedResult.readTableOrNull(_karigarProductRatesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$KarigarJobWorkTableTable,
      List<KarigarJobWorkTableData>> _karigarJobWorkTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.karigarJobWorkTable,
          aliasName: $_aliasNameGenerator(
              db.karigarsTable.karigarId, db.karigarJobWorkTable.karigarId));

  $$KarigarJobWorkTableTableProcessedTableManager get karigarJobWorkTableRefs {
    final manager = $$KarigarJobWorkTableTableTableManager(
            $_db, $_db.karigarJobWorkTable)
        .filter((f) =>
            f.karigarId.karigarId.sqlEquals($_itemColumn<int>('karigar_id')!));

    final cache =
        $_typedResult.readTableOrNull(_karigarJobWorkTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$KarigarPaymentsTableTable,
      List<KarigarPaymentsTableData>> _karigarPaymentsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.karigarPaymentsTable,
          aliasName: $_aliasNameGenerator(
              db.karigarsTable.karigarId, db.karigarPaymentsTable.karigarId));

  $$KarigarPaymentsTableTableProcessedTableManager
      get karigarPaymentsTableRefs {
    final manager = $$KarigarPaymentsTableTableTableManager(
            $_db, $_db.karigarPaymentsTable)
        .filter((f) =>
            f.karigarId.karigarId.sqlEquals($_itemColumn<int>('karigar_id')!));

    final cache =
        $_typedResult.readTableOrNull(_karigarPaymentsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$KarigarsTableTableFilterComposer
    extends Composer<_$AppDatabase, $KarigarsTableTable> {
  $$KarigarsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get karigarId => $composableBuilder(
      column: $table.karigarId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get karigarCode => $composableBuilder(
      column: $table.karigarCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get karigarName => $composableBuilder(
      column: $table.karigarName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mobile => $composableBuilder(
      column: $table.mobile, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get aadhar => $composableBuilder(
      column: $table.aadhar, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pan => $composableBuilder(
      column: $table.pan, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get openingBalanceType => $composableBuilder(
      column: $table.openingBalanceType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankName => $composableBuilder(
      column: $table.bankName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankAccountNumber => $composableBuilder(
      column: $table.bankAccountNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bankIfsc => $composableBuilder(
      column: $table.bankIfsc, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$WorkTypesTableTableFilterComposer get workTypeId {
    final $$WorkTypesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTypeId,
        referencedTable: $db.workTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTypesTableTableFilterComposer(
              $db: $db,
              $table: $db.workTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> karigarProductRatesTableRefs(
      Expression<bool> Function($$KarigarProductRatesTableTableFilterComposer f)
          f) {
    final $$KarigarProductRatesTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.karigarId,
            referencedTable: $db.karigarProductRatesTable,
            getReferencedColumn: (t) => t.karigarId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarProductRatesTableTableFilterComposer(
                  $db: $db,
                  $table: $db.karigarProductRatesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> karigarJobWorkTableRefs(
      Expression<bool> Function($$KarigarJobWorkTableTableFilterComposer f) f) {
    final $$KarigarJobWorkTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.karigarId,
        referencedTable: $db.karigarJobWorkTable,
        getReferencedColumn: (t) => t.karigarId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarJobWorkTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarJobWorkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> karigarPaymentsTableRefs(
      Expression<bool> Function($$KarigarPaymentsTableTableFilterComposer f)
          f) {
    final $$KarigarPaymentsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.karigarId,
        referencedTable: $db.karigarPaymentsTable,
        getReferencedColumn: (t) => t.karigarId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarPaymentsTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarPaymentsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$KarigarsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $KarigarsTableTable> {
  $$KarigarsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get karigarId => $composableBuilder(
      column: $table.karigarId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get karigarCode => $composableBuilder(
      column: $table.karigarCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get karigarName => $composableBuilder(
      column: $table.karigarName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mobile => $composableBuilder(
      column: $table.mobile, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get aadhar => $composableBuilder(
      column: $table.aadhar, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pan => $composableBuilder(
      column: $table.pan, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get openingBalanceType => $composableBuilder(
      column: $table.openingBalanceType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankName => $composableBuilder(
      column: $table.bankName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankAccountNumber => $composableBuilder(
      column: $table.bankAccountNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bankIfsc => $composableBuilder(
      column: $table.bankIfsc, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$WorkTypesTableTableOrderingComposer get workTypeId {
    final $$WorkTypesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTypeId,
        referencedTable: $db.workTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTypesTableTableOrderingComposer(
              $db: $db,
              $table: $db.workTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$KarigarsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $KarigarsTableTable> {
  $$KarigarsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get karigarId =>
      $composableBuilder(column: $table.karigarId, builder: (column) => column);

  GeneratedColumn<String> get karigarCode => $composableBuilder(
      column: $table.karigarCode, builder: (column) => column);

  GeneratedColumn<String> get karigarName => $composableBuilder(
      column: $table.karigarName, builder: (column) => column);

  GeneratedColumn<String> get mobile =>
      $composableBuilder(column: $table.mobile, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get aadhar =>
      $composableBuilder(column: $table.aadhar, builder: (column) => column);

  GeneratedColumn<String> get pan =>
      $composableBuilder(column: $table.pan, builder: (column) => column);

  GeneratedColumn<double> get openingBalance => $composableBuilder(
      column: $table.openingBalance, builder: (column) => column);

  GeneratedColumn<String> get openingBalanceType => $composableBuilder(
      column: $table.openingBalanceType, builder: (column) => column);

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<String> get bankAccountNumber => $composableBuilder(
      column: $table.bankAccountNumber, builder: (column) => column);

  GeneratedColumn<String> get bankIfsc =>
      $composableBuilder(column: $table.bankIfsc, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$WorkTypesTableTableAnnotationComposer get workTypeId {
    final $$WorkTypesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTypeId,
        referencedTable: $db.workTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTypesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.workTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> karigarProductRatesTableRefs<T extends Object>(
      Expression<T> Function(
              $$KarigarProductRatesTableTableAnnotationComposer a)
          f) {
    final $$KarigarProductRatesTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.karigarId,
            referencedTable: $db.karigarProductRatesTable,
            getReferencedColumn: (t) => t.karigarId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarProductRatesTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarProductRatesTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> karigarJobWorkTableRefs<T extends Object>(
      Expression<T> Function($$KarigarJobWorkTableTableAnnotationComposer a)
          f) {
    final $$KarigarJobWorkTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.karigarId,
            referencedTable: $db.karigarJobWorkTable,
            getReferencedColumn: (t) => t.karigarId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> karigarPaymentsTableRefs<T extends Object>(
      Expression<T> Function($$KarigarPaymentsTableTableAnnotationComposer a)
          f) {
    final $$KarigarPaymentsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.karigarId,
            referencedTable: $db.karigarPaymentsTable,
            getReferencedColumn: (t) => t.karigarId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarPaymentsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarPaymentsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$KarigarsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KarigarsTableTable,
    KarigarsTableData,
    $$KarigarsTableTableFilterComposer,
    $$KarigarsTableTableOrderingComposer,
    $$KarigarsTableTableAnnotationComposer,
    $$KarigarsTableTableCreateCompanionBuilder,
    $$KarigarsTableTableUpdateCompanionBuilder,
    (KarigarsTableData, $$KarigarsTableTableReferences),
    KarigarsTableData,
    PrefetchHooks Function(
        {bool workTypeId,
        bool karigarProductRatesTableRefs,
        bool karigarJobWorkTableRefs,
        bool karigarPaymentsTableRefs})> {
  $$KarigarsTableTableTableManager(_$AppDatabase db, $KarigarsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KarigarsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KarigarsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KarigarsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> karigarId = const Value.absent(),
            Value<String> karigarCode = const Value.absent(),
            Value<String> karigarName = const Value.absent(),
            Value<String> mobile = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> aadhar = const Value.absent(),
            Value<String?> pan = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            Value<String> openingBalanceType = const Value.absent(),
            Value<String?> bankName = const Value.absent(),
            Value<String?> bankAccountNumber = const Value.absent(),
            Value<String?> bankIfsc = const Value.absent(),
            Value<int> workTypeId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              KarigarsTableCompanion(
            karigarId: karigarId,
            karigarCode: karigarCode,
            karigarName: karigarName,
            mobile: mobile,
            address: address,
            aadhar: aadhar,
            pan: pan,
            openingBalance: openingBalance,
            openingBalanceType: openingBalanceType,
            bankName: bankName,
            bankAccountNumber: bankAccountNumber,
            bankIfsc: bankIfsc,
            workTypeId: workTypeId,
            status: status,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> karigarId = const Value.absent(),
            required String karigarCode,
            required String karigarName,
            required String mobile,
            Value<String?> address = const Value.absent(),
            Value<String?> aadhar = const Value.absent(),
            Value<String?> pan = const Value.absent(),
            Value<double> openingBalance = const Value.absent(),
            required String openingBalanceType,
            Value<String?> bankName = const Value.absent(),
            Value<String?> bankAccountNumber = const Value.absent(),
            Value<String?> bankIfsc = const Value.absent(),
            required int workTypeId,
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              KarigarsTableCompanion.insert(
            karigarId: karigarId,
            karigarCode: karigarCode,
            karigarName: karigarName,
            mobile: mobile,
            address: address,
            aadhar: aadhar,
            pan: pan,
            openingBalance: openingBalance,
            openingBalanceType: openingBalanceType,
            bankName: bankName,
            bankAccountNumber: bankAccountNumber,
            bankIfsc: bankIfsc,
            workTypeId: workTypeId,
            status: status,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$KarigarsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {workTypeId = false,
              karigarProductRatesTableRefs = false,
              karigarJobWorkTableRefs = false,
              karigarPaymentsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (karigarProductRatesTableRefs) db.karigarProductRatesTable,
                if (karigarJobWorkTableRefs) db.karigarJobWorkTable,
                if (karigarPaymentsTableRefs) db.karigarPaymentsTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workTypeId,
                    referencedTable:
                        $$KarigarsTableTableReferences._workTypeIdTable(db),
                    referencedColumn:
                        $$KarigarsTableTableReferences._workTypeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (karigarProductRatesTableRefs)
                    await $_getPrefetchedData<KarigarsTableData,
                            $KarigarsTableTable, KarigarProductRatesTableData>(
                        currentTable: table,
                        referencedTable: $$KarigarsTableTableReferences
                            ._karigarProductRatesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KarigarsTableTableReferences(db, table, p0)
                                .karigarProductRatesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.karigarId == item.karigarId),
                        typedResults: items),
                  if (karigarJobWorkTableRefs)
                    await $_getPrefetchedData<KarigarsTableData,
                            $KarigarsTableTable, KarigarJobWorkTableData>(
                        currentTable: table,
                        referencedTable: $$KarigarsTableTableReferences
                            ._karigarJobWorkTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KarigarsTableTableReferences(db, table, p0)
                                .karigarJobWorkTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.karigarId == item.karigarId),
                        typedResults: items),
                  if (karigarPaymentsTableRefs)
                    await $_getPrefetchedData<KarigarsTableData,
                            $KarigarsTableTable, KarigarPaymentsTableData>(
                        currentTable: table,
                        referencedTable: $$KarigarsTableTableReferences
                            ._karigarPaymentsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KarigarsTableTableReferences(db, table, p0)
                                .karigarPaymentsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.karigarId == item.karigarId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$KarigarsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $KarigarsTableTable,
    KarigarsTableData,
    $$KarigarsTableTableFilterComposer,
    $$KarigarsTableTableOrderingComposer,
    $$KarigarsTableTableAnnotationComposer,
    $$KarigarsTableTableCreateCompanionBuilder,
    $$KarigarsTableTableUpdateCompanionBuilder,
    (KarigarsTableData, $$KarigarsTableTableReferences),
    KarigarsTableData,
    PrefetchHooks Function(
        {bool workTypeId,
        bool karigarProductRatesTableRefs,
        bool karigarJobWorkTableRefs,
        bool karigarPaymentsTableRefs})>;
typedef $$KarigarProductRatesTableTableCreateCompanionBuilder
    = KarigarProductRatesTableCompanion Function({
  Value<int> id,
  required int karigarId,
  required int productId,
  required String unit,
  required double rate,
});
typedef $$KarigarProductRatesTableTableUpdateCompanionBuilder
    = KarigarProductRatesTableCompanion Function({
  Value<int> id,
  Value<int> karigarId,
  Value<int> productId,
  Value<String> unit,
  Value<double> rate,
});

final class $$KarigarProductRatesTableTableReferences extends BaseReferences<
    _$AppDatabase,
    $KarigarProductRatesTableTable,
    KarigarProductRatesTableData> {
  $$KarigarProductRatesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $KarigarsTableTable _karigarIdTable(_$AppDatabase db) =>
      db.karigarsTable.createAlias($_aliasNameGenerator(
          db.karigarProductRatesTable.karigarId, db.karigarsTable.karigarId));

  $$KarigarsTableTableProcessedTableManager get karigarId {
    final $_column = $_itemColumn<int>('karigar_id')!;

    final manager = $$KarigarsTableTableTableManager($_db, $_db.karigarsTable)
        .filter((f) => f.karigarId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_karigarIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $KarigarProductsTableTable _productIdTable(_$AppDatabase db) =>
      db.karigarProductsTable.createAlias($_aliasNameGenerator(
          db.karigarProductRatesTable.productId, db.karigarProductsTable.id));

  $$KarigarProductsTableTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager =
        $$KarigarProductsTableTableTableManager($_db, $_db.karigarProductsTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$KarigarProductRatesTableTableFilterComposer
    extends Composer<_$AppDatabase, $KarigarProductRatesTableTable> {
  $$KarigarProductRatesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnFilters(column));

  $$KarigarsTableTableFilterComposer get karigarId {
    final $$KarigarsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.karigarId,
        referencedTable: $db.karigarsTable,
        getReferencedColumn: (t) => t.karigarId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarsTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KarigarProductsTableTableFilterComposer get productId {
    final $$KarigarProductsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.karigarProductsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarProductsTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarProductsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$KarigarProductRatesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $KarigarProductRatesTableTable> {
  $$KarigarProductRatesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnOrderings(column));

  $$KarigarsTableTableOrderingComposer get karigarId {
    final $$KarigarsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.karigarId,
        referencedTable: $db.karigarsTable,
        getReferencedColumn: (t) => t.karigarId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarsTableTableOrderingComposer(
              $db: $db,
              $table: $db.karigarsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KarigarProductsTableTableOrderingComposer get productId {
    final $$KarigarProductsTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productId,
            referencedTable: $db.karigarProductsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarProductsTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.karigarProductsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$KarigarProductRatesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $KarigarProductRatesTableTable> {
  $$KarigarProductRatesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  $$KarigarsTableTableAnnotationComposer get karigarId {
    final $$KarigarsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.karigarId,
        referencedTable: $db.karigarsTable,
        getReferencedColumn: (t) => t.karigarId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.karigarsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KarigarProductsTableTableAnnotationComposer get productId {
    final $$KarigarProductsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productId,
            referencedTable: $db.karigarProductsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarProductsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarProductsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$KarigarProductRatesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KarigarProductRatesTableTable,
    KarigarProductRatesTableData,
    $$KarigarProductRatesTableTableFilterComposer,
    $$KarigarProductRatesTableTableOrderingComposer,
    $$KarigarProductRatesTableTableAnnotationComposer,
    $$KarigarProductRatesTableTableCreateCompanionBuilder,
    $$KarigarProductRatesTableTableUpdateCompanionBuilder,
    (KarigarProductRatesTableData, $$KarigarProductRatesTableTableReferences),
    KarigarProductRatesTableData,
    PrefetchHooks Function({bool karigarId, bool productId})> {
  $$KarigarProductRatesTableTableTableManager(
      _$AppDatabase db, $KarigarProductRatesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KarigarProductRatesTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$KarigarProductRatesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KarigarProductRatesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> karigarId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> rate = const Value.absent(),
          }) =>
              KarigarProductRatesTableCompanion(
            id: id,
            karigarId: karigarId,
            productId: productId,
            unit: unit,
            rate: rate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int karigarId,
            required int productId,
            required String unit,
            required double rate,
          }) =>
              KarigarProductRatesTableCompanion.insert(
            id: id,
            karigarId: karigarId,
            productId: productId,
            unit: unit,
            rate: rate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$KarigarProductRatesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({karigarId = false, productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (karigarId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.karigarId,
                    referencedTable: $$KarigarProductRatesTableTableReferences
                        ._karigarIdTable(db),
                    referencedColumn: $$KarigarProductRatesTableTableReferences
                        ._karigarIdTable(db)
                        .karigarId,
                  ) as T;
                }
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable: $$KarigarProductRatesTableTableReferences
                        ._productIdTable(db),
                    referencedColumn: $$KarigarProductRatesTableTableReferences
                        ._productIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$KarigarProductRatesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $KarigarProductRatesTableTable,
        KarigarProductRatesTableData,
        $$KarigarProductRatesTableTableFilterComposer,
        $$KarigarProductRatesTableTableOrderingComposer,
        $$KarigarProductRatesTableTableAnnotationComposer,
        $$KarigarProductRatesTableTableCreateCompanionBuilder,
        $$KarigarProductRatesTableTableUpdateCompanionBuilder,
        (
          KarigarProductRatesTableData,
          $$KarigarProductRatesTableTableReferences
        ),
        KarigarProductRatesTableData,
        PrefetchHooks Function({bool karigarId, bool productId})>;
typedef $$KarigarJobWorkTableTableCreateCompanionBuilder
    = KarigarJobWorkTableCompanion Function({
  Value<int> id,
  required String jobCode,
  required int workTypeId,
  required int karigarId,
  Value<int?> productId,
  Value<double?> rate,
  Value<String?> unit,
  Value<double> quantity,
  Value<double> quantityRec,
  Value<bool> isMulti,
  Value<String> status,
  required DateTime allotDate,
  Value<DateTime> createdAt,
});
typedef $$KarigarJobWorkTableTableUpdateCompanionBuilder
    = KarigarJobWorkTableCompanion Function({
  Value<int> id,
  Value<String> jobCode,
  Value<int> workTypeId,
  Value<int> karigarId,
  Value<int?> productId,
  Value<double?> rate,
  Value<String?> unit,
  Value<double> quantity,
  Value<double> quantityRec,
  Value<bool> isMulti,
  Value<String> status,
  Value<DateTime> allotDate,
  Value<DateTime> createdAt,
});

final class $$KarigarJobWorkTableTableReferences extends BaseReferences<
    _$AppDatabase, $KarigarJobWorkTableTable, KarigarJobWorkTableData> {
  $$KarigarJobWorkTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $WorkTypesTableTable _workTypeIdTable(_$AppDatabase db) =>
      db.workTypesTable.createAlias($_aliasNameGenerator(
          db.karigarJobWorkTable.workTypeId, db.workTypesTable.id));

  $$WorkTypesTableTableProcessedTableManager get workTypeId {
    final $_column = $_itemColumn<int>('work_type_id')!;

    final manager = $$WorkTypesTableTableTableManager($_db, $_db.workTypesTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $KarigarsTableTable _karigarIdTable(_$AppDatabase db) =>
      db.karigarsTable.createAlias($_aliasNameGenerator(
          db.karigarJobWorkTable.karigarId, db.karigarsTable.karigarId));

  $$KarigarsTableTableProcessedTableManager get karigarId {
    final $_column = $_itemColumn<int>('karigar_id')!;

    final manager = $$KarigarsTableTableTableManager($_db, $_db.karigarsTable)
        .filter((f) => f.karigarId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_karigarIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $KarigarProductsTableTable _productIdTable(_$AppDatabase db) =>
      db.karigarProductsTable.createAlias($_aliasNameGenerator(
          db.karigarJobWorkTable.productId, db.karigarProductsTable.id));

  $$KarigarProductsTableTableProcessedTableManager? get productId {
    final $_column = $_itemColumn<int>('product_id');
    if ($_column == null) return null;
    final manager =
        $$KarigarProductsTableTableTableManager($_db, $_db.karigarProductsTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$KarigarJobWorkLineItemsTableTable,
          List<KarigarJobWorkLineItemsTableData>>
      _karigarJobWorkLineItemsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.karigarJobWorkLineItemsTable,
              aliasName: $_aliasNameGenerator(db.karigarJobWorkTable.id,
                  db.karigarJobWorkLineItemsTable.jobWorkId));

  $$KarigarJobWorkLineItemsTableTableProcessedTableManager
      get karigarJobWorkLineItemsTableRefs {
    final manager = $$KarigarJobWorkLineItemsTableTableTableManager(
            $_db, $_db.karigarJobWorkLineItemsTable)
        .filter((f) => f.jobWorkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_karigarJobWorkLineItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$JobWorkAllotmentsTableTable,
      List<JobWorkAllotmentsTableData>> _jobWorkAllotmentsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.jobWorkAllotmentsTable,
          aliasName: $_aliasNameGenerator(
              db.karigarJobWorkTable.id, db.jobWorkAllotmentsTable.jobWorkId));

  $$JobWorkAllotmentsTableTableProcessedTableManager
      get jobWorkAllotmentsTableRefs {
    final manager = $$JobWorkAllotmentsTableTableTableManager(
            $_db, $_db.jobWorkAllotmentsTable)
        .filter((f) => f.jobWorkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_jobWorkAllotmentsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$JobWorkReceiptsTableTable,
      List<JobWorkReceiptsTableData>> _jobWorkReceiptsTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.jobWorkReceiptsTable,
          aliasName: $_aliasNameGenerator(
              db.karigarJobWorkTable.id, db.jobWorkReceiptsTable.jobWorkId));

  $$JobWorkReceiptsTableTableProcessedTableManager
      get jobWorkReceiptsTableRefs {
    final manager =
        $$JobWorkReceiptsTableTableTableManager($_db, $_db.jobWorkReceiptsTable)
            .filter((f) => f.jobWorkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_jobWorkReceiptsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$JobWorkRemarksTableTable,
      List<JobWorkRemarksTableData>> _jobWorkRemarksTableRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.jobWorkRemarksTable,
          aliasName: $_aliasNameGenerator(
              db.karigarJobWorkTable.id, db.jobWorkRemarksTable.jobWorkId));

  $$JobWorkRemarksTableTableProcessedTableManager get jobWorkRemarksTableRefs {
    final manager =
        $$JobWorkRemarksTableTableTableManager($_db, $_db.jobWorkRemarksTable)
            .filter((f) => f.jobWorkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_jobWorkRemarksTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$KarigarJobWorkTableTableFilterComposer
    extends Composer<_$AppDatabase, $KarigarJobWorkTableTable> {
  $$KarigarJobWorkTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get jobCode => $composableBuilder(
      column: $table.jobCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get quantityRec => $composableBuilder(
      column: $table.quantityRec, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isMulti => $composableBuilder(
      column: $table.isMulti, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get allotDate => $composableBuilder(
      column: $table.allotDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$WorkTypesTableTableFilterComposer get workTypeId {
    final $$WorkTypesTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTypeId,
        referencedTable: $db.workTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTypesTableTableFilterComposer(
              $db: $db,
              $table: $db.workTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KarigarsTableTableFilterComposer get karigarId {
    final $$KarigarsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.karigarId,
        referencedTable: $db.karigarsTable,
        getReferencedColumn: (t) => t.karigarId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarsTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KarigarProductsTableTableFilterComposer get productId {
    final $$KarigarProductsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.karigarProductsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarProductsTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarProductsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> karigarJobWorkLineItemsTableRefs(
      Expression<bool> Function(
              $$KarigarJobWorkLineItemsTableTableFilterComposer f)
          f) {
    final $$KarigarJobWorkLineItemsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.karigarJobWorkLineItemsTable,
            getReferencedColumn: (t) => t.jobWorkId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkLineItemsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> jobWorkAllotmentsTableRefs(
      Expression<bool> Function($$JobWorkAllotmentsTableTableFilterComposer f)
          f) {
    final $$JobWorkAllotmentsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.jobWorkAllotmentsTable,
            getReferencedColumn: (t) => t.jobWorkId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JobWorkAllotmentsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.jobWorkAllotmentsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> jobWorkReceiptsTableRefs(
      Expression<bool> Function($$JobWorkReceiptsTableTableFilterComposer f)
          f) {
    final $$JobWorkReceiptsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.jobWorkReceiptsTable,
        getReferencedColumn: (t) => t.jobWorkId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JobWorkReceiptsTableTableFilterComposer(
              $db: $db,
              $table: $db.jobWorkReceiptsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> jobWorkRemarksTableRefs(
      Expression<bool> Function($$JobWorkRemarksTableTableFilterComposer f) f) {
    final $$JobWorkRemarksTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.jobWorkRemarksTable,
        getReferencedColumn: (t) => t.jobWorkId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JobWorkRemarksTableTableFilterComposer(
              $db: $db,
              $table: $db.jobWorkRemarksTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$KarigarJobWorkTableTableOrderingComposer
    extends Composer<_$AppDatabase, $KarigarJobWorkTableTable> {
  $$KarigarJobWorkTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get jobCode => $composableBuilder(
      column: $table.jobCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get quantityRec => $composableBuilder(
      column: $table.quantityRec, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isMulti => $composableBuilder(
      column: $table.isMulti, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get allotDate => $composableBuilder(
      column: $table.allotDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$WorkTypesTableTableOrderingComposer get workTypeId {
    final $$WorkTypesTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTypeId,
        referencedTable: $db.workTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTypesTableTableOrderingComposer(
              $db: $db,
              $table: $db.workTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KarigarsTableTableOrderingComposer get karigarId {
    final $$KarigarsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.karigarId,
        referencedTable: $db.karigarsTable,
        getReferencedColumn: (t) => t.karigarId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarsTableTableOrderingComposer(
              $db: $db,
              $table: $db.karigarsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KarigarProductsTableTableOrderingComposer get productId {
    final $$KarigarProductsTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productId,
            referencedTable: $db.karigarProductsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarProductsTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.karigarProductsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$KarigarJobWorkTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $KarigarJobWorkTableTable> {
  $$KarigarJobWorkTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get jobCode =>
      $composableBuilder(column: $table.jobCode, builder: (column) => column);

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<double> get quantityRec => $composableBuilder(
      column: $table.quantityRec, builder: (column) => column);

  GeneratedColumn<bool> get isMulti =>
      $composableBuilder(column: $table.isMulti, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get allotDate =>
      $composableBuilder(column: $table.allotDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$WorkTypesTableTableAnnotationComposer get workTypeId {
    final $$WorkTypesTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.workTypeId,
        referencedTable: $db.workTypesTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WorkTypesTableTableAnnotationComposer(
              $db: $db,
              $table: $db.workTypesTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KarigarsTableTableAnnotationComposer get karigarId {
    final $$KarigarsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.karigarId,
        referencedTable: $db.karigarsTable,
        getReferencedColumn: (t) => t.karigarId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.karigarsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KarigarProductsTableTableAnnotationComposer get productId {
    final $$KarigarProductsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productId,
            referencedTable: $db.karigarProductsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarProductsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarProductsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> karigarJobWorkLineItemsTableRefs<T extends Object>(
      Expression<T> Function(
              $$KarigarJobWorkLineItemsTableTableAnnotationComposer a)
          f) {
    final $$KarigarJobWorkLineItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.karigarJobWorkLineItemsTable,
            getReferencedColumn: (t) => t.jobWorkId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkLineItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> jobWorkAllotmentsTableRefs<T extends Object>(
      Expression<T> Function($$JobWorkAllotmentsTableTableAnnotationComposer a)
          f) {
    final $$JobWorkAllotmentsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.jobWorkAllotmentsTable,
            getReferencedColumn: (t) => t.jobWorkId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JobWorkAllotmentsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.jobWorkAllotmentsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> jobWorkReceiptsTableRefs<T extends Object>(
      Expression<T> Function($$JobWorkReceiptsTableTableAnnotationComposer a)
          f) {
    final $$JobWorkReceiptsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.jobWorkReceiptsTable,
            getReferencedColumn: (t) => t.jobWorkId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JobWorkReceiptsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.jobWorkReceiptsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> jobWorkRemarksTableRefs<T extends Object>(
      Expression<T> Function($$JobWorkRemarksTableTableAnnotationComposer a)
          f) {
    final $$JobWorkRemarksTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.jobWorkRemarksTable,
            getReferencedColumn: (t) => t.jobWorkId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JobWorkRemarksTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.jobWorkRemarksTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$KarigarJobWorkTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KarigarJobWorkTableTable,
    KarigarJobWorkTableData,
    $$KarigarJobWorkTableTableFilterComposer,
    $$KarigarJobWorkTableTableOrderingComposer,
    $$KarigarJobWorkTableTableAnnotationComposer,
    $$KarigarJobWorkTableTableCreateCompanionBuilder,
    $$KarigarJobWorkTableTableUpdateCompanionBuilder,
    (KarigarJobWorkTableData, $$KarigarJobWorkTableTableReferences),
    KarigarJobWorkTableData,
    PrefetchHooks Function(
        {bool workTypeId,
        bool karigarId,
        bool productId,
        bool karigarJobWorkLineItemsTableRefs,
        bool jobWorkAllotmentsTableRefs,
        bool jobWorkReceiptsTableRefs,
        bool jobWorkRemarksTableRefs})> {
  $$KarigarJobWorkTableTableTableManager(
      _$AppDatabase db, $KarigarJobWorkTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KarigarJobWorkTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KarigarJobWorkTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KarigarJobWorkTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> jobCode = const Value.absent(),
            Value<int> workTypeId = const Value.absent(),
            Value<int> karigarId = const Value.absent(),
            Value<int?> productId = const Value.absent(),
            Value<double?> rate = const Value.absent(),
            Value<String?> unit = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> quantityRec = const Value.absent(),
            Value<bool> isMulti = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> allotDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              KarigarJobWorkTableCompanion(
            id: id,
            jobCode: jobCode,
            workTypeId: workTypeId,
            karigarId: karigarId,
            productId: productId,
            rate: rate,
            unit: unit,
            quantity: quantity,
            quantityRec: quantityRec,
            isMulti: isMulti,
            status: status,
            allotDate: allotDate,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String jobCode,
            required int workTypeId,
            required int karigarId,
            Value<int?> productId = const Value.absent(),
            Value<double?> rate = const Value.absent(),
            Value<String?> unit = const Value.absent(),
            Value<double> quantity = const Value.absent(),
            Value<double> quantityRec = const Value.absent(),
            Value<bool> isMulti = const Value.absent(),
            Value<String> status = const Value.absent(),
            required DateTime allotDate,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              KarigarJobWorkTableCompanion.insert(
            id: id,
            jobCode: jobCode,
            workTypeId: workTypeId,
            karigarId: karigarId,
            productId: productId,
            rate: rate,
            unit: unit,
            quantity: quantity,
            quantityRec: quantityRec,
            isMulti: isMulti,
            status: status,
            allotDate: allotDate,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$KarigarJobWorkTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {workTypeId = false,
              karigarId = false,
              productId = false,
              karigarJobWorkLineItemsTableRefs = false,
              jobWorkAllotmentsTableRefs = false,
              jobWorkReceiptsTableRefs = false,
              jobWorkRemarksTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (karigarJobWorkLineItemsTableRefs)
                  db.karigarJobWorkLineItemsTable,
                if (jobWorkAllotmentsTableRefs) db.jobWorkAllotmentsTable,
                if (jobWorkReceiptsTableRefs) db.jobWorkReceiptsTable,
                if (jobWorkRemarksTableRefs) db.jobWorkRemarksTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (workTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.workTypeId,
                    referencedTable: $$KarigarJobWorkTableTableReferences
                        ._workTypeIdTable(db),
                    referencedColumn: $$KarigarJobWorkTableTableReferences
                        ._workTypeIdTable(db)
                        .id,
                  ) as T;
                }
                if (karigarId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.karigarId,
                    referencedTable: $$KarigarJobWorkTableTableReferences
                        ._karigarIdTable(db),
                    referencedColumn: $$KarigarJobWorkTableTableReferences
                        ._karigarIdTable(db)
                        .karigarId,
                  ) as T;
                }
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable: $$KarigarJobWorkTableTableReferences
                        ._productIdTable(db),
                    referencedColumn: $$KarigarJobWorkTableTableReferences
                        ._productIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (karigarJobWorkLineItemsTableRefs)
                    await $_getPrefetchedData<
                            KarigarJobWorkTableData,
                            $KarigarJobWorkTableTable,
                            KarigarJobWorkLineItemsTableData>(
                        currentTable: table,
                        referencedTable: $$KarigarJobWorkTableTableReferences
                            ._karigarJobWorkLineItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KarigarJobWorkTableTableReferences(db, table, p0)
                                .karigarJobWorkLineItemsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.jobWorkId == item.id),
                        typedResults: items),
                  if (jobWorkAllotmentsTableRefs)
                    await $_getPrefetchedData<
                            KarigarJobWorkTableData,
                            $KarigarJobWorkTableTable,
                            JobWorkAllotmentsTableData>(
                        currentTable: table,
                        referencedTable: $$KarigarJobWorkTableTableReferences
                            ._jobWorkAllotmentsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KarigarJobWorkTableTableReferences(db, table, p0)
                                .jobWorkAllotmentsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.jobWorkId == item.id),
                        typedResults: items),
                  if (jobWorkReceiptsTableRefs)
                    await $_getPrefetchedData<
                            KarigarJobWorkTableData,
                            $KarigarJobWorkTableTable,
                            JobWorkReceiptsTableData>(
                        currentTable: table,
                        referencedTable: $$KarigarJobWorkTableTableReferences
                            ._jobWorkReceiptsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KarigarJobWorkTableTableReferences(db, table, p0)
                                .jobWorkReceiptsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.jobWorkId == item.id),
                        typedResults: items),
                  if (jobWorkRemarksTableRefs)
                    await $_getPrefetchedData<KarigarJobWorkTableData,
                            $KarigarJobWorkTableTable, JobWorkRemarksTableData>(
                        currentTable: table,
                        referencedTable: $$KarigarJobWorkTableTableReferences
                            ._jobWorkRemarksTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KarigarJobWorkTableTableReferences(db, table, p0)
                                .jobWorkRemarksTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.jobWorkId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$KarigarJobWorkTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $KarigarJobWorkTableTable,
    KarigarJobWorkTableData,
    $$KarigarJobWorkTableTableFilterComposer,
    $$KarigarJobWorkTableTableOrderingComposer,
    $$KarigarJobWorkTableTableAnnotationComposer,
    $$KarigarJobWorkTableTableCreateCompanionBuilder,
    $$KarigarJobWorkTableTableUpdateCompanionBuilder,
    (KarigarJobWorkTableData, $$KarigarJobWorkTableTableReferences),
    KarigarJobWorkTableData,
    PrefetchHooks Function(
        {bool workTypeId,
        bool karigarId,
        bool productId,
        bool karigarJobWorkLineItemsTableRefs,
        bool jobWorkAllotmentsTableRefs,
        bool jobWorkReceiptsTableRefs,
        bool jobWorkRemarksTableRefs})>;
typedef $$KarigarJobWorkLineItemsTableTableCreateCompanionBuilder
    = KarigarJobWorkLineItemsTableCompanion Function({
  Value<int> id,
  required int jobWorkId,
  required int productId,
  required String unit,
  required double rate,
  required double qtyAllotted,
  Value<double> qtyReceived,
});
typedef $$KarigarJobWorkLineItemsTableTableUpdateCompanionBuilder
    = KarigarJobWorkLineItemsTableCompanion Function({
  Value<int> id,
  Value<int> jobWorkId,
  Value<int> productId,
  Value<String> unit,
  Value<double> rate,
  Value<double> qtyAllotted,
  Value<double> qtyReceived,
});

final class $$KarigarJobWorkLineItemsTableTableReferences
    extends BaseReferences<_$AppDatabase, $KarigarJobWorkLineItemsTableTable,
        KarigarJobWorkLineItemsTableData> {
  $$KarigarJobWorkLineItemsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $KarigarJobWorkTableTable _jobWorkIdTable(_$AppDatabase db) =>
      db.karigarJobWorkTable.createAlias($_aliasNameGenerator(
          db.karigarJobWorkLineItemsTable.jobWorkId,
          db.karigarJobWorkTable.id));

  $$KarigarJobWorkTableTableProcessedTableManager get jobWorkId {
    final $_column = $_itemColumn<int>('job_work_id')!;

    final manager =
        $$KarigarJobWorkTableTableTableManager($_db, $_db.karigarJobWorkTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_jobWorkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $KarigarProductsTableTable _productIdTable(_$AppDatabase db) =>
      db.karigarProductsTable.createAlias($_aliasNameGenerator(
          db.karigarJobWorkLineItemsTable.productId,
          db.karigarProductsTable.id));

  $$KarigarProductsTableTableProcessedTableManager get productId {
    final $_column = $_itemColumn<int>('product_id')!;

    final manager =
        $$KarigarProductsTableTableTableManager($_db, $_db.karigarProductsTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$JobWorkReceiptLineItemsTableTable,
          List<JobWorkReceiptLineItemsTableData>>
      _jobWorkReceiptLineItemsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.jobWorkReceiptLineItemsTable,
              aliasName: $_aliasNameGenerator(
                  db.karigarJobWorkLineItemsTable.id,
                  db.jobWorkReceiptLineItemsTable.jobWorkLineItemId));

  $$JobWorkReceiptLineItemsTableTableProcessedTableManager
      get jobWorkReceiptLineItemsTableRefs {
    final manager = $$JobWorkReceiptLineItemsTableTableTableManager(
            $_db, $_db.jobWorkReceiptLineItemsTable)
        .filter(
            (f) => f.jobWorkLineItemId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_jobWorkReceiptLineItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$KarigarJobWorkLineItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $KarigarJobWorkLineItemsTableTable> {
  $$KarigarJobWorkLineItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get qtyAllotted => $composableBuilder(
      column: $table.qtyAllotted, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get qtyReceived => $composableBuilder(
      column: $table.qtyReceived, builder: (column) => ColumnFilters(column));

  $$KarigarJobWorkTableTableFilterComposer get jobWorkId {
    final $$KarigarJobWorkTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.jobWorkId,
        referencedTable: $db.karigarJobWorkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarJobWorkTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarJobWorkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KarigarProductsTableTableFilterComposer get productId {
    final $$KarigarProductsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.karigarProductsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarProductsTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarProductsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> jobWorkReceiptLineItemsTableRefs(
      Expression<bool> Function(
              $$JobWorkReceiptLineItemsTableTableFilterComposer f)
          f) {
    final $$JobWorkReceiptLineItemsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.jobWorkReceiptLineItemsTable,
            getReferencedColumn: (t) => t.jobWorkLineItemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JobWorkReceiptLineItemsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.jobWorkReceiptLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$KarigarJobWorkLineItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $KarigarJobWorkLineItemsTableTable> {
  $$KarigarJobWorkLineItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rate => $composableBuilder(
      column: $table.rate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get qtyAllotted => $composableBuilder(
      column: $table.qtyAllotted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get qtyReceived => $composableBuilder(
      column: $table.qtyReceived, builder: (column) => ColumnOrderings(column));

  $$KarigarJobWorkTableTableOrderingComposer get jobWorkId {
    final $$KarigarJobWorkTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.jobWorkId,
            referencedTable: $db.karigarJobWorkTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$KarigarProductsTableTableOrderingComposer get productId {
    final $$KarigarProductsTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productId,
            referencedTable: $db.karigarProductsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarProductsTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.karigarProductsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$KarigarJobWorkLineItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $KarigarJobWorkLineItemsTableTable> {
  $$KarigarJobWorkLineItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get rate =>
      $composableBuilder(column: $table.rate, builder: (column) => column);

  GeneratedColumn<double> get qtyAllotted => $composableBuilder(
      column: $table.qtyAllotted, builder: (column) => column);

  GeneratedColumn<double> get qtyReceived => $composableBuilder(
      column: $table.qtyReceived, builder: (column) => column);

  $$KarigarJobWorkTableTableAnnotationComposer get jobWorkId {
    final $$KarigarJobWorkTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.jobWorkId,
            referencedTable: $db.karigarJobWorkTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$KarigarProductsTableTableAnnotationComposer get productId {
    final $$KarigarProductsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productId,
            referencedTable: $db.karigarProductsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarProductsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarProductsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> jobWorkReceiptLineItemsTableRefs<T extends Object>(
      Expression<T> Function(
              $$JobWorkReceiptLineItemsTableTableAnnotationComposer a)
          f) {
    final $$JobWorkReceiptLineItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.jobWorkReceiptLineItemsTable,
            getReferencedColumn: (t) => t.jobWorkLineItemId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JobWorkReceiptLineItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.jobWorkReceiptLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$KarigarJobWorkLineItemsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KarigarJobWorkLineItemsTableTable,
    KarigarJobWorkLineItemsTableData,
    $$KarigarJobWorkLineItemsTableTableFilterComposer,
    $$KarigarJobWorkLineItemsTableTableOrderingComposer,
    $$KarigarJobWorkLineItemsTableTableAnnotationComposer,
    $$KarigarJobWorkLineItemsTableTableCreateCompanionBuilder,
    $$KarigarJobWorkLineItemsTableTableUpdateCompanionBuilder,
    (
      KarigarJobWorkLineItemsTableData,
      $$KarigarJobWorkLineItemsTableTableReferences
    ),
    KarigarJobWorkLineItemsTableData,
    PrefetchHooks Function(
        {bool jobWorkId,
        bool productId,
        bool jobWorkReceiptLineItemsTableRefs})> {
  $$KarigarJobWorkLineItemsTableTableTableManager(
      _$AppDatabase db, $KarigarJobWorkLineItemsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KarigarJobWorkLineItemsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$KarigarJobWorkLineItemsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KarigarJobWorkLineItemsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> jobWorkId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<double> rate = const Value.absent(),
            Value<double> qtyAllotted = const Value.absent(),
            Value<double> qtyReceived = const Value.absent(),
          }) =>
              KarigarJobWorkLineItemsTableCompanion(
            id: id,
            jobWorkId: jobWorkId,
            productId: productId,
            unit: unit,
            rate: rate,
            qtyAllotted: qtyAllotted,
            qtyReceived: qtyReceived,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int jobWorkId,
            required int productId,
            required String unit,
            required double rate,
            required double qtyAllotted,
            Value<double> qtyReceived = const Value.absent(),
          }) =>
              KarigarJobWorkLineItemsTableCompanion.insert(
            id: id,
            jobWorkId: jobWorkId,
            productId: productId,
            unit: unit,
            rate: rate,
            qtyAllotted: qtyAllotted,
            qtyReceived: qtyReceived,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$KarigarJobWorkLineItemsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {jobWorkId = false,
              productId = false,
              jobWorkReceiptLineItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (jobWorkReceiptLineItemsTableRefs)
                  db.jobWorkReceiptLineItemsTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (jobWorkId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.jobWorkId,
                    referencedTable:
                        $$KarigarJobWorkLineItemsTableTableReferences
                            ._jobWorkIdTable(db),
                    referencedColumn:
                        $$KarigarJobWorkLineItemsTableTableReferences
                            ._jobWorkIdTable(db)
                            .id,
                  ) as T;
                }
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable:
                        $$KarigarJobWorkLineItemsTableTableReferences
                            ._productIdTable(db),
                    referencedColumn:
                        $$KarigarJobWorkLineItemsTableTableReferences
                            ._productIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (jobWorkReceiptLineItemsTableRefs)
                    await $_getPrefetchedData<
                            KarigarJobWorkLineItemsTableData,
                            $KarigarJobWorkLineItemsTableTable,
                            JobWorkReceiptLineItemsTableData>(
                        currentTable: table,
                        referencedTable:
                            $$KarigarJobWorkLineItemsTableTableReferences
                                ._jobWorkReceiptLineItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$KarigarJobWorkLineItemsTableTableReferences(
                                    db, table, p0)
                                .jobWorkReceiptLineItemsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.jobWorkLineItemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$KarigarJobWorkLineItemsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $KarigarJobWorkLineItemsTableTable,
        KarigarJobWorkLineItemsTableData,
        $$KarigarJobWorkLineItemsTableTableFilterComposer,
        $$KarigarJobWorkLineItemsTableTableOrderingComposer,
        $$KarigarJobWorkLineItemsTableTableAnnotationComposer,
        $$KarigarJobWorkLineItemsTableTableCreateCompanionBuilder,
        $$KarigarJobWorkLineItemsTableTableUpdateCompanionBuilder,
        (
          KarigarJobWorkLineItemsTableData,
          $$KarigarJobWorkLineItemsTableTableReferences
        ),
        KarigarJobWorkLineItemsTableData,
        PrefetchHooks Function(
            {bool jobWorkId,
            bool productId,
            bool jobWorkReceiptLineItemsTableRefs})>;
typedef $$JobWorkAllotmentsTableTableCreateCompanionBuilder
    = JobWorkAllotmentsTableCompanion Function({
  Value<int> id,
  required int jobWorkId,
  required double weight,
  required DateTime allotDate,
  Value<DateTime> createdAt,
});
typedef $$JobWorkAllotmentsTableTableUpdateCompanionBuilder
    = JobWorkAllotmentsTableCompanion Function({
  Value<int> id,
  Value<int> jobWorkId,
  Value<double> weight,
  Value<DateTime> allotDate,
  Value<DateTime> createdAt,
});

final class $$JobWorkAllotmentsTableTableReferences extends BaseReferences<
    _$AppDatabase, $JobWorkAllotmentsTableTable, JobWorkAllotmentsTableData> {
  $$JobWorkAllotmentsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $KarigarJobWorkTableTable _jobWorkIdTable(_$AppDatabase db) =>
      db.karigarJobWorkTable.createAlias($_aliasNameGenerator(
          db.jobWorkAllotmentsTable.jobWorkId, db.karigarJobWorkTable.id));

  $$KarigarJobWorkTableTableProcessedTableManager get jobWorkId {
    final $_column = $_itemColumn<int>('job_work_id')!;

    final manager =
        $$KarigarJobWorkTableTableTableManager($_db, $_db.karigarJobWorkTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_jobWorkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$JobWorkAllotmentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $JobWorkAllotmentsTableTable> {
  $$JobWorkAllotmentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get allotDate => $composableBuilder(
      column: $table.allotDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$KarigarJobWorkTableTableFilterComposer get jobWorkId {
    final $$KarigarJobWorkTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.jobWorkId,
        referencedTable: $db.karigarJobWorkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarJobWorkTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarJobWorkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JobWorkAllotmentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $JobWorkAllotmentsTableTable> {
  $$JobWorkAllotmentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get allotDate => $composableBuilder(
      column: $table.allotDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$KarigarJobWorkTableTableOrderingComposer get jobWorkId {
    final $$KarigarJobWorkTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.jobWorkId,
            referencedTable: $db.karigarJobWorkTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$JobWorkAllotmentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobWorkAllotmentsTableTable> {
  $$JobWorkAllotmentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<DateTime> get allotDate =>
      $composableBuilder(column: $table.allotDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$KarigarJobWorkTableTableAnnotationComposer get jobWorkId {
    final $$KarigarJobWorkTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.jobWorkId,
            referencedTable: $db.karigarJobWorkTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$JobWorkAllotmentsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JobWorkAllotmentsTableTable,
    JobWorkAllotmentsTableData,
    $$JobWorkAllotmentsTableTableFilterComposer,
    $$JobWorkAllotmentsTableTableOrderingComposer,
    $$JobWorkAllotmentsTableTableAnnotationComposer,
    $$JobWorkAllotmentsTableTableCreateCompanionBuilder,
    $$JobWorkAllotmentsTableTableUpdateCompanionBuilder,
    (JobWorkAllotmentsTableData, $$JobWorkAllotmentsTableTableReferences),
    JobWorkAllotmentsTableData,
    PrefetchHooks Function({bool jobWorkId})> {
  $$JobWorkAllotmentsTableTableTableManager(
      _$AppDatabase db, $JobWorkAllotmentsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobWorkAllotmentsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$JobWorkAllotmentsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobWorkAllotmentsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> jobWorkId = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<DateTime> allotDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              JobWorkAllotmentsTableCompanion(
            id: id,
            jobWorkId: jobWorkId,
            weight: weight,
            allotDate: allotDate,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int jobWorkId,
            required double weight,
            required DateTime allotDate,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              JobWorkAllotmentsTableCompanion.insert(
            id: id,
            jobWorkId: jobWorkId,
            weight: weight,
            allotDate: allotDate,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$JobWorkAllotmentsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({jobWorkId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (jobWorkId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.jobWorkId,
                    referencedTable: $$JobWorkAllotmentsTableTableReferences
                        ._jobWorkIdTable(db),
                    referencedColumn: $$JobWorkAllotmentsTableTableReferences
                        ._jobWorkIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$JobWorkAllotmentsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $JobWorkAllotmentsTableTable,
        JobWorkAllotmentsTableData,
        $$JobWorkAllotmentsTableTableFilterComposer,
        $$JobWorkAllotmentsTableTableOrderingComposer,
        $$JobWorkAllotmentsTableTableAnnotationComposer,
        $$JobWorkAllotmentsTableTableCreateCompanionBuilder,
        $$JobWorkAllotmentsTableTableUpdateCompanionBuilder,
        (JobWorkAllotmentsTableData, $$JobWorkAllotmentsTableTableReferences),
        JobWorkAllotmentsTableData,
        PrefetchHooks Function({bool jobWorkId})>;
typedef $$JobWorkReceiptsTableTableCreateCompanionBuilder
    = JobWorkReceiptsTableCompanion Function({
  Value<int> id,
  required int jobWorkId,
  Value<double?> weightReceived,
  Value<double?> receiveValue,
  required double amountCredited,
  required DateTime receiveDate,
  Value<DateTime> createdAt,
});
typedef $$JobWorkReceiptsTableTableUpdateCompanionBuilder
    = JobWorkReceiptsTableCompanion Function({
  Value<int> id,
  Value<int> jobWorkId,
  Value<double?> weightReceived,
  Value<double?> receiveValue,
  Value<double> amountCredited,
  Value<DateTime> receiveDate,
  Value<DateTime> createdAt,
});

final class $$JobWorkReceiptsTableTableReferences extends BaseReferences<
    _$AppDatabase, $JobWorkReceiptsTableTable, JobWorkReceiptsTableData> {
  $$JobWorkReceiptsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $KarigarJobWorkTableTable _jobWorkIdTable(_$AppDatabase db) =>
      db.karigarJobWorkTable.createAlias($_aliasNameGenerator(
          db.jobWorkReceiptsTable.jobWorkId, db.karigarJobWorkTable.id));

  $$KarigarJobWorkTableTableProcessedTableManager get jobWorkId {
    final $_column = $_itemColumn<int>('job_work_id')!;

    final manager =
        $$KarigarJobWorkTableTableTableManager($_db, $_db.karigarJobWorkTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_jobWorkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$JobWorkReceiptLineItemsTableTable,
          List<JobWorkReceiptLineItemsTableData>>
      _jobWorkReceiptLineItemsTableRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.jobWorkReceiptLineItemsTable,
              aliasName: $_aliasNameGenerator(db.jobWorkReceiptsTable.id,
                  db.jobWorkReceiptLineItemsTable.receiptId));

  $$JobWorkReceiptLineItemsTableTableProcessedTableManager
      get jobWorkReceiptLineItemsTableRefs {
    final manager = $$JobWorkReceiptLineItemsTableTableTableManager(
            $_db, $_db.jobWorkReceiptLineItemsTable)
        .filter((f) => f.receiptId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_jobWorkReceiptLineItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$JobWorkReceiptsTableTableFilterComposer
    extends Composer<_$AppDatabase, $JobWorkReceiptsTableTable> {
  $$JobWorkReceiptsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weightReceived => $composableBuilder(
      column: $table.weightReceived,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get receiveValue => $composableBuilder(
      column: $table.receiveValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amountCredited => $composableBuilder(
      column: $table.amountCredited,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get receiveDate => $composableBuilder(
      column: $table.receiveDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$KarigarJobWorkTableTableFilterComposer get jobWorkId {
    final $$KarigarJobWorkTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.jobWorkId,
        referencedTable: $db.karigarJobWorkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarJobWorkTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarJobWorkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> jobWorkReceiptLineItemsTableRefs(
      Expression<bool> Function(
              $$JobWorkReceiptLineItemsTableTableFilterComposer f)
          f) {
    final $$JobWorkReceiptLineItemsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.jobWorkReceiptLineItemsTable,
            getReferencedColumn: (t) => t.receiptId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JobWorkReceiptLineItemsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.jobWorkReceiptLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$JobWorkReceiptsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $JobWorkReceiptsTableTable> {
  $$JobWorkReceiptsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weightReceived => $composableBuilder(
      column: $table.weightReceived,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get receiveValue => $composableBuilder(
      column: $table.receiveValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amountCredited => $composableBuilder(
      column: $table.amountCredited,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get receiveDate => $composableBuilder(
      column: $table.receiveDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$KarigarJobWorkTableTableOrderingComposer get jobWorkId {
    final $$KarigarJobWorkTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.jobWorkId,
            referencedTable: $db.karigarJobWorkTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$JobWorkReceiptsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobWorkReceiptsTableTable> {
  $$JobWorkReceiptsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get weightReceived => $composableBuilder(
      column: $table.weightReceived, builder: (column) => column);

  GeneratedColumn<double> get receiveValue => $composableBuilder(
      column: $table.receiveValue, builder: (column) => column);

  GeneratedColumn<double> get amountCredited => $composableBuilder(
      column: $table.amountCredited, builder: (column) => column);

  GeneratedColumn<DateTime> get receiveDate => $composableBuilder(
      column: $table.receiveDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$KarigarJobWorkTableTableAnnotationComposer get jobWorkId {
    final $$KarigarJobWorkTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.jobWorkId,
            referencedTable: $db.karigarJobWorkTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  Expression<T> jobWorkReceiptLineItemsTableRefs<T extends Object>(
      Expression<T> Function(
              $$JobWorkReceiptLineItemsTableTableAnnotationComposer a)
          f) {
    final $$JobWorkReceiptLineItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.jobWorkReceiptLineItemsTable,
            getReferencedColumn: (t) => t.receiptId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JobWorkReceiptLineItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.jobWorkReceiptLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$JobWorkReceiptsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JobWorkReceiptsTableTable,
    JobWorkReceiptsTableData,
    $$JobWorkReceiptsTableTableFilterComposer,
    $$JobWorkReceiptsTableTableOrderingComposer,
    $$JobWorkReceiptsTableTableAnnotationComposer,
    $$JobWorkReceiptsTableTableCreateCompanionBuilder,
    $$JobWorkReceiptsTableTableUpdateCompanionBuilder,
    (JobWorkReceiptsTableData, $$JobWorkReceiptsTableTableReferences),
    JobWorkReceiptsTableData,
    PrefetchHooks Function(
        {bool jobWorkId, bool jobWorkReceiptLineItemsTableRefs})> {
  $$JobWorkReceiptsTableTableTableManager(
      _$AppDatabase db, $JobWorkReceiptsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobWorkReceiptsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobWorkReceiptsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobWorkReceiptsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> jobWorkId = const Value.absent(),
            Value<double?> weightReceived = const Value.absent(),
            Value<double?> receiveValue = const Value.absent(),
            Value<double> amountCredited = const Value.absent(),
            Value<DateTime> receiveDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              JobWorkReceiptsTableCompanion(
            id: id,
            jobWorkId: jobWorkId,
            weightReceived: weightReceived,
            receiveValue: receiveValue,
            amountCredited: amountCredited,
            receiveDate: receiveDate,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int jobWorkId,
            Value<double?> weightReceived = const Value.absent(),
            Value<double?> receiveValue = const Value.absent(),
            required double amountCredited,
            required DateTime receiveDate,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              JobWorkReceiptsTableCompanion.insert(
            id: id,
            jobWorkId: jobWorkId,
            weightReceived: weightReceived,
            receiveValue: receiveValue,
            amountCredited: amountCredited,
            receiveDate: receiveDate,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$JobWorkReceiptsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {jobWorkId = false, jobWorkReceiptLineItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (jobWorkReceiptLineItemsTableRefs)
                  db.jobWorkReceiptLineItemsTable
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (jobWorkId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.jobWorkId,
                    referencedTable: $$JobWorkReceiptsTableTableReferences
                        ._jobWorkIdTable(db),
                    referencedColumn: $$JobWorkReceiptsTableTableReferences
                        ._jobWorkIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (jobWorkReceiptLineItemsTableRefs)
                    await $_getPrefetchedData<
                            JobWorkReceiptsTableData,
                            $JobWorkReceiptsTableTable,
                            JobWorkReceiptLineItemsTableData>(
                        currentTable: table,
                        referencedTable: $$JobWorkReceiptsTableTableReferences
                            ._jobWorkReceiptLineItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$JobWorkReceiptsTableTableReferences(db, table, p0)
                                .jobWorkReceiptLineItemsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.receiptId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$JobWorkReceiptsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $JobWorkReceiptsTableTable,
        JobWorkReceiptsTableData,
        $$JobWorkReceiptsTableTableFilterComposer,
        $$JobWorkReceiptsTableTableOrderingComposer,
        $$JobWorkReceiptsTableTableAnnotationComposer,
        $$JobWorkReceiptsTableTableCreateCompanionBuilder,
        $$JobWorkReceiptsTableTableUpdateCompanionBuilder,
        (JobWorkReceiptsTableData, $$JobWorkReceiptsTableTableReferences),
        JobWorkReceiptsTableData,
        PrefetchHooks Function(
            {bool jobWorkId, bool jobWorkReceiptLineItemsTableRefs})>;
typedef $$JobWorkReceiptLineItemsTableTableCreateCompanionBuilder
    = JobWorkReceiptLineItemsTableCompanion Function({
  Value<int> id,
  required int receiptId,
  required int jobWorkLineItemId,
  required double qtyReceivedNow,
  required double amount,
});
typedef $$JobWorkReceiptLineItemsTableTableUpdateCompanionBuilder
    = JobWorkReceiptLineItemsTableCompanion Function({
  Value<int> id,
  Value<int> receiptId,
  Value<int> jobWorkLineItemId,
  Value<double> qtyReceivedNow,
  Value<double> amount,
});

final class $$JobWorkReceiptLineItemsTableTableReferences
    extends BaseReferences<_$AppDatabase, $JobWorkReceiptLineItemsTableTable,
        JobWorkReceiptLineItemsTableData> {
  $$JobWorkReceiptLineItemsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $JobWorkReceiptsTableTable _receiptIdTable(_$AppDatabase db) =>
      db.jobWorkReceiptsTable.createAlias($_aliasNameGenerator(
          db.jobWorkReceiptLineItemsTable.receiptId,
          db.jobWorkReceiptsTable.id));

  $$JobWorkReceiptsTableTableProcessedTableManager get receiptId {
    final $_column = $_itemColumn<int>('receipt_id')!;

    final manager =
        $$JobWorkReceiptsTableTableTableManager($_db, $_db.jobWorkReceiptsTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_receiptIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $KarigarJobWorkLineItemsTableTable _jobWorkLineItemIdTable(
          _$AppDatabase db) =>
      db.karigarJobWorkLineItemsTable.createAlias($_aliasNameGenerator(
          db.jobWorkReceiptLineItemsTable.jobWorkLineItemId,
          db.karigarJobWorkLineItemsTable.id));

  $$KarigarJobWorkLineItemsTableTableProcessedTableManager
      get jobWorkLineItemId {
    final $_column = $_itemColumn<int>('job_work_line_item_id')!;

    final manager = $$KarigarJobWorkLineItemsTableTableTableManager(
            $_db, $_db.karigarJobWorkLineItemsTable)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_jobWorkLineItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$JobWorkReceiptLineItemsTableTableFilterComposer
    extends Composer<_$AppDatabase, $JobWorkReceiptLineItemsTableTable> {
  $$JobWorkReceiptLineItemsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get qtyReceivedNow => $composableBuilder(
      column: $table.qtyReceivedNow,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  $$JobWorkReceiptsTableTableFilterComposer get receiptId {
    final $$JobWorkReceiptsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.receiptId,
        referencedTable: $db.jobWorkReceiptsTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JobWorkReceiptsTableTableFilterComposer(
              $db: $db,
              $table: $db.jobWorkReceiptsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$KarigarJobWorkLineItemsTableTableFilterComposer get jobWorkLineItemId {
    final $$KarigarJobWorkLineItemsTableTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.jobWorkLineItemId,
            referencedTable: $db.karigarJobWorkLineItemsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkLineItemsTableTableFilterComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$JobWorkReceiptLineItemsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $JobWorkReceiptLineItemsTableTable> {
  $$JobWorkReceiptLineItemsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get qtyReceivedNow => $composableBuilder(
      column: $table.qtyReceivedNow,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  $$JobWorkReceiptsTableTableOrderingComposer get receiptId {
    final $$JobWorkReceiptsTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.receiptId,
            referencedTable: $db.jobWorkReceiptsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JobWorkReceiptsTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.jobWorkReceiptsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$KarigarJobWorkLineItemsTableTableOrderingComposer get jobWorkLineItemId {
    final $$KarigarJobWorkLineItemsTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.jobWorkLineItemId,
            referencedTable: $db.karigarJobWorkLineItemsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkLineItemsTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$JobWorkReceiptLineItemsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobWorkReceiptLineItemsTableTable> {
  $$JobWorkReceiptLineItemsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get qtyReceivedNow => $composableBuilder(
      column: $table.qtyReceivedNow, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$JobWorkReceiptsTableTableAnnotationComposer get receiptId {
    final $$JobWorkReceiptsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.receiptId,
            referencedTable: $db.jobWorkReceiptsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$JobWorkReceiptsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.jobWorkReceiptsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$KarigarJobWorkLineItemsTableTableAnnotationComposer get jobWorkLineItemId {
    final $$KarigarJobWorkLineItemsTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.jobWorkLineItemId,
            referencedTable: $db.karigarJobWorkLineItemsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkLineItemsTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkLineItemsTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$JobWorkReceiptLineItemsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JobWorkReceiptLineItemsTableTable,
    JobWorkReceiptLineItemsTableData,
    $$JobWorkReceiptLineItemsTableTableFilterComposer,
    $$JobWorkReceiptLineItemsTableTableOrderingComposer,
    $$JobWorkReceiptLineItemsTableTableAnnotationComposer,
    $$JobWorkReceiptLineItemsTableTableCreateCompanionBuilder,
    $$JobWorkReceiptLineItemsTableTableUpdateCompanionBuilder,
    (
      JobWorkReceiptLineItemsTableData,
      $$JobWorkReceiptLineItemsTableTableReferences
    ),
    JobWorkReceiptLineItemsTableData,
    PrefetchHooks Function({bool receiptId, bool jobWorkLineItemId})> {
  $$JobWorkReceiptLineItemsTableTableTableManager(
      _$AppDatabase db, $JobWorkReceiptLineItemsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobWorkReceiptLineItemsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$JobWorkReceiptLineItemsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobWorkReceiptLineItemsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> receiptId = const Value.absent(),
            Value<int> jobWorkLineItemId = const Value.absent(),
            Value<double> qtyReceivedNow = const Value.absent(),
            Value<double> amount = const Value.absent(),
          }) =>
              JobWorkReceiptLineItemsTableCompanion(
            id: id,
            receiptId: receiptId,
            jobWorkLineItemId: jobWorkLineItemId,
            qtyReceivedNow: qtyReceivedNow,
            amount: amount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int receiptId,
            required int jobWorkLineItemId,
            required double qtyReceivedNow,
            required double amount,
          }) =>
              JobWorkReceiptLineItemsTableCompanion.insert(
            id: id,
            receiptId: receiptId,
            jobWorkLineItemId: jobWorkLineItemId,
            qtyReceivedNow: qtyReceivedNow,
            amount: amount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$JobWorkReceiptLineItemsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {receiptId = false, jobWorkLineItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (receiptId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.receiptId,
                    referencedTable:
                        $$JobWorkReceiptLineItemsTableTableReferences
                            ._receiptIdTable(db),
                    referencedColumn:
                        $$JobWorkReceiptLineItemsTableTableReferences
                            ._receiptIdTable(db)
                            .id,
                  ) as T;
                }
                if (jobWorkLineItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.jobWorkLineItemId,
                    referencedTable:
                        $$JobWorkReceiptLineItemsTableTableReferences
                            ._jobWorkLineItemIdTable(db),
                    referencedColumn:
                        $$JobWorkReceiptLineItemsTableTableReferences
                            ._jobWorkLineItemIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$JobWorkReceiptLineItemsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $JobWorkReceiptLineItemsTableTable,
        JobWorkReceiptLineItemsTableData,
        $$JobWorkReceiptLineItemsTableTableFilterComposer,
        $$JobWorkReceiptLineItemsTableTableOrderingComposer,
        $$JobWorkReceiptLineItemsTableTableAnnotationComposer,
        $$JobWorkReceiptLineItemsTableTableCreateCompanionBuilder,
        $$JobWorkReceiptLineItemsTableTableUpdateCompanionBuilder,
        (
          JobWorkReceiptLineItemsTableData,
          $$JobWorkReceiptLineItemsTableTableReferences
        ),
        JobWorkReceiptLineItemsTableData,
        PrefetchHooks Function({bool receiptId, bool jobWorkLineItemId})>;
typedef $$JobWorkRemarksTableTableCreateCompanionBuilder
    = JobWorkRemarksTableCompanion Function({
  Value<int> id,
  required int jobWorkId,
  required String remark,
  required DateTime remarkDate,
  Value<DateTime> createdAt,
});
typedef $$JobWorkRemarksTableTableUpdateCompanionBuilder
    = JobWorkRemarksTableCompanion Function({
  Value<int> id,
  Value<int> jobWorkId,
  Value<String> remark,
  Value<DateTime> remarkDate,
  Value<DateTime> createdAt,
});

final class $$JobWorkRemarksTableTableReferences extends BaseReferences<
    _$AppDatabase, $JobWorkRemarksTableTable, JobWorkRemarksTableData> {
  $$JobWorkRemarksTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $KarigarJobWorkTableTable _jobWorkIdTable(_$AppDatabase db) =>
      db.karigarJobWorkTable.createAlias($_aliasNameGenerator(
          db.jobWorkRemarksTable.jobWorkId, db.karigarJobWorkTable.id));

  $$KarigarJobWorkTableTableProcessedTableManager get jobWorkId {
    final $_column = $_itemColumn<int>('job_work_id')!;

    final manager =
        $$KarigarJobWorkTableTableTableManager($_db, $_db.karigarJobWorkTable)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_jobWorkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$JobWorkRemarksTableTableFilterComposer
    extends Composer<_$AppDatabase, $JobWorkRemarksTableTable> {
  $$JobWorkRemarksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remark => $composableBuilder(
      column: $table.remark, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get remarkDate => $composableBuilder(
      column: $table.remarkDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$KarigarJobWorkTableTableFilterComposer get jobWorkId {
    final $$KarigarJobWorkTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.jobWorkId,
        referencedTable: $db.karigarJobWorkTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarJobWorkTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarJobWorkTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JobWorkRemarksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $JobWorkRemarksTableTable> {
  $$JobWorkRemarksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remark => $composableBuilder(
      column: $table.remark, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get remarkDate => $composableBuilder(
      column: $table.remarkDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$KarigarJobWorkTableTableOrderingComposer get jobWorkId {
    final $$KarigarJobWorkTableTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.jobWorkId,
            referencedTable: $db.karigarJobWorkTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkTableTableOrderingComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$JobWorkRemarksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobWorkRemarksTableTable> {
  $$JobWorkRemarksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<DateTime> get remarkDate => $composableBuilder(
      column: $table.remarkDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$KarigarJobWorkTableTableAnnotationComposer get jobWorkId {
    final $$KarigarJobWorkTableTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.jobWorkId,
            referencedTable: $db.karigarJobWorkTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$KarigarJobWorkTableTableAnnotationComposer(
                  $db: $db,
                  $table: $db.karigarJobWorkTable,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$JobWorkRemarksTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JobWorkRemarksTableTable,
    JobWorkRemarksTableData,
    $$JobWorkRemarksTableTableFilterComposer,
    $$JobWorkRemarksTableTableOrderingComposer,
    $$JobWorkRemarksTableTableAnnotationComposer,
    $$JobWorkRemarksTableTableCreateCompanionBuilder,
    $$JobWorkRemarksTableTableUpdateCompanionBuilder,
    (JobWorkRemarksTableData, $$JobWorkRemarksTableTableReferences),
    JobWorkRemarksTableData,
    PrefetchHooks Function({bool jobWorkId})> {
  $$JobWorkRemarksTableTableTableManager(
      _$AppDatabase db, $JobWorkRemarksTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobWorkRemarksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobWorkRemarksTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobWorkRemarksTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> jobWorkId = const Value.absent(),
            Value<String> remark = const Value.absent(),
            Value<DateTime> remarkDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              JobWorkRemarksTableCompanion(
            id: id,
            jobWorkId: jobWorkId,
            remark: remark,
            remarkDate: remarkDate,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int jobWorkId,
            required String remark,
            required DateTime remarkDate,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              JobWorkRemarksTableCompanion.insert(
            id: id,
            jobWorkId: jobWorkId,
            remark: remark,
            remarkDate: remarkDate,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$JobWorkRemarksTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({jobWorkId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (jobWorkId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.jobWorkId,
                    referencedTable: $$JobWorkRemarksTableTableReferences
                        ._jobWorkIdTable(db),
                    referencedColumn: $$JobWorkRemarksTableTableReferences
                        ._jobWorkIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$JobWorkRemarksTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JobWorkRemarksTableTable,
    JobWorkRemarksTableData,
    $$JobWorkRemarksTableTableFilterComposer,
    $$JobWorkRemarksTableTableOrderingComposer,
    $$JobWorkRemarksTableTableAnnotationComposer,
    $$JobWorkRemarksTableTableCreateCompanionBuilder,
    $$JobWorkRemarksTableTableUpdateCompanionBuilder,
    (JobWorkRemarksTableData, $$JobWorkRemarksTableTableReferences),
    JobWorkRemarksTableData,
    PrefetchHooks Function({bool jobWorkId})>;
typedef $$KarigarPaymentsTableTableCreateCompanionBuilder
    = KarigarPaymentsTableCompanion Function({
  Value<int> id,
  required int karigarId,
  required DateTime paymentDate,
  Value<double> amountDr,
  Value<double> amountCr,
  Value<String?> note,
  Value<DateTime> createdAt,
});
typedef $$KarigarPaymentsTableTableUpdateCompanionBuilder
    = KarigarPaymentsTableCompanion Function({
  Value<int> id,
  Value<int> karigarId,
  Value<DateTime> paymentDate,
  Value<double> amountDr,
  Value<double> amountCr,
  Value<String?> note,
  Value<DateTime> createdAt,
});

final class $$KarigarPaymentsTableTableReferences extends BaseReferences<
    _$AppDatabase, $KarigarPaymentsTableTable, KarigarPaymentsTableData> {
  $$KarigarPaymentsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $KarigarsTableTable _karigarIdTable(_$AppDatabase db) =>
      db.karigarsTable.createAlias($_aliasNameGenerator(
          db.karigarPaymentsTable.karigarId, db.karigarsTable.karigarId));

  $$KarigarsTableTableProcessedTableManager get karigarId {
    final $_column = $_itemColumn<int>('karigar_id')!;

    final manager = $$KarigarsTableTableTableManager($_db, $_db.karigarsTable)
        .filter((f) => f.karigarId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_karigarIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$KarigarPaymentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $KarigarPaymentsTableTable> {
  $$KarigarPaymentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amountDr => $composableBuilder(
      column: $table.amountDr, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amountCr => $composableBuilder(
      column: $table.amountCr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$KarigarsTableTableFilterComposer get karigarId {
    final $$KarigarsTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.karigarId,
        referencedTable: $db.karigarsTable,
        getReferencedColumn: (t) => t.karigarId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarsTableTableFilterComposer(
              $db: $db,
              $table: $db.karigarsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$KarigarPaymentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $KarigarPaymentsTableTable> {
  $$KarigarPaymentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amountDr => $composableBuilder(
      column: $table.amountDr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amountCr => $composableBuilder(
      column: $table.amountCr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$KarigarsTableTableOrderingComposer get karigarId {
    final $$KarigarsTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.karigarId,
        referencedTable: $db.karigarsTable,
        getReferencedColumn: (t) => t.karigarId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarsTableTableOrderingComposer(
              $db: $db,
              $table: $db.karigarsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$KarigarPaymentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $KarigarPaymentsTableTable> {
  $$KarigarPaymentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  GeneratedColumn<double> get amountDr =>
      $composableBuilder(column: $table.amountDr, builder: (column) => column);

  GeneratedColumn<double> get amountCr =>
      $composableBuilder(column: $table.amountCr, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$KarigarsTableTableAnnotationComposer get karigarId {
    final $$KarigarsTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.karigarId,
        referencedTable: $db.karigarsTable,
        getReferencedColumn: (t) => t.karigarId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$KarigarsTableTableAnnotationComposer(
              $db: $db,
              $table: $db.karigarsTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$KarigarPaymentsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KarigarPaymentsTableTable,
    KarigarPaymentsTableData,
    $$KarigarPaymentsTableTableFilterComposer,
    $$KarigarPaymentsTableTableOrderingComposer,
    $$KarigarPaymentsTableTableAnnotationComposer,
    $$KarigarPaymentsTableTableCreateCompanionBuilder,
    $$KarigarPaymentsTableTableUpdateCompanionBuilder,
    (KarigarPaymentsTableData, $$KarigarPaymentsTableTableReferences),
    KarigarPaymentsTableData,
    PrefetchHooks Function({bool karigarId})> {
  $$KarigarPaymentsTableTableTableManager(
      _$AppDatabase db, $KarigarPaymentsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KarigarPaymentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KarigarPaymentsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KarigarPaymentsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> karigarId = const Value.absent(),
            Value<DateTime> paymentDate = const Value.absent(),
            Value<double> amountDr = const Value.absent(),
            Value<double> amountCr = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              KarigarPaymentsTableCompanion(
            id: id,
            karigarId: karigarId,
            paymentDate: paymentDate,
            amountDr: amountDr,
            amountCr: amountCr,
            note: note,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int karigarId,
            required DateTime paymentDate,
            Value<double> amountDr = const Value.absent(),
            Value<double> amountCr = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              KarigarPaymentsTableCompanion.insert(
            id: id,
            karigarId: karigarId,
            paymentDate: paymentDate,
            amountDr: amountDr,
            amountCr: amountCr,
            note: note,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$KarigarPaymentsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({karigarId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (karigarId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.karigarId,
                    referencedTable: $$KarigarPaymentsTableTableReferences
                        ._karigarIdTable(db),
                    referencedColumn: $$KarigarPaymentsTableTableReferences
                        ._karigarIdTable(db)
                        .karigarId,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$KarigarPaymentsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $KarigarPaymentsTableTable,
        KarigarPaymentsTableData,
        $$KarigarPaymentsTableTableFilterComposer,
        $$KarigarPaymentsTableTableOrderingComposer,
        $$KarigarPaymentsTableTableAnnotationComposer,
        $$KarigarPaymentsTableTableCreateCompanionBuilder,
        $$KarigarPaymentsTableTableUpdateCompanionBuilder,
        (KarigarPaymentsTableData, $$KarigarPaymentsTableTableReferences),
        KarigarPaymentsTableData,
        PrefetchHooks Function({bool karigarId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db, _db.usersTable);
  $$LedgerTableTableTableManager get ledgerTable =>
      $$LedgerTableTableTableManager(_db, _db.ledgerTable);
  $$JournalEntriesTableTableTableManager get journalEntriesTable =>
      $$JournalEntriesTableTableTableManager(_db, _db.journalEntriesTable);
  $$JournalEntryDetailsTableTableTableManager get journalEntryDetailsTable =>
      $$JournalEntryDetailsTableTableTableManager(
          _db, _db.journalEntryDetailsTable);
  $$DailyCashBalanceTableTableTableManager get dailyCashBalanceTable =>
      $$DailyCashBalanceTableTableTableManager(_db, _db.dailyCashBalanceTable);
  $$TradersTableTableTableManager get tradersTable =>
      $$TradersTableTableTableManager(_db, _db.tradersTable);
  $$ProductsTableTableTableManager get productsTable =>
      $$ProductsTableTableTableManager(_db, _db.productsTable);
  $$PartyRatesTableTableTableManager get partyRatesTable =>
      $$PartyRatesTableTableTableManager(_db, _db.partyRatesTable);
  $$SalesTableTableTableManager get salesTable =>
      $$SalesTableTableTableManager(_db, _db.salesTable);
  $$SalesLineItemsTableTableTableManager get salesLineItemsTable =>
      $$SalesLineItemsTableTableTableManager(_db, _db.salesLineItemsTable);
  $$ProcurementTableTableTableManager get procurementTable =>
      $$ProcurementTableTableTableManager(_db, _db.procurementTable);
  $$ProcurementLineItemsTableTableTableManager get procurementLineItemsTable =>
      $$ProcurementLineItemsTableTableTableManager(
          _db, _db.procurementLineItemsTable);
  $$EmployeesTableTableTableManager get employeesTable =>
      $$EmployeesTableTableTableManager(_db, _db.employeesTable);
  $$AttendanceTableTableTableManager get attendanceTable =>
      $$AttendanceTableTableTableManager(_db, _db.attendanceTable);
  $$EmployeePaymentsTableTableTableManager get employeePaymentsTable =>
      $$EmployeePaymentsTableTableTableManager(_db, _db.employeePaymentsTable);
  $$WorkTypesTableTableTableManager get workTypesTable =>
      $$WorkTypesTableTableTableManager(_db, _db.workTypesTable);
  $$KarigarProductsTableTableTableManager get karigarProductsTable =>
      $$KarigarProductsTableTableTableManager(_db, _db.karigarProductsTable);
  $$KarigarsTableTableTableManager get karigarsTable =>
      $$KarigarsTableTableTableManager(_db, _db.karigarsTable);
  $$KarigarProductRatesTableTableTableManager get karigarProductRatesTable =>
      $$KarigarProductRatesTableTableTableManager(
          _db, _db.karigarProductRatesTable);
  $$KarigarJobWorkTableTableTableManager get karigarJobWorkTable =>
      $$KarigarJobWorkTableTableTableManager(_db, _db.karigarJobWorkTable);
  $$KarigarJobWorkLineItemsTableTableTableManager
      get karigarJobWorkLineItemsTable =>
          $$KarigarJobWorkLineItemsTableTableTableManager(
              _db, _db.karigarJobWorkLineItemsTable);
  $$JobWorkAllotmentsTableTableTableManager get jobWorkAllotmentsTable =>
      $$JobWorkAllotmentsTableTableTableManager(
          _db, _db.jobWorkAllotmentsTable);
  $$JobWorkReceiptsTableTableTableManager get jobWorkReceiptsTable =>
      $$JobWorkReceiptsTableTableTableManager(_db, _db.jobWorkReceiptsTable);
  $$JobWorkReceiptLineItemsTableTableTableManager
      get jobWorkReceiptLineItemsTable =>
          $$JobWorkReceiptLineItemsTableTableTableManager(
              _db, _db.jobWorkReceiptLineItemsTable);
  $$JobWorkRemarksTableTableTableManager get jobWorkRemarksTable =>
      $$JobWorkRemarksTableTableTableManager(_db, _db.jobWorkRemarksTable);
  $$KarigarPaymentsTableTableTableManager get karigarPaymentsTable =>
      $$KarigarPaymentsTableTableTableManager(_db, _db.karigarPaymentsTable);
}
