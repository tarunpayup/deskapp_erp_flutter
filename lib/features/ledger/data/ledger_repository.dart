import 'package:drift/drift.dart';

import '../../../core/constants/account_types.dart';
import '../../../data/db/app_database.dart';
import '../domain/ledger_models.dart';

/// Local-first repository for the Ledger/Accounts module (documents/map.md
/// Module 4): chart of accounts, cash/bank voucher posting, journal,
/// opening balances, trial balance, and day book. This is the seam where a
/// real backend API replaces direct table access later — UI code only ever
/// talks to this class, never to AppDatabase directly.
///
/// The double-entry posting logic here intentionally FIXES several
/// correctness gaps the legacy PHP had (documents/map.md Module 4), rather
/// than reproducing them:
///  - `current_balance` is always updated in the same transaction as the
///    journal lines that justify it (never a separate, droppable step).
///  - Running-balance statements use the correct chronological-ascending-
///    then-reverse algorithm everywhere (legacy rule #4 bug, fixed).
///  - Opening-balance edits are blocked once a ledger has journal history
///    (legacy rule #5 gap, fixed) — use an adjustment entry instead.
///  - Ledger deletion is blocked once a ledger has journal history (legacy
///    rule preserved, not a fix — this one was already correct).
class LedgerRepository {
  LedgerRepository(this._db);

  final AppDatabase _db;

  // ---------------------------------------------------------------------
  // Chart of accounts CRUD
  // ---------------------------------------------------------------------

  Stream<List<LedgerTableData>> watchLedgers({
    String? status,
    String? accountType,
    String? search,
  }) {
    final query = _db.select(_db.ledgerTable)
      ..orderBy([(t) => OrderingTerm.asc(t.accountName)]);
    if (status != null) {
      query.where((t) => t.status.equals(status));
    }
    if (accountType != null) {
      query.where((t) => t.accountType.equals(accountType));
    }
    if (search != null && search.trim().isNotEmpty) {
      final like = '%${search.trim()}%';
      query.where(
        (t) => t.accountName.like(like) | t.accountCode.like(like),
      );
    }
    return query.watch();
  }

  Future<LedgerTableData?> getLedger(int lid) {
    return (_db.select(
      _db.ledgerTable,
    )..where((t) => t.lid.equals(lid))).getSingleOrNull();
  }

  /// Autocomplete source for the Cash/Bank "party" picker — legacy
  /// `search_party` (function.php), restricted to the account types that
  /// can plausibly be a transaction counterparty.
  Future<List<LedgerTableData>> searchParties(
    String query, {
    List<String> types = const ['Sundry Debtor', 'Sundry Creditor', 'Bank'],
  }) {
    final like = '%$query%';
    return (_db.select(_db.ledgerTable)
          ..where(
            (t) => t.accountName.like(like) & t.accountType.isIn(types),
          )
          ..orderBy([(t) => OrderingTerm.asc(t.accountName)])
          ..limit(20))
        .get();
  }

  Future<bool> isAccountCodeTaken(String code, {int? excludeLid}) async {
    if (code.trim().isEmpty) return false;
    final query = _db.select(_db.ledgerTable)
      ..where((t) => t.accountCode.equals(code.trim()));
    if (excludeLid != null) {
      query.where((t) => t.lid.equals(excludeLid).not());
    }
    final row = await query.getSingleOrNull();
    return row != null;
  }

  Future<int> addLedger({
    required String accountType,
    required String accountName,
    required String accountCode,
    required double openingBalance,
    required DrCr openingDc,
    String? other,
    String? description,
  }) async {
    if (await isAccountCodeTaken(accountCode)) {
      throw LedgerRepositoryException('Account code "$accountCode" already exists');
    }
    final signedOpening =
        openingDc == DrCr.credit ? -openingBalance.abs() : openingBalance.abs();
    return _db.into(_db.ledgerTable).insert(
      LedgerTableCompanion.insert(
        accountType: accountType,
        accountName: accountName,
        accountCode: Value(accountCode),
        openingBalance: Value(signedOpening),
        currentBalance: Value(signedOpening),
        dc: Value(openingDc.code),
        dcCurrent: Value(DrCr.fromSign(signedOpening).code),
        other: Value(other),
        description: Value(description),
      ),
    );
  }

  /// Updates a ledger's static fields. Opening balance can only change if
  /// this ledger has no journal history yet (see class doc — fixes a real
  /// accounting-integrity gap from the legacy app rather than reproducing
  /// it); otherwise throws, directing the caller toward an adjustment entry.
  Future<void> updateLedger({
    required int lid,
    required String accountType,
    required String accountName,
    required String accountCode,
    required double openingBalance,
    required DrCr openingDc,
    String? other,
    String? description,
  }) async {
    if (await isAccountCodeTaken(accountCode, excludeLid: lid)) {
      throw LedgerRepositoryException('Account code "$accountCode" already exists');
    }
    final current = await getLedger(lid);
    if (current == null) {
      throw LedgerRepositoryException('Ledger not found');
    }
    final hasHistory = await hasJournalHistory(lid);
    final signedOpening =
        openingDc == DrCr.credit ? -openingBalance.abs() : openingBalance.abs();

    if (hasHistory && signedOpening != current.openingBalance) {
      throw LedgerRepositoryException(
        'Cannot change the opening balance once transactions exist for this '
        'account — post an adjustment entry instead.',
      );
    }

    await (_db.update(_db.ledgerTable)..where((t) => t.lid.equals(lid))).write(
      LedgerTableCompanion(
        accountType: Value(accountType),
        accountName: Value(accountName),
        accountCode: Value(accountCode),
        other: Value(other),
        description: Value(description),
        // Only actually changes when there's no history (guarded above).
        openingBalance: Value(signedOpening),
        dc: Value(openingDc.code),
        // If there's no history yet, current_balance == opening_balance.
        currentBalance: hasHistory
            ? Value(current.currentBalance)
            : Value(signedOpening),
        dcCurrent: hasHistory
            ? Value(current.dcCurrent)
            : Value(DrCr.fromSign(signedOpening).code),
      ),
    );
  }

  Future<void> toggleStatus(int lid) async {
    final row = await getLedger(lid);
    if (row == null) return;
    final next = row.status == LedgerStatus.active.value
        ? LedgerStatus.notActive.value
        : LedgerStatus.active.value;
    await (_db.update(
      _db.ledgerTable,
    )..where((t) => t.lid.equals(lid))).write(LedgerTableCompanion(status: Value(next)));
  }

  /// Deletes a ledger — blocked if it has any journal history (legacy
  /// o-t-ledger-manage.php guard, preserved exactly: deactivate instead).
  Future<void> deleteLedger(int lid) async {
    if (await hasJournalHistory(lid)) {
      throw LedgerRepositoryException(
        'This account has transaction history and cannot be deleted — '
        'mark it Not Active instead.',
      );
    }
    await (_db.delete(_db.ledgerTable)..where((t) => t.lid.equals(lid))).go();
  }

  /// True if this ledger has ever been posted to — used both to guard
  /// mutations here and by the UI (e.g. Opening Balance grid) to show which
  /// rows are locked before the user even tries to save.
  Future<bool> hasJournalHistory(int lid) async {
    final row = await (_db.selectOnly(_db.journalEntryDetailsTable)
          ..addColumns([_db.journalEntryDetailsTable.detailId])
          ..where(_db.journalEntryDetailsTable.accountId.equals(lid))
          ..limit(1))
        .getSingleOrNull();
    return row != null;
  }

  // ---------------------------------------------------------------------
  // Opening balance (bulk screen)
  // ---------------------------------------------------------------------

  /// Bulk-updates opening balances. Rows for ledgers that already have
  /// journal history are skipped (not silently overwritten) and reported
  /// back so the UI can tell the user which ones need an adjustment entry
  /// instead — see class doc.
  Future<List<int>> updateOpeningBalances(
    Map<int, ({double amount, DrCr dc})> updates,
  ) async {
    final skipped = <int>[];
    await _db.transaction(() async {
      for (final entry in updates.entries) {
        final lid = entry.key;
        if (await hasJournalHistory(lid)) {
          skipped.add(lid);
          continue;
        }
        final signed = entry.value.dc == DrCr.credit
            ? -entry.value.amount.abs()
            : entry.value.amount.abs();
        await (_db.update(_db.ledgerTable)..where((t) => t.lid.equals(lid))).write(
          LedgerTableCompanion(
            openingBalance: Value(signed),
            currentBalance: Value(signed),
            dc: Value(entry.value.dc.code),
            dcCurrent: Value(DrCr.fromSign(signed).code),
          ),
        );
      }
    });
    return skipped;
  }

  // ---------------------------------------------------------------------
  // Double-entry posting core
  // ---------------------------------------------------------------------

  /// Atomically posts a balanced journal entry: one header row, N detail
  /// lines, and the corresponding `current_balance` deltas — all in one
  /// drift transaction (Module 4 rule #2: these must never be split).
  /// `lines` maps ledger id -> signed delta (positive=Dr, negative=Cr); the
  /// sum of all deltas must be zero (a balanced entry) or this throws.
  Future<int> _postJournalEntry({
    required String voucherType,
    required String voucherNo,
    required DateTime date,
    required String narration,
    required Map<int, double> lines,
  }) async {
    final total = lines.values.fold<double>(0, (a, b) => a + b);
    if (total.abs() > 0.004) {
      throw LedgerRepositoryException(
        'Internal error: unbalanced journal entry (Dr/Cr mismatch)',
      );
    }

    return _db.transaction(() async {
      final entryId = await _db.into(_db.journalEntriesTable).insert(
        JournalEntriesTableCompanion.insert(
          voucherType: voucherType,
          voucherNo: voucherNo,
          entryDate: date,
          narration: Value(narration),
        ),
      );

      for (final line in lines.entries) {
        await _db.into(_db.journalEntryDetailsTable).insert(
          JournalEntryDetailsTableCompanion.insert(
            entryId: entryId,
            accountId: line.key,
            debit: Value(line.value > 0 ? line.value : 0),
            credit: Value(line.value < 0 ? -line.value : 0),
          ),
        );

        final ledger = await getLedger(line.key);
        if (ledger == null) {
          throw LedgerRepositoryException('Ledger account ${line.key} not found');
        }
        final newBalance = ledger.currentBalance + line.value;
        await (_db.update(
          _db.ledgerTable,
        )..where((t) => t.lid.equals(line.key))).write(
          LedgerTableCompanion(
            currentBalance: Value(newBalance),
            dcCurrent: Value(DrCr.fromSign(newBalance).code),
          ),
        );
      }

      return entryId;
    });
  }

  /// Public entry point for other modules (e.g. TradeRepository's Sales /
  /// Procurement posting) that need the same atomic balanced-entry core
  /// without duplicating it — see class doc on why this must stay a single
  /// canonical implementation.
  Future<int> postJournalEntry({
    required String voucherType,
    required String voucherNo,
    required DateTime date,
    required String narration,
    required Map<int, double> lines,
  }) => _postJournalEntry(
    voucherType: voucherType,
    voucherNo: voucherNo,
    date: date,
    narration: narration,
    lines: lines,
  );

  /// Looks up a ledger by account name, auto-creating it under
  /// [accountType] if it doesn't exist yet — same auto-create pattern as
  /// [_ensureWriteOffAccount], generalized for Module 5's Sales/Purchase/
  /// GST system accounts (see account_types.dart SystemAccounts).
  Future<int> ensureSystemAccount(String accountName, String accountType) async {
    final existing = await (_db.select(
      _db.ledgerTable,
    )..where((t) => t.accountName.equals(accountName))).getSingleOrNull();
    if (existing != null) return existing.lid;

    return _db.into(_db.ledgerTable).insert(
      LedgerTableCompanion.insert(
        accountType: accountType,
        accountName: accountName,
        description: const Value('Auto-created system account'),
      ),
    );
  }

  String generateVoucherNo() => _generateVoucherNo();

  String _generateVoucherNo() =>
      DateTime.now().millisecondsSinceEpoch.toString();

  Future<int> _ensureWriteOffAccount() async {
    final existing = await (_db.select(
      _db.ledgerTable,
    )..where((t) => t.accountCode.equals(SystemAccounts.writeOffCode))).getSingleOrNull();
    if (existing != null) return existing.lid;

    return _db.into(_db.ledgerTable).insert(
      LedgerTableCompanion.insert(
        accountType: 'Indirect Expense',
        accountName: SystemAccounts.writeOff,
        accountCode: const Value(SystemAccounts.writeOffCode),
        description: const Value('Auto-created write off account'),
      ),
    );
  }

  Future<int> _requireSystemAccount(String accountName) async {
    final row = await (_db.select(
      _db.ledgerTable,
    )..where((t) => t.accountName.equals(accountName))).getSingleOrNull();
    if (row == null) {
      throw LedgerRepositoryException(
        'Required ledger account "$accountName" is not set up yet',
      );
    }
    return row.lid;
  }

  // ---------------------------------------------------------------------
  // Cash voucher — legacy `cash-transaction` (function.php), Module 4
  // rule #3.
  // ---------------------------------------------------------------------

  Future<void> postCashTransaction({
    required CashDirection direction,
    required int partyLedgerId,
    required DateTime date,
    required double amount,
    double writeOffAmount = 0,
    required String narration,
  }) async {
    if (amount <= 0) {
      throw LedgerRepositoryException('Amount must be greater than zero');
    }
    final cashLid = await _requireSystemAccount(SystemAccounts.cash);
    final writeOffLid = writeOffAmount > 0 ? await _ensureWriteOffAccount() : null;

    final lines = <int, double>{};
    if (direction == CashDirection.receive) {
      lines[cashLid] = (lines[cashLid] ?? 0) + amount;
      if (writeOffLid != null) {
        lines[writeOffLid] = (lines[writeOffLid] ?? 0) + writeOffAmount;
      }
      lines[partyLedgerId] =
          (lines[partyLedgerId] ?? 0) - (amount + writeOffAmount);
    } else {
      lines[partyLedgerId] =
          (lines[partyLedgerId] ?? 0) + (amount + writeOffAmount);
      lines[cashLid] = (lines[cashLid] ?? 0) - amount;
      if (writeOffLid != null) {
        lines[writeOffLid] = (lines[writeOffLid] ?? 0) - writeOffAmount;
      }
    }

    await _postJournalEntry(
      voucherType: 'CASH',
      voucherNo: _generateVoucherNo(),
      date: date,
      narration: narration,
      lines: lines,
    );
  }

  // ---------------------------------------------------------------------
  // Bank voucher — legacy `bank-transaction` (function.php), Module 4
  // rule #3.
  // ---------------------------------------------------------------------

  Future<void> postBankTransaction({
    required BankDirection direction,
    required int bankLedgerId,
    required int partyLedgerId,
    required DateTime date,
    required double amount,
    required String bankType,
    required String utrNo,
    required String narration,
  }) async {
    if (amount <= 0) {
      throw LedgerRepositoryException('Amount must be greater than zero');
    }
    final fullNarration = '$narration (${bankType.toUpperCase()} • UTR: $utrNo)';

    final lines = direction == BankDirection.deposit
        ? {bankLedgerId: amount, partyLedgerId: -amount}
        : {partyLedgerId: amount, bankLedgerId: -amount};

    await _postJournalEntry(
      voucherType: 'BANK',
      voucherNo: _generateVoucherNo(),
      date: date,
      narration: fullNarration,
      lines: lines,
    );
  }

  // ---------------------------------------------------------------------
  // Journal listing — legacy o-t-journal.php
  // ---------------------------------------------------------------------

  Stream<List<JournalEntriesTableData>> watchJournalEntries() {
    return (_db.select(_db.journalEntriesTable)
          ..orderBy([(t) => OrderingTerm.desc(t.entryDate)]))
        .watch();
  }

  Future<List<({JournalEntryDetailsTableData detail, String accountName})>>
  getEntryDetails(int entryId) async {
    final query = _db.select(_db.journalEntryDetailsTable).join([
      innerJoin(
        _db.ledgerTable,
        _db.ledgerTable.lid.equalsExp(_db.journalEntryDetailsTable.accountId),
      ),
    ])..where(_db.journalEntryDetailsTable.entryId.equals(entryId));

    final rows = await query.get();
    return rows.map((row) {
      return (
        detail: row.readTable(_db.journalEntryDetailsTable),
        accountName: row.readTable(_db.ledgerTable).accountName,
      );
    }).toList();
  }

  /// Flat transaction listing across every account — legacy "Transaction
  /// Report" nav item (documents/map.md Executive Summary). Filterable by
  /// date range and account type; unlike the per-account statement above,
  /// this has no running balance (it spans many accounts at once).
  Future<List<({JournalEntryDetailsTableData detail, JournalEntriesTableData entry, LedgerTableData account})>>
  getTransactionReport({DateTime? from, DateTime? to, String? accountType}) async {
    final query = _db.select(_db.journalEntryDetailsTable).join([
      innerJoin(
        _db.journalEntriesTable,
        _db.journalEntriesTable.entryId.equalsExp(_db.journalEntryDetailsTable.entryId),
      ),
      innerJoin(
        _db.ledgerTable,
        _db.ledgerTable.lid.equalsExp(_db.journalEntryDetailsTable.accountId),
      ),
    ]);
    if (from != null) {
      query.where(_db.journalEntriesTable.entryDate.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where(_db.journalEntriesTable.entryDate.isSmallerOrEqualValue(to));
    }
    if (accountType != null) {
      query.where(_db.ledgerTable.accountType.equals(accountType));
    }
    query.orderBy([OrderingTerm.desc(_db.journalEntriesTable.entryDate)]);

    final rows = await query.get();
    return rows
        .map(
          (r) => (
            detail: r.readTable(_db.journalEntryDetailsTable),
            entry: r.readTable(_db.journalEntriesTable),
            account: r.readTable(_db.ledgerTable),
          ),
        )
        .toList();
  }

  // ---------------------------------------------------------------------
  // Ledger statement / bank entries — correct running-balance algorithm
  // (Module 4 rule #4: compute ascending, then reverse for display).
  // ---------------------------------------------------------------------

  Future<List<StatementLine>> getLedgerStatement(
    int lid, {
    DateTime? from,
    DateTime? to,
  }) async {
    final ledger = await getLedger(lid);
    if (ledger == null) return [];

    final query = _db.select(_db.journalEntryDetailsTable).join([
      innerJoin(
        _db.journalEntriesTable,
        _db.journalEntriesTable.entryId.equalsExp(
          _db.journalEntryDetailsTable.entryId,
        ),
      ),
    ])..where(_db.journalEntryDetailsTable.accountId.equals(lid));

    if (from != null) {
      query.where(_db.journalEntriesTable.entryDate.isBiggerOrEqualValue(from));
    }
    if (to != null) {
      query.where(_db.journalEntriesTable.entryDate.isSmallerOrEqualValue(to));
    }
    query.orderBy([
      OrderingTerm.asc(_db.journalEntriesTable.entryDate),
      OrderingTerm.asc(_db.journalEntryDetailsTable.detailId),
    ]);

    final rows = await query.get();

    // Ascending accumulation starting from opening balance (correct
    // pattern — see class doc).
    var running = ledger.openingBalance;
    final ascending = <StatementLine>[];
    for (final row in rows) {
      final detail = row.readTable(_db.journalEntryDetailsTable);
      final header = row.readTable(_db.journalEntriesTable);
      running += detail.debit - detail.credit;
      ascending.add(
        StatementLine(
          entryId: header.entryId,
          voucherType: header.voucherType,
          voucherNo: header.voucherNo,
          date: header.entryDate,
          narration: header.narration,
          debit: detail.debit,
          credit: detail.credit,
          runningBalance: running,
          otherAccountName: null,
        ),
      );
    }
    return ascending.reversed.toList();
  }

  // ---------------------------------------------------------------------
  // Trial balance — legacy trial_balance.php (Module 4 rule #6: sums
  // current_balance directly, no FY filtering — the legacy FY label was
  // cosmetic-only and is simply not reproduced here rather than shipped
  // as a misleading no-op).
  // ---------------------------------------------------------------------

  Future<List<TrialBalanceGroup>> getTrialBalance() async {
    final rows = await _db.select(_db.ledgerTable).get();
    final byType = <String, List<LedgerTableData>>{};
    for (final row in rows) {
      byType.putIfAbsent(row.accountType, () => []).add(row);
    }
    final groups = byType.entries.map((entry) {
      return TrialBalanceGroup(
        accountType: entry.key,
        rows: entry.value
            .map(
              (r) => TrialBalanceRow(
                lid: r.lid,
                accountName: r.accountName,
                balance: r.currentBalance,
              ),
            )
            .toList(),
      );
    }).toList();
    groups.sort((a, b) => a.accountType.compareTo(b.accountType));
    return groups;
  }

  // ---------------------------------------------------------------------
  // Day book — legacy daybook.php/daybook_fetch.php. Scoped to CASH-
  // voucher journal entries only for now (Sales/Procurement/Karigar/
  // Payroll modules don't exist yet to contribute their entries — see
  // documents/map.md Module 4 rule #7, which also flags that the legacy
  // version over-counted non-cash sales/procurement; this version doesn't
  // repeat that until those modules are built with proper payment-mode
  // filtering).
  // ---------------------------------------------------------------------

  Future<({List<StatementLine> lines, double opening, double closing})>
  getDaybook(DateTime date) async {
    final cashLid = await _requireSystemAccount(SystemAccounts.cash);
    final dayStart = DateTime(date.year, date.month, date.day);
    final dayEnd = dayStart.add(const Duration(days: 1));

    final lines = await getLedgerStatement(cashLid, from: dayStart, to: dayEnd);
    final todays = lines
        .where((l) => l.date.isBefore(dayEnd) && !l.date.isBefore(dayStart))
        .toList();

    final snapshot = await (_db.select(_db.dailyCashBalanceTable)
          ..where((t) => t.balanceDate.equals(dayStart)))
        .getSingleOrNull();

    final ledger = await getLedger(cashLid);
    final opening = snapshot?.openingBalance ?? ledger?.currentBalance ?? 0;
    final closing = snapshot?.closingBalance ?? ledger?.currentBalance ?? 0;

    return (lines: todays, opening: opening, closing: closing);
  }

  /// Local stand-in for the legacy `cron_daily_balance.php` OS cron job
  /// (Module 4 rule #9) — call once per app session (or via a periodic
  /// background task once Module 6/offline-sync is built) rather than
  /// relying on a server crontab that doesn't exist in this architecture.
  Future<void> snapshotTodaysCashBalance() async {
    final cashLid = await _requireSystemAccount(SystemAccounts.cash);
    final ledger = await getLedger(cashLid);
    if (ledger == null) return;
    final today = DateTime.now();
    final dayStart = DateTime(today.year, today.month, today.day);

    await _db
        .into(_db.dailyCashBalanceTable)
        .insertOnConflictUpdate(
          DailyCashBalanceTableCompanion.insert(
            balanceDate: dayStart,
            openingBalance: Value(ledger.currentBalance),
            closingBalance: Value(ledger.currentBalance),
            updatedAt: Value(DateTime.now()),
          ),
        );
  }
}
