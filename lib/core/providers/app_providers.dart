import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../data/db/app_database.dart';
import '../../features/auth/data/auth_repository.dart';
import '../../features/auth/data/session_store.dart';
import '../../features/karigar/data/karigar_repository.dart';
import '../../features/ledger/data/ledger_repository.dart';
import '../../features/payroll/data/payroll_repository.dart';
import '../../features/trade/data/trade_repository.dart';

/// Singleton local database — opened once for the app's lifetime.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final sessionStoreProvider = Provider<SessionStore>((ref) {
  return SessionStore(ref.watch(secureStorageProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(appDatabaseProvider));
});

final ledgerRepositoryProvider = Provider<LedgerRepository>((ref) {
  return LedgerRepository(ref.watch(appDatabaseProvider));
});

final tradeRepositoryProvider = Provider<TradeRepository>((ref) {
  return TradeRepository(ref.watch(appDatabaseProvider), ref.watch(ledgerRepositoryProvider));
});

final payrollRepositoryProvider = Provider<PayrollRepository>((ref) {
  return PayrollRepository(ref.watch(appDatabaseProvider), ref.watch(ledgerRepositoryProvider));
});

final karigarRepositoryProvider = Provider<KarigarRepository>((ref) {
  return KarigarRepository(ref.watch(appDatabaseProvider));
});
