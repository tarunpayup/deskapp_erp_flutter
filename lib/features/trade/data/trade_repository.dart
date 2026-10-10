import 'package:drift/drift.dart';

import '../../../core/constants/account_types.dart';
import '../../../data/db/app_database.dart';
import '../../ledger/data/ledger_repository.dart';
import '../domain/trade_models.dart';

/// Local-first repository for Trader/Trade/Sales/Procurement (documents/
/// map.md Module 5): customer/vendor master, product master, party rates,
/// Sales and Procurement — each posting a balanced journal entry through
/// [LedgerRepository.postJournalEntry] (the one canonical posting core,
/// shared rather than duplicated).
///
/// Deliberate fixes vs. the legacy PHP (documents/map.md Module 5):
///  - Sales/Procurement line items are normalized rows, not semicolon-
///    delimited strings packed into a single column.
///  - The journal entry a sale/purchase posted is stored as a real FK
///    (`journal_entry_id`), not found later by narration+date+amount match.
///  - Reversing a sale/purchase posts an equal-and-opposite journal entry
///    and marks the row `reversed` instead of hard-deleting it — the
///    accounting effect is cancelled but the audit trail survives.
///  - The manually-entered taxable-value override is validated against the
///    line-item sum instead of trusted blindly (map.md flags this as an
///    integrity risk in the legacy form).
class TradeRepository {
  TradeRepository(this._db, this._ledgerRepo);

  final AppDatabase _db;
  final LedgerRepository _ledgerRepo;

  // ---------------------------------------------------------------------
  // Trader (Customer/Vendor) master — legacy add-customer / add-vendor
  // ---------------------------------------------------------------------

  Stream<List<TradersTableData>> watchTraders({
    required TraderType type,
    String? status,
    String? search,
  }) {
    final query = _db.select(_db.tradersTable)
      ..where((t) => t.traderType.equals(type.name))
      ..orderBy([(t) => OrderingTerm.asc(t.traderName)]);
    if (status != null) {
      query.where((t) => t.status.equals(status));
    }
    if (search != null && search.trim().isNotEmpty) {
      final like = '%${search.trim()}%';
      query.where((t) => t.traderName.like(like) | t.traderCode.like(like));
    }
    return query.watch();
  }

  Future<TradersTableData?> getTrader(int id) {
    return (_db.select(
      _db.tradersTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<List<TradersTableData>> searchTraders(String query, {TraderType? type}) {
    final like = '%$query%';
    final q = _db.select(_db.tradersTable)
      ..where((t) => t.traderName.like(like))
      ..orderBy([(t) => OrderingTerm.asc(t.traderName)])
      ..limit(20);
    if (type != null) {
      q.where((t) => t.traderType.equals(type.name));
    }
    return q.get();
  }

  Future<String> _nextTraderCode(TraderType type) async {
    final count = await _db.tradersTable.count(
      where: (t) => t.traderType.equals(type.name),
    ).getSingle();
    return '${type.codePrefix}-${(count + 1).toString().padLeft(4, '0')}';
  }

  /// Creates a trader AND its backing ledger row atomically (legacy
  /// created both too, but looked them up separately afterward by name —
  /// here they're FK-linked from the start).
  Future<int> addTrader({
    required TraderType type,
    required String traderName,
    required double openingBalance,
    String? gstin,
    String? panCard,
    String? phone,
    String? telephone,
    String? email,
    String? address,
    String? city,
    String? state,
    String? pincode,
  }) async {
    return _db.transaction(() async {
      final ledgerId = await _db.into(_db.ledgerTable).insert(
        LedgerTableCompanion.insert(
          accountType: type.ledgerAccountType,
          accountName: traderName,
          openingBalance: Value(openingBalance),
          currentBalance: Value(openingBalance),
          description: Value('${type.label} ledger'),
        ),
      );
      final code = await _nextTraderCode(type);
      return _db.into(_db.tradersTable).insert(
        TradersTableCompanion.insert(
          traderCode: code,
          ledgerId: ledgerId,
          traderName: traderName,
          traderType: type.name,
          gstin: Value(gstin),
          panCard: Value(panCard),
          phone: Value(phone),
          telephone: Value(telephone),
          email: Value(email),
          address: Value(address),
          city: Value(city),
          state: Value(state),
          pincode: Value(pincode),
        ),
      );
    });
  }

  Future<void> updateTrader({
    required int id,
    required String traderName,
    String? gstin,
    String? panCard,
    String? phone,
    String? telephone,
    String? email,
    String? address,
    String? city,
    String? state,
    String? pincode,
  }) async {
    final trader = await getTrader(id);
    if (trader == null) {
      throw TradeRepositoryException('Trader not found');
    }
    await _db.transaction(() async {
      await (_db.update(_db.tradersTable)..where((t) => t.id.equals(id))).write(
        TradersTableCompanion(
          traderName: Value(traderName),
          gstin: Value(gstin),
          panCard: Value(panCard),
          phone: Value(phone),
          telephone: Value(telephone),
          email: Value(email),
          address: Value(address),
          city: Value(city),
          state: Value(state),
          pincode: Value(pincode),
        ),
      );
      await (_db.update(
        _db.ledgerTable,
      )..where((t) => t.lid.equals(trader.ledgerId))).write(
        LedgerTableCompanion(accountName: Value(traderName)),
      );
    });
  }

  Future<void> toggleTraderStatus(int id) async {
    final row = await getTrader(id);
    if (row == null) return;
    final next = row.status == 'Active' ? 'Not Active' : 'Active';
    await (_db.update(
      _db.tradersTable,
    )..where((t) => t.id.equals(id))).write(TradersTableCompanion(status: Value(next)));
  }

  /// Blocked if this trader has any Sales/Procurement history — mirrors
  /// the ledger-history guard in LedgerRepository (map.md Module 4 rule
  /// preserved here for consistency, not present explicitly in the legacy
  /// trader-delete flow but the right call given shared accounting data).
  Future<void> deleteTrader(int id) async {
    final hasSales = await (_db.select(
      _db.salesTable,
    )..where((t) => t.traderId.equals(id))..limit(1)).getSingleOrNull();
    final hasProcurement = await (_db.select(
      _db.procurementTable,
    )..where((t) => t.traderId.equals(id))..limit(1)).getSingleOrNull();
    if (hasSales != null || hasProcurement != null) {
      throw TradeRepositoryException(
        'This party has sales/procurement history and cannot be deleted — '
        'mark it Not Active instead.',
      );
    }
    final trader = await getTrader(id);
    if (trader == null) return;
    await _db.transaction(() async {
      await (_db.delete(_db.tradersTable)..where((t) => t.id.equals(id))).go();
      await (_db.delete(
        _db.ledgerTable,
      )..where((t) => t.lid.equals(trader.ledgerId))).go();
    });
  }

  /// Outstanding-balance report — legacy o-tr-customers-report.php /
  /// o-tr-vendors-report.php, consolidated into one parameterized method
  /// (map.md Module 5 flags the legacy as two near-identical duplicated
  /// files). With no date range: each party's current outstanding
  /// balance (its ledger's `current_balance`, which already accounts for
  /// the opening balance). With a date range: that period's Dr/Cr
  /// *activity* instead (summed from the statement lines, which does NOT
  /// include the opening balance — a period activity figure, not a
  /// balance).
  Future<List<({TradersTableData trader, double debit, double credit})>> getPartyBalanceReport({
    required TraderType type,
    DateTime? from,
    DateTime? to,
  }) async {
    final traders = await (_db.select(
      _db.tradersTable,
    )..where((t) => t.traderType.equals(type.name))).get();

    final result = <({TradersTableData trader, double debit, double credit})>[];
    for (final trader in traders) {
      if (from == null && to == null) {
        final ledger = await _ledgerRepo.getLedger(trader.ledgerId);
        final balance = ledger?.currentBalance ?? 0;
        result.add(
          (trader: trader, debit: balance >= 0 ? balance : 0, credit: balance < 0 ? -balance : 0),
        );
      } else {
        final lines = await _ledgerRepo.getLedgerStatement(trader.ledgerId, from: from, to: to);
        final debit = lines.fold<double>(0, (s, l) => s + l.debit);
        final credit = lines.fold<double>(0, (s, l) => s + l.credit);
        result.add((trader: trader, debit: debit, credit: credit));
      }
    }
    return result;
  }

  // ---------------------------------------------------------------------
  // Product master — legacy o-tr-product.php
  // ---------------------------------------------------------------------

  Stream<List<ProductsTableData>> watchProducts({String? search}) {
    final query = _db.select(_db.productsTable)
      ..orderBy([(t) => OrderingTerm.asc(t.productName)]);
    if (search != null && search.trim().isNotEmpty) {
      final like = '%${search.trim()}%';
      query.where((t) => t.productName.like(like) | t.productCode.like(like));
    }
    return query.watch();
  }

  Future<ProductsTableData?> getProduct(int pid) {
    return (_db.select(
      _db.productsTable,
    )..where((t) => t.pid.equals(pid))).getSingleOrNull();
  }

  Future<int> addProduct({
    required String productName,
    required double basePrice,
    required List<String> units,
    required String transactionType,
  }) async {
    final count = await _db.productsTable.count().getSingle();
    final code = 'PRODUCT-${(count + 1).toString().padLeft(4, '0')}';
    return _db.into(_db.productsTable).insert(
      ProductsTableCompanion.insert(
        productCode: code,
        productName: productName,
        basePrice: Value(basePrice),
        units: units.join(','),
        transactionType: transactionType,
      ),
    );
  }

  Future<void> updateProduct({
    required int pid,
    required String productName,
    required double basePrice,
    required List<String> units,
    required String transactionType,
  }) {
    return (_db.update(_db.productsTable)..where((t) => t.pid.equals(pid))).write(
      ProductsTableCompanion(
        productName: Value(productName),
        basePrice: Value(basePrice),
        units: Value(units.join(',')),
        transactionType: Value(transactionType),
      ),
    );
  }

  Future<void> toggleProductStatus(int pid) async {
    final row = await getProduct(pid);
    if (row == null) return;
    final next = row.status == 'Active' ? 'Not Active' : 'Active';
    await (_db.update(
      _db.productsTable,
    )..where((t) => t.pid.equals(pid))).write(ProductsTableCompanion(status: Value(next)));
  }

  /// Blocked if this product is referenced by any sale/procurement line or
  /// party rate (no FK-constraint violation path exposed to the user as a
  /// raw DB error — checked explicitly and reported clearly instead).
  Future<void> deleteProduct(int pid) async {
    final inSales = await (_db.select(
      _db.salesLineItemsTable,
    )..where((t) => t.productId.equals(pid))..limit(1)).getSingleOrNull();
    final inProcurement = await (_db.select(
      _db.procurementLineItemsTable,
    )..where((t) => t.productId.equals(pid))..limit(1)).getSingleOrNull();
    final inRates = await (_db.select(
      _db.partyRatesTable,
    )..where((t) => t.productId.equals(pid))..limit(1)).getSingleOrNull();
    if (inSales != null || inProcurement != null || inRates != null) {
      throw TradeRepositoryException(
        'This product is in use (sales, procurement, or party rates) and '
        'cannot be deleted — mark it Not Active instead.',
      );
    }
    await (_db.delete(_db.productsTable)..where((t) => t.pid.equals(pid))).go();
  }

  // ---------------------------------------------------------------------
  // Party rates — legacy o-tr-party-rates.php. One rate per (party,
  // product) pair (Appendix C: real unique key has no unit component).
  // ---------------------------------------------------------------------

  Future<List<({PartyRatesTableData rate, ProductsTableData product})>> getPartyRates(
    int partyId,
  ) async {
    final query = _db.select(_db.partyRatesTable).join([
      innerJoin(
        _db.productsTable,
        _db.productsTable.pid.equalsExp(_db.partyRatesTable.productId),
      ),
    ])..where(_db.partyRatesTable.partyId.equals(partyId));
    final rows = await query.get();
    return rows
        .map(
          (r) => (
            rate: r.readTable(_db.partyRatesTable),
            product: r.readTable(_db.productsTable),
          ),
        )
        .toList();
  }

  Future<double?> getPartyRate(int partyId, int productId) async {
    final row = await (_db.select(_db.partyRatesTable)
          ..where((t) => t.partyId.equals(partyId) & t.productId.equals(productId)))
        .getSingleOrNull();
    return row?.rate;
  }

  Future<void> setPartyRate({
    required int partyId,
    required int productId,
    required String unit,
    required double rate,
  }) {
    return _db
        .into(_db.partyRatesTable)
        .insertOnConflictUpdate(
          PartyRatesTableCompanion.insert(
            partyId: partyId,
            productId: productId,
            unit: unit,
            rate: rate,
          ),
        );
  }

  // ---------------------------------------------------------------------
  // Sales — legacy `add-sale` (function.php): Customer Dr / Sales Cr /
  // GST Cr. The taxable-value override is validated against the
  // line-item sum rather than trusted blindly (see class doc).
  // ---------------------------------------------------------------------

  Future<int> addSale({
    required int traderId,
    required DateTime saleDate,
    required List<TradeLineItemInput> lines,
    double? taxableValueOverride,
    required double cgstPercent,
    required double sgstPercent,
    required double igstPercent,
    String? deliveryMode,
    DateTime? dateOfDelivery,
  }) async {
    if (lines.isEmpty) {
      throw TradeRepositoryException('Add at least one line item');
    }
    final lineSum = lines.fold<double>(0, (s, l) => s + l.taxableValue);
    final taxableValue = taxableValueOverride ?? lineSum;
    if ((taxableValue - lineSum).abs() > 0.5) {
      throw TradeRepositoryException(
        'Taxable value (${taxableValue.toStringAsFixed(2)}) does not match '
        'the line-item total (${lineSum.toStringAsFixed(2)})',
      );
    }

    final trader = await getTrader(traderId);
    if (trader == null) {
      throw TradeRepositoryException('Customer not found');
    }

    final cgstAmount = taxableValue * cgstPercent / 100;
    final sgstAmount = taxableValue * sgstPercent / 100;
    final igstAmount = taxableValue * igstPercent / 100;
    final total = taxableValue + cgstAmount + sgstAmount + igstAmount;

    return _db.transaction(() async {
      final salesLid = await _ledgerRepo.ensureSystemAccount(
        SystemAccounts.sales,
        'Income',
      );

      final journalLines = <int, double>{
        trader.ledgerId: total,
        salesLid: -taxableValue,
      };
      if (cgstAmount > 0) {
        final lid = await _ledgerRepo.ensureSystemAccount(
          SystemAccounts.cgstOutput,
          'Current Liability',
        );
        journalLines[lid] = (journalLines[lid] ?? 0) - cgstAmount;
      }
      if (sgstAmount > 0) {
        final lid = await _ledgerRepo.ensureSystemAccount(
          SystemAccounts.sgstOutput,
          'Current Liability',
        );
        journalLines[lid] = (journalLines[lid] ?? 0) - sgstAmount;
      }
      if (igstAmount > 0) {
        final lid = await _ledgerRepo.ensureSystemAccount(
          SystemAccounts.igstOutput,
          'Current Liability',
        );
        journalLines[lid] = (journalLines[lid] ?? 0) - igstAmount;
      }

      final count = await _db.salesTable.count().getSingle();
      final salesCode = 'SALE-${(count + 1).toString().padLeft(4, '0')}';
      final voucherNo = _ledgerRepo.generateVoucherNo();

      final journalEntryId = await _ledgerRepo.postJournalEntry(
        voucherType: 'SALE',
        voucherNo: voucherNo,
        date: saleDate,
        narration: 'Sale $salesCode to ${trader.traderName}',
        lines: journalLines,
      );

      final salesId = await _db.into(_db.salesTable).insert(
        SalesTableCompanion.insert(
          salesCode: salesCode,
          traderId: traderId,
          saleDate: saleDate,
          taxableValue: taxableValue,
          cgstPercent: Value(cgstPercent),
          sgstPercent: Value(sgstPercent),
          igstPercent: Value(igstPercent),
          totalAfterTax: total,
          deliveryMode: Value(deliveryMode),
          dateOfDelivery: Value(dateOfDelivery),
          journalEntryId: Value(journalEntryId),
        ),
      );

      for (final line in lines) {
        await _db.into(_db.salesLineItemsTable).insert(
          SalesLineItemsTableCompanion.insert(
            salesId: salesId,
            productId: line.productId,
            productName: line.productName,
            unit: line.unit,
            qty: line.qty,
            priceOfProduct: line.priceOfProduct,
            taxableValue: line.taxableValue,
          ),
        );
      }

      return salesId;
    });
  }

  Stream<List<({SalesTableData sale, String traderName})>> watchSales() {
    final query = _db.select(_db.salesTable).join([
      innerJoin(
        _db.tradersTable,
        _db.tradersTable.id.equalsExp(_db.salesTable.traderId),
      ),
    ])..orderBy([OrderingTerm.desc(_db.salesTable.saleDate)]);
    return query.watch().map(
      (rows) => rows
          .map(
            (r) => (
              sale: r.readTable(_db.salesTable),
              traderName: r.readTable(_db.tradersTable).traderName,
            ),
          )
          .toList(),
    );
  }

  Future<List<SalesLineItemsTableData>> getSaleLines(int salesId) {
    return (_db.select(
      _db.salesLineItemsTable,
    )..where((t) => t.salesId.equals(salesId))).get();
  }

  /// Reverses a sale by posting the equal-and-opposite journal entry and
  /// marking the row reversed — see class doc for why this replaces the
  /// legacy's hard-delete.
  Future<void> reverseSale(int salesId) async {
    final sale = await (_db.select(
      _db.salesTable,
    )..where((t) => t.sid.equals(salesId))).getSingleOrNull();
    if (sale == null) {
      throw TradeRepositoryException('Sale not found');
    }
    if (sale.reversed) {
      throw TradeRepositoryException('This sale is already reversed');
    }
    if (sale.journalEntryId == null) {
      throw TradeRepositoryException('No journal entry linked to this sale');
    }

    await _db.transaction(() async {
      final details = await (_db.select(
        _db.journalEntryDetailsTable,
      )..where((t) => t.entryId.equals(sale.journalEntryId!))).get();

      final reversedLines = <int, double>{};
      for (final d in details) {
        reversedLines[d.accountId] = (reversedLines[d.accountId] ?? 0) - (d.debit - d.credit);
      }

      await _ledgerRepo.postJournalEntry(
        voucherType: 'SALE-REVERSAL',
        voucherNo: _ledgerRepo.generateVoucherNo(),
        date: DateTime.now(),
        narration: 'Reversal of ${sale.salesCode}',
        lines: reversedLines,
      );

      await (_db.update(
        _db.salesTable,
      )..where((t) => t.sid.equals(salesId))).write(const SalesTableCompanion(reversed: Value(true)));
    });
  }

  // ---------------------------------------------------------------------
  // Procurement — legacy `add-procurement` (function.php): Purchase Dr /
  // GST Input Dr×3 / Vendor Cr. Symmetric to Sales above.
  // ---------------------------------------------------------------------

  Future<int> addProcurement({
    required int traderId,
    required DateTime purchaseDate,
    required List<TradeLineItemInput> lines,
    double? taxableValueOverride,
    required double cgstPercent,
    required double sgstPercent,
    required double igstPercent,
    double otherExpenses = 0,
  }) async {
    if (lines.isEmpty) {
      throw TradeRepositoryException('Add at least one line item');
    }
    final lineSum = lines.fold<double>(0, (s, l) => s + l.taxableValue);
    final taxableValue = taxableValueOverride ?? lineSum;
    if ((taxableValue - lineSum).abs() > 0.5) {
      throw TradeRepositoryException(
        'Taxable value (${taxableValue.toStringAsFixed(2)}) does not match '
        'the line-item total (${lineSum.toStringAsFixed(2)})',
      );
    }

    final trader = await getTrader(traderId);
    if (trader == null) {
      throw TradeRepositoryException('Vendor not found');
    }

    final cgstAmount = taxableValue * cgstPercent / 100;
    final sgstAmount = taxableValue * sgstPercent / 100;
    final igstAmount = taxableValue * igstPercent / 100;
    final total = taxableValue + cgstAmount + sgstAmount + igstAmount + otherExpenses;

    return _db.transaction(() async {
      final purchaseLid = await _ledgerRepo.ensureSystemAccount(
        SystemAccounts.purchase,
        'Procurement',
      );

      final journalLines = <int, double>{
        purchaseLid: taxableValue + otherExpenses,
        trader.ledgerId: -total,
      };
      if (cgstAmount > 0) {
        final lid = await _ledgerRepo.ensureSystemAccount(
          SystemAccounts.cgstInput,
          'Current asset',
        );
        journalLines[lid] = (journalLines[lid] ?? 0) + cgstAmount;
      }
      if (sgstAmount > 0) {
        final lid = await _ledgerRepo.ensureSystemAccount(
          SystemAccounts.sgstInput,
          'Current asset',
        );
        journalLines[lid] = (journalLines[lid] ?? 0) + sgstAmount;
      }
      if (igstAmount > 0) {
        final lid = await _ledgerRepo.ensureSystemAccount(
          SystemAccounts.igstInput,
          'Current asset',
        );
        journalLines[lid] = (journalLines[lid] ?? 0) + igstAmount;
      }

      final count = await _db.procurementTable.count().getSingle();
      final purchaseCode = 'PROC-${(count + 1).toString().padLeft(4, '0')}';
      final voucherNo = _ledgerRepo.generateVoucherNo();

      final journalEntryId = await _ledgerRepo.postJournalEntry(
        voucherType: 'PROCUREMENT',
        voucherNo: voucherNo,
        date: purchaseDate,
        narration: 'Procurement $purchaseCode from ${trader.traderName}',
        lines: journalLines,
      );

      final purchaseId = await _db.into(_db.procurementTable).insert(
        ProcurementTableCompanion.insert(
          purchaseCode: purchaseCode,
          traderId: traderId,
          purchaseDate: purchaseDate,
          taxableValue: taxableValue,
          cgstPercent: Value(cgstPercent),
          sgstPercent: Value(sgstPercent),
          igstPercent: Value(igstPercent),
          otherExpenses: Value(otherExpenses),
          totalAfterTax: total,
          journalEntryId: Value(journalEntryId),
        ),
      );

      for (final line in lines) {
        await _db.into(_db.procurementLineItemsTable).insert(
          ProcurementLineItemsTableCompanion.insert(
            purchaseId: purchaseId,
            productId: line.productId,
            productName: line.productName,
            unit: line.unit,
            qty: line.qty,
            priceOfProduct: line.priceOfProduct,
            taxableValue: line.taxableValue,
          ),
        );
      }

      return purchaseId;
    });
  }

  Stream<List<({ProcurementTableData purchase, String traderName})>> watchProcurement() {
    final query = _db.select(_db.procurementTable).join([
      innerJoin(
        _db.tradersTable,
        _db.tradersTable.id.equalsExp(_db.procurementTable.traderId),
      ),
    ])..orderBy([OrderingTerm.desc(_db.procurementTable.purchaseDate)]);
    return query.watch().map(
      (rows) => rows
          .map(
            (r) => (
              purchase: r.readTable(_db.procurementTable),
              traderName: r.readTable(_db.tradersTable).traderName,
            ),
          )
          .toList(),
    );
  }

  Future<List<ProcurementLineItemsTableData>> getProcurementLines(int purchaseId) {
    return (_db.select(
      _db.procurementLineItemsTable,
    )..where((t) => t.purchaseId.equals(purchaseId))).get();
  }

  Future<void> reverseProcurement(int purchaseId) async {
    final purchase = await (_db.select(
      _db.procurementTable,
    )..where((t) => t.pid.equals(purchaseId))).getSingleOrNull();
    if (purchase == null) {
      throw TradeRepositoryException('Procurement not found');
    }
    if (purchase.reversed) {
      throw TradeRepositoryException('This procurement is already reversed');
    }
    if (purchase.journalEntryId == null) {
      throw TradeRepositoryException('No journal entry linked to this procurement');
    }

    await _db.transaction(() async {
      final details = await (_db.select(
        _db.journalEntryDetailsTable,
      )..where((t) => t.entryId.equals(purchase.journalEntryId!))).get();

      final reversedLines = <int, double>{};
      for (final d in details) {
        reversedLines[d.accountId] = (reversedLines[d.accountId] ?? 0) - (d.debit - d.credit);
      }

      await _ledgerRepo.postJournalEntry(
        voucherType: 'PROCUREMENT-REVERSAL',
        voucherNo: _ledgerRepo.generateVoucherNo(),
        date: DateTime.now(),
        narration: 'Reversal of ${purchase.purchaseCode}',
        lines: reversedLines,
      );

      await (_db.update(_db.procurementTable)..where((t) => t.pid.equals(purchaseId))).write(
        const ProcurementTableCompanion(reversed: Value(true)),
      );
    });
  }
}
