import 'package:drift/drift.dart';

import '../../../data/db/app_database.dart';
import '../domain/karigar_models.dart';

/// Local-first repository for Karigar/Job-Work (documents/map.md Module
/// 3): process (work-type) and karigar-product masters, karigar master,
/// rate cards, job-work lots (allot/allot-more/receive/remarks), and the
/// karigar's own financial ledger (payments + wage credits).
///
/// This module's money ledger is intentionally self-contained — the
/// legacy app never posts karigar payments/wage-credits into
/// `journal_entries` (unlike Payroll/Sales/Procurement, which explicitly
/// do), so this repository doesn't invent that integration either. A real
/// link to the company's main Cash ledger would be a legitimate future
/// enhancement, but it's out of documented legacy scope.
///
/// Deliberate fixes vs. the legacy PHP (documents/map.md Module 3):
///  - Receive-flow wage amounts are recomputed server-side from the rate
///    card instead of trusted from the client (map.md flags the legacy
///    as blindly trusting the client-computed amount).
///  - Job-work/process deletion guards (rules #6) are enforced here, not
///    left to a missing referential-integrity check.
///  - One canonical unit list ([tradeUnits]), not two inconsistent ones.
class KarigarRepository {
  KarigarRepository(this._db);

  final AppDatabase _db;

  // ---------------------------------------------------------------------
  // Process (work type) master — legacy fo-tr-job-process.php /
  // fo-tr-manage-job-process.php
  // ---------------------------------------------------------------------

  Stream<List<WorkTypesTableData>> watchWorkTypes() {
    return (_db.select(
      _db.workTypesTable,
    )..orderBy([(t) => OrderingTerm.asc(t.name)])).watch();
  }

  Future<int> addWorkType(String name) {
    return _db.into(_db.workTypesTable).insert(WorkTypesTableCompanion.insert(name: name));
  }

  Future<void> updateWorkType(int id, String name) {
    return (_db.update(_db.workTypesTable)..where((t) => t.id.equals(id))).write(
      WorkTypesTableCompanion(name: Value(name)),
    );
  }

  /// Blocked while any karigar references this process (rule #6) — the
  /// one guard map.md calls out as already well-implemented in the
  /// legacy's "most defensively-coded file in the module."
  Future<void> deleteWorkType(int id) async {
    final inUse = await (_db.select(
      _db.karigarsTable,
    )..where((t) => t.workTypeId.equals(id))..limit(1)).getSingleOrNull();
    if (inUse != null) {
      throw KarigarRepositoryException(
        'This process is assigned to one or more karigars and cannot be deleted',
      );
    }
    await (_db.delete(_db.workTypesTable)..where((t) => t.id.equals(id))).go();
  }

  // ---------------------------------------------------------------------
  // Karigar product master — legacy fo-tr-add-product.php
  // ---------------------------------------------------------------------

  Stream<List<KarigarProductsTableData>> watchKarigarProducts({int? workTypeId}) {
    final query = _db.select(_db.karigarProductsTable)
      ..orderBy([(t) => OrderingTerm.asc(t.productName)]);
    if (workTypeId != null) {
      query.where((t) => t.workTypeId.equals(workTypeId));
    }
    return query.watch();
  }

  Future<KarigarProductsTableData?> getKarigarProduct(int id) {
    return (_db.select(
      _db.karigarProductsTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> addKarigarProduct({
    required int workTypeId,
    required String productName,
    required List<String> units,
  }) {
    return _db.into(_db.karigarProductsTable).insert(
      KarigarProductsTableCompanion.insert(
        workTypeId: workTypeId,
        productName: productName,
        units: units.join(','),
      ),
    );
  }

  Future<void> updateKarigarProduct({
    required int id,
    required String productName,
    required List<String> units,
  }) {
    return (_db.update(_db.karigarProductsTable)..where((t) => t.id.equals(id))).write(
      KarigarProductsTableCompanion(productName: Value(productName), units: Value(units.join(','))),
    );
  }

  // ---------------------------------------------------------------------
  // Karigar master — legacy add_karigar.php / fo-tr-edit-karigar.php
  // ---------------------------------------------------------------------

  Stream<List<KarigarsTableData>> watchKarigars({String? status, String? search}) {
    final query = _db.select(_db.karigarsTable)
      ..orderBy([(t) => OrderingTerm.asc(t.karigarName)]);
    if (status != null) {
      query.where((t) => t.status.equals(status));
    }
    if (search != null && search.trim().isNotEmpty) {
      final like = '%${search.trim()}%';
      query.where((t) => t.karigarName.like(like) | t.karigarCode.like(like));
    }
    return query.watch();
  }

  Future<KarigarsTableData?> getKarigar(int id) {
    return (_db.select(
      _db.karigarsTable,
    )..where((t) => t.karigarId.equals(id))).getSingleOrNull();
  }

  Future<List<KarigarsTableData>> searchKarigars(String query, {int? workTypeId}) {
    final like = '%$query%';
    final q = _db.select(_db.karigarsTable)
      ..where((t) => t.karigarName.like(like))
      ..orderBy([(t) => OrderingTerm.asc(t.karigarName)])
      ..limit(20);
    if (workTypeId != null) {
      q.where((t) => t.workTypeId.equals(workTypeId));
    }
    return q.get();
  }

  Future<bool> isMobileTaken(String mobile, {int? excludeId}) async {
    final query = _db.select(_db.karigarsTable)..where((t) => t.mobile.equals(mobile.trim()));
    if (excludeId != null) {
      query.where((t) => t.karigarId.equals(excludeId).not());
    }
    final row = await query.getSingleOrNull();
    return row != null;
  }

  Future<int> addKarigar({
    required String karigarName,
    required String mobile,
    required int workTypeId,
    required double openingBalance,
    required BalanceType openingBalanceType,
    String? address,
    String? aadhar,
    String? pan,
    String? bankName,
    String? bankAccountNumber,
    String? bankIfsc,
  }) async {
    if (await isMobileTaken(mobile)) {
      throw KarigarRepositoryException('Mobile number "$mobile" is already registered');
    }
    final count = await _db.karigarsTable.count().getSingle();
    final code = 'KRG-${(count + 1).toString().padLeft(3, '0')}';
    return _db.into(_db.karigarsTable).insert(
      KarigarsTableCompanion.insert(
        karigarCode: code,
        karigarName: karigarName,
        mobile: mobile.trim(),
        workTypeId: workTypeId,
        openingBalance: Value(openingBalance),
        openingBalanceType: openingBalanceType.value,
        address: Value(address),
        aadhar: Value(aadhar),
        pan: Value(pan),
        bankName: Value(bankName),
        bankAccountNumber: Value(bankAccountNumber),
        bankIfsc: Value(bankIfsc),
      ),
    );
  }

  Future<void> updateKarigar({
    required int karigarId,
    required String karigarName,
    required String mobile,
    required int workTypeId,
    String? address,
    String? aadhar,
    String? pan,
    String? bankName,
    String? bankAccountNumber,
    String? bankIfsc,
  }) async {
    if (await isMobileTaken(mobile, excludeId: karigarId)) {
      throw KarigarRepositoryException('Mobile number "$mobile" is already registered');
    }
    await (_db.update(_db.karigarsTable)..where((t) => t.karigarId.equals(karigarId))).write(
      KarigarsTableCompanion(
        karigarName: Value(karigarName),
        mobile: Value(mobile.trim()),
        workTypeId: Value(workTypeId),
        address: Value(address),
        aadhar: Value(aadhar),
        pan: Value(pan),
        bankName: Value(bankName),
        bankAccountNumber: Value(bankAccountNumber),
        bankIfsc: Value(bankIfsc),
      ),
    );
  }

  Future<void> toggleKarigarStatus(int karigarId) async {
    final row = await getKarigar(karigarId);
    if (row == null) return;
    final next = row.status == 'Active' ? 'Not Active' : 'Active';
    await (_db.update(_db.karigarsTable)..where((t) => t.karigarId.equals(karigarId))).write(
      KarigarsTableCompanion(status: Value(next)),
    );
  }

  // ---------------------------------------------------------------------
  // Rate card — legacy fo-tr-job-rates.php (rule #7: hard prerequisite
  // for single-item allotment).
  // ---------------------------------------------------------------------

  Future<List<({KarigarProductRatesTableData rate, KarigarProductsTableData product})>>
  getRatesForKarigar(int karigarId) async {
    final query = _db.select(_db.karigarProductRatesTable).join([
      innerJoin(
        _db.karigarProductsTable,
        _db.karigarProductsTable.id.equalsExp(_db.karigarProductRatesTable.productId),
      ),
    ])..where(_db.karigarProductRatesTable.karigarId.equals(karigarId));
    final rows = await query.get();
    return rows
        .map(
          (r) => (
            rate: r.readTable(_db.karigarProductRatesTable),
            product: r.readTable(_db.karigarProductsTable),
          ),
        )
        .toList();
  }

  Future<KarigarProductRatesTableData?> getRate(int karigarId, int productId, String unit) {
    return (_db.select(_db.karigarProductRatesTable)
          ..where(
            (t) =>
                t.karigarId.equals(karigarId) & t.productId.equals(productId) & t.unit.equals(unit),
          ))
        .getSingleOrNull();
  }

  Future<void> setRate({
    required int karigarId,
    required int productId,
    required String unit,
    required double rate,
  }) {
    return _db
        .into(_db.karigarProductRatesTable)
        .insertOnConflictUpdate(
          KarigarProductRatesTableCompanion.insert(
            karigarId: karigarId,
            productId: productId,
            unit: unit,
            rate: rate,
          ),
        );
  }

  Future<void> deleteRate(int id) {
    return (_db.delete(_db.karigarProductRatesTable)..where((t) => t.id.equals(id))).go();
  }

  // ---------------------------------------------------------------------
  // Job work — legacy karigar_job_work.php / karigar_job_management.php
  // ---------------------------------------------------------------------

  Stream<List<KarigarJobWorkTableData>> watchJobWork({int? karigarId, String? status}) {
    final query = _db.select(_db.karigarJobWorkTable)
      ..orderBy([(t) => OrderingTerm.desc(t.allotDate)]);
    if (karigarId != null) {
      query.where((t) => t.karigarId.equals(karigarId));
    }
    if (status != null) {
      query.where((t) => t.status.equals(status));
    }
    return query.watch();
  }

  Future<KarigarJobWorkTableData?> getJobWork(int id) {
    return (_db.select(
      _db.karigarJobWorkTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<KarigarJobWorkLineItemsTableData>> getJobWorkLines(int jobWorkId) {
    return (_db.select(
      _db.karigarJobWorkLineItemsTable,
    )..where((t) => t.jobWorkId.equals(jobWorkId))).get();
  }

  /// Single-item allotment — Unit/Rate strictly sourced from the rate
  /// card (rule #7: blocks submission without an existing rate).
  Future<int> addSingleItemJobWork({
    required int workTypeId,
    required int karigarId,
    required int productId,
    required DateTime allotDate,
    required double weight,
  }) async {
    final rateRow = await (_db.select(_db.karigarProductRatesTable)
          ..where((t) => t.karigarId.equals(karigarId) & t.productId.equals(productId))
          ..limit(1))
        .getSingleOrNull();
    if (rateRow == null) {
      throw KarigarRepositoryException(
        'No rate card exists for this karigar/product — set one up first',
      );
    }
    if (weight <= 0) {
      throw KarigarRepositoryException('Weight must be greater than zero');
    }

    return _db.transaction(() async {
      final count = await _db.karigarJobWorkTable.count().getSingle();
      final jobCode = 'JOB-${(count + 1).toString().padLeft(4, '0')}';

      final jobId = await _db.into(_db.karigarJobWorkTable).insert(
        KarigarJobWorkTableCompanion.insert(
          jobCode: jobCode,
          workTypeId: workTypeId,
          karigarId: karigarId,
          productId: Value(productId),
          rate: Value(rateRow.rate),
          unit: Value(rateRow.unit),
          quantity: Value(weight),
          allotDate: allotDate,
        ),
      );
      await _db.into(_db.jobWorkAllotmentsTable).insert(
        JobWorkAllotmentsTableCompanion.insert(
          jobWorkId: jobId,
          weight: weight,
          allotDate: allotDate,
        ),
      );
      return jobId;
    });
  }

  /// Multi-item allotment — each line's rate must also come from an
  /// existing rate card (same rule #7, applied per line).
  Future<int> addMultiItemJobWork({
    required int workTypeId,
    required int karigarId,
    required DateTime allotDate,
    required List<JobWorkLineItemInput> lines,
  }) async {
    if (lines.isEmpty) {
      throw KarigarRepositoryException('Add at least one product line');
    }

    return _db.transaction(() async {
      final count = await _db.karigarJobWorkTable.count().getSingle();
      final jobCode = 'JOB-${(count + 1).toString().padLeft(4, '0')}';
      final totalWeight = lines.fold<double>(0, (s, l) => s + l.qtyAllotted);

      final jobId = await _db.into(_db.karigarJobWorkTable).insert(
        KarigarJobWorkTableCompanion.insert(
          jobCode: jobCode,
          workTypeId: workTypeId,
          karigarId: karigarId,
          isMulti: const Value(true),
          quantity: Value(totalWeight),
          allotDate: allotDate,
        ),
      );

      for (final line in lines) {
        await _db.into(_db.karigarJobWorkLineItemsTable).insert(
          KarigarJobWorkLineItemsTableCompanion.insert(
            jobWorkId: jobId,
            productId: line.productId,
            unit: line.unit,
            rate: line.rate,
            qtyAllotted: line.qtyAllotted,
          ),
        );
      }

      await _db.into(_db.jobWorkAllotmentsTable).insert(
        JobWorkAllotmentsTableCompanion.insert(
          jobWorkId: jobId,
          weight: totalWeight,
          allotDate: allotDate,
        ),
      );
      return jobId;
    });
  }

  /// "Allot More" — adds another weight-only allotment event and bumps
  /// the lot's cumulative target (single-item lots only; multi-item lots
  /// don't support this in the legacy UI either).
  Future<void> allotMore({required int jobWorkId, required double weight, required DateTime date}) async {
    final job = await getJobWork(jobWorkId);
    if (job == null) throw KarigarRepositoryException('Job work not found');
    if (job.isMulti) {
      throw KarigarRepositoryException('Allot More is only available for single-item lots');
    }
    if (weight <= 0) {
      throw KarigarRepositoryException('Weight must be greater than zero');
    }
    await _db.transaction(() async {
      await _db.into(_db.jobWorkAllotmentsTable).insert(
        JobWorkAllotmentsTableCompanion.insert(jobWorkId: jobWorkId, weight: weight, allotDate: date),
      );
      await (_db.update(_db.karigarJobWorkTable)..where((t) => t.id.equals(jobWorkId))).write(
        KarigarJobWorkTableCompanion(quantity: Value(job.quantity + weight)),
      );
    });
  }

  /// Single-item receive — `amountCredited = receiveValue × rate`, where
  /// `receiveValue` is the manually-entered net-weight-for-wages figure,
  /// deliberately decoupled from `weightReceived` (rule #2). Recomputed
  /// here from the lot's own rate (fixing the legacy's client-trust gap)
  /// rather than accepting a pre-computed amount from the caller.
  Future<void> receiveSingleItem({
    required int jobWorkId,
    required double weightReceived,
    required double receiveValue,
    required DateTime date,
  }) async {
    final job = await getJobWork(jobWorkId);
    if (job == null) throw KarigarRepositoryException('Job work not found');
    if (job.isMulti) {
      throw KarigarRepositoryException('Use the multi-item receive flow for this lot');
    }
    if (job.status == JobWorkStatus.completed.value) {
      throw KarigarRepositoryException('This job work is already completed');
    }
    if (weightReceived <= 0) {
      throw KarigarRepositoryException('Weight received must be greater than zero');
    }
    final amountCredited = receiveValue * (job.rate ?? 0);

    await _db.transaction(() async {
      await _db.into(_db.jobWorkReceiptsTable).insert(
        JobWorkReceiptsTableCompanion.insert(
          jobWorkId: jobWorkId,
          weightReceived: Value(weightReceived),
          receiveValue: Value(receiveValue),
          amountCredited: amountCredited,
          receiveDate: date,
        ),
      );
      final newQuantityRec = job.quantityRec + weightReceived;
      final completed = newQuantityRec >= job.quantity - jobWorkCompletionEpsilon;
      await (_db.update(_db.karigarJobWorkTable)..where((t) => t.id.equals(jobWorkId))).write(
        KarigarJobWorkTableCompanion(
          quantityRec: Value(newQuantityRec),
          status: Value(completed ? JobWorkStatus.completed.value : JobWorkStatus.open.value),
        ),
      );
    });
  }

  /// Multi-item receive — `amountCredited = Σ(rate × qtyReceivedNow)`
  /// per line (rule #3), recomputed from each line's own rate (not
  /// trusted from the caller).
  Future<void> receiveMultiItem({
    required int jobWorkId,
    required List<ReceiptLineInput> lines,
    required DateTime date,
  }) async {
    final job = await getJobWork(jobWorkId);
    if (job == null) throw KarigarRepositoryException('Job work not found');
    if (!job.isMulti) {
      throw KarigarRepositoryException('Use the single-item receive flow for this lot');
    }
    if (job.status == JobWorkStatus.completed.value) {
      throw KarigarRepositoryException('This job work is already completed');
    }
    if (lines.isEmpty) {
      throw KarigarRepositoryException('Enter a received quantity for at least one line');
    }

    await _db.transaction(() async {
      final jobLines = await getJobWorkLines(jobWorkId);
      final byId = {for (final l in jobLines) l.id: l};

      var totalAmount = 0.0;
      var totalQty = 0.0;
      final receiptId = await _db.into(_db.jobWorkReceiptsTable).insert(
        JobWorkReceiptsTableCompanion.insert(jobWorkId: jobWorkId, amountCredited: 0, receiveDate: date),
      );

      for (final line in lines) {
        final jobLine = byId[line.jobWorkLineItemId];
        if (jobLine == null) continue;
        if (line.qtyReceivedNow <= 0) continue;
        final amount = line.qtyReceivedNow * jobLine.rate;
        totalAmount += amount;
        totalQty += line.qtyReceivedNow;

        await _db.into(_db.jobWorkReceiptLineItemsTable).insert(
          JobWorkReceiptLineItemsTableCompanion.insert(
            receiptId: receiptId,
            jobWorkLineItemId: jobLine.id,
            qtyReceivedNow: line.qtyReceivedNow,
            amount: amount,
          ),
        );
        await (_db.update(
          _db.karigarJobWorkLineItemsTable,
        )..where((t) => t.id.equals(jobLine.id))).write(
          KarigarJobWorkLineItemsTableCompanion(
            qtyReceived: Value(jobLine.qtyReceived + line.qtyReceivedNow),
          ),
        );
      }

      await (_db.update(_db.jobWorkReceiptsTable)..where((t) => t.id.equals(receiptId))).write(
        JobWorkReceiptsTableCompanion(amountCredited: Value(totalAmount)),
      );

      final updatedLines = await getJobWorkLines(jobWorkId);
      final allComplete = updatedLines.every(
        (l) => l.qtyReceived >= l.qtyAllotted - jobWorkCompletionEpsilon,
      );
      final newQuantityRec = job.quantityRec + totalQty;
      await (_db.update(_db.karigarJobWorkTable)..where((t) => t.id.equals(jobWorkId))).write(
        KarigarJobWorkTableCompanion(
          quantityRec: Value(newQuantityRec),
          status: Value(allComplete ? JobWorkStatus.completed.value : JobWorkStatus.open.value),
        ),
      );
    });
  }

  Future<void> addRemark({required int jobWorkId, required String remark, required DateTime date}) {
    return _db.into(_db.jobWorkRemarksTable).insert(
      JobWorkRemarksTableCompanion.insert(jobWorkId: jobWorkId, remark: remark, remarkDate: date),
    );
  }

  Future<List<JobWorkRemarksTableData>> getRemarks(int jobWorkId) {
    return (_db.select(_db.jobWorkRemarksTable)
          ..where((t) => t.jobWorkId.equals(jobWorkId))
          ..orderBy([(t) => OrderingTerm.desc(t.remarkDate)]))
        .get();
  }

  Future<List<JobWorkAllotmentsTableData>> getAllotments(int jobWorkId) {
    return (_db.select(_db.jobWorkAllotmentsTable)
          ..where((t) => t.jobWorkId.equals(jobWorkId))
          ..orderBy([(t) => OrderingTerm.asc(t.allotDate)]))
        .get();
  }

  Future<List<JobWorkReceiptsTableData>> getReceipts(int jobWorkId) {
    return (_db.select(_db.jobWorkReceiptsTable)
          ..where((t) => t.jobWorkId.equals(jobWorkId))
          ..orderBy([(t) => OrderingTerm.asc(t.receiveDate)]))
        .get();
  }

  /// Blocked once `quantityRec > 0` (rule #6).
  Future<void> deleteJobWork(int jobWorkId) async {
    final job = await getJobWork(jobWorkId);
    if (job == null) return;
    if (job.quantityRec > 0) {
      throw KarigarRepositoryException(
        'This job work has receipts recorded and cannot be deleted',
      );
    }
    await _db.transaction(() async {
      await (_db.delete(
        _db.jobWorkAllotmentsTable,
      )..where((t) => t.jobWorkId.equals(jobWorkId))).go();
      await (_db.delete(
        _db.jobWorkRemarksTable,
      )..where((t) => t.jobWorkId.equals(jobWorkId))).go();
      await (_db.delete(
        _db.karigarJobWorkLineItemsTable,
      )..where((t) => t.jobWorkId.equals(jobWorkId))).go();
      await (_db.delete(_db.karigarJobWorkTable)..where((t) => t.id.equals(jobWorkId))).go();
    });
  }

  // ---------------------------------------------------------------------
  // Karigar financial ledger — self-contained (see class doc). Credit =
  // wages earned (receipts) + credit adjustments; Debit = cash paid.
  // Positive = Payable, negative = Advance (rule #4).
  // ---------------------------------------------------------------------

  Stream<List<KarigarPaymentsTableData>> watchPayments(int karigarId) {
    return (_db.select(_db.karigarPaymentsTable)
          ..where((t) => t.karigarId.equals(karigarId))
          ..orderBy([(t) => OrderingTerm.desc(t.paymentDate)]))
        .watch();
  }

  Future<void> addPayment({
    required int karigarId,
    required DateTime date,
    double amountDr = 0,
    double amountCr = 0,
    String? note,
  }) {
    if (amountDr <= 0 && amountCr <= 0) {
      throw KarigarRepositoryException('Enter a debit or credit amount');
    }
    return _db.into(_db.karigarPaymentsTable).insert(
      KarigarPaymentsTableCompanion.insert(
        karigarId: karigarId,
        paymentDate: date,
        amountDr: Value(amountDr),
        amountCr: Value(amountCr),
        note: Value(note),
      ),
    );
  }

  Future<void> deletePayment(int id) {
    return (_db.delete(_db.karigarPaymentsTable)..where((t) => t.id.equals(id))).go();
  }

  /// Current balance = opening (signed) + Σcredits (wage receipts +
  /// credit adjustments) − Σdebits (cash paid). Rule #4's sign convention
  /// preserved exactly.
  Future<double> getCurrentBalance(int karigarId) async {
    final karigar = await getKarigar(karigarId);
    if (karigar == null) return 0;
    var balance = BalanceType.fromValue(karigar.openingBalanceType).signedAmount(karigar.openingBalance);

    final jobs = await (_db.select(
      _db.karigarJobWorkTable,
    )..where((t) => t.karigarId.equals(karigarId))).get();
    for (final job in jobs) {
      final receipts = await getReceipts(job.id);
      balance += receipts.fold<double>(0, (s, r) => s + r.amountCredited);
    }

    final payments = await (_db.select(
      _db.karigarPaymentsTable,
    )..where((t) => t.karigarId.equals(karigarId))).get();
    for (final p in payments) {
      balance += p.amountCr - p.amountDr;
    }

    return balance;
  }

  /// KPI summary for the Karigar Statement / Full Report — legacy
  /// karigar_full_report.php (map.md: "the most complex report").
  Future<
    ({
      int lotsIssued,
      int lotsPending,
      int lotsCompleted,
      double weightAllotted,
      double weightReceived,
      double weightPending,
      double totalCredit,
      double totalDebit,
      double balance,
    })
  >
  getKarigarStatementSummary(int karigarId) async {
    final jobs = await (_db.select(
      _db.karigarJobWorkTable,
    )..where((t) => t.karigarId.equals(karigarId))).get();

    final lotsIssued = jobs.length;
    final lotsCompleted = jobs.where((j) => j.status == JobWorkStatus.completed.value).length;
    final lotsPending = lotsIssued - lotsCompleted;
    final weightAllotted = jobs.fold<double>(0, (s, j) => s + j.quantity);
    final weightReceived = jobs.fold<double>(0, (s, j) => s + j.quantityRec);

    var totalCredit = 0.0;
    for (final job in jobs) {
      final receipts = await getReceipts(job.id);
      totalCredit += receipts.fold<double>(0, (s, r) => s + r.amountCredited);
    }

    final payments = await (_db.select(
      _db.karigarPaymentsTable,
    )..where((t) => t.karigarId.equals(karigarId))).get();
    totalCredit += payments.fold<double>(0, (s, p) => s + p.amountCr);
    final totalDebit = payments.fold<double>(0, (s, p) => s + p.amountDr);

    final balance = await getCurrentBalance(karigarId);

    return (
      lotsIssued: lotsIssued,
      lotsPending: lotsPending,
      lotsCompleted: lotsCompleted,
      weightAllotted: weightAllotted,
      weightReceived: weightReceived,
      weightPending: weightAllotted - weightReceived,
      totalCredit: totalCredit,
      totalDebit: totalDebit,
      balance: balance,
    );
  }
}
