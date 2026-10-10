import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';
import '../domain/ledger_models.dart';
import 'widgets/party_picker_field.dart';

/// Bank voucher entry + entries view — legacy o-t-bank.php (documents/
/// map.md Module 4): Deposit/Withdrawal against a party, plus a tab
/// showing a bank account's entries with the correct running balance
/// (rule #4 — ascending accumulation, reversed for display).
class BankScreen extends ConsumerStatefulWidget {
  const BankScreen({super.key});

  @override
  ConsumerState<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends ConsumerState<BankScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bank', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: const [
            Tab(text: 'New Transaction'),
            Tab(text: 'Bank Entries'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [_BankTransactionForm(), _BankEntriesTab()],
          ),
        ),
      ],
    );
  }
}

final _bankLedgersProvider = StreamProvider<List<LedgerTableData>>((ref) {
  return ref.watch(ledgerRepositoryProvider).watchLedgers(accountType: 'Bank');
});

class _BankTransactionForm extends ConsumerStatefulWidget {
  const _BankTransactionForm();

  @override
  ConsumerState<_BankTransactionForm> createState() => _BankTransactionFormState();
}

class _BankTransactionFormState extends ConsumerState<_BankTransactionForm> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  final _utrCtrl = TextEditingController();
  final _narrationCtrl = TextEditingController();

  BankDirection _direction = BankDirection.deposit;
  String _bankType = 'NEFT';
  LedgerTableData? _bank;
  LedgerTableData? _party;
  DateTime _date = DateTime.now();
  bool _loading = false;

  @override
  void dispose() {
    _amountCtrl.dispose();
    _utrCtrl.dispose();
    _narrationCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _bank == null || _party == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select bank account and party')),
      );
      return;
    }
    setState(() => _loading = true);
    try {
      await ref
          .read(ledgerRepositoryProvider)
          .postBankTransaction(
            direction: _direction,
            bankLedgerId: _bank!.lid,
            partyLedgerId: _party!.lid,
            date: _date,
            amount: double.parse(_amountCtrl.text.trim()),
            bankType: _bankType,
            utrNo: _utrCtrl.text.trim(),
            narration: _narrationCtrl.text.trim(),
          );
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Bank transaction saved')));
        _formKey.currentState!.reset();
        _amountCtrl.clear();
        _utrCtrl.clear();
        _narrationCtrl.clear();
        setState(() {
          _bank = null;
          _party = null;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final banksAsync = ref.watch(_bankLedgersProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SegmentedButton<BankDirection>(
                    segments: const [
                      ButtonSegment(
                        value: BankDirection.deposit,
                        label: Text('Deposit'),
                        icon: Icon(Icons.arrow_downward),
                      ),
                      ButtonSegment(
                        value: BankDirection.withdrawal,
                        label: Text('Withdrawal'),
                        icon: Icon(Icons.arrow_upward),
                      ),
                    ],
                    selected: {_direction},
                    onSelectionChanged: (s) => setState(() => _direction = s.first),
                  ),
                  const SizedBox(height: 16),
                  banksAsync.when(
                    data: (banks) => DropdownButtonFormField<LedgerTableData>(
                      value: _bank,
                      isExpanded: true,
                      decoration: const InputDecoration(labelText: 'Bank Account *'),
                      items: banks
                          .map(
                            (b) => DropdownMenuItem(
                              value: b,
                              child: Text(b.accountName, overflow: TextOverflow.ellipsis),
                            ),
                          )
                          .toList(),
                      onChanged: (v) => setState(() => _bank = v),
                    ),
                    loading: () => const LinearProgressIndicator(),
                    error: (e, _) => Text('Error: $e'),
                  ),
                  const SizedBox(height: 16),
                  PartyPickerField(
                    onSelected: (p) => setState(() => _party = p),
                    types: const ['Sundry Debtor', 'Sundry Creditor'],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: _bankType,
                          isExpanded: true,
                          decoration: const InputDecoration(labelText: 'Mode'),
                          items: const ['IMPS', 'UPI', 'NEFT', 'RTGS']
                              .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                              .toList(),
                          onChanged: (v) => setState(() => _bankType = v ?? 'NEFT'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: _utrCtrl,
                          decoration: const InputDecoration(labelText: 'UTR No *'),
                          validator: (v) =>
                              (v == null || v.trim().isEmpty) ? 'Required' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _amountCtrl,
                          decoration: const InputDecoration(labelText: 'Amount *'),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          validator: (v) {
                            final n = double.tryParse(v ?? '');
                            return (n == null || n <= 0) ? 'Enter a valid amount' : null;
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: _date,
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null) setState(() => _date = picked);
                          },
                          child: InputDecorator(
                            decoration: const InputDecoration(labelText: 'Date'),
                            child: Text(
                              '${_date.year}-${_date.month.toString().padLeft(2, '0')}-${_date.day.toString().padLeft(2, '0')}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _narrationCtrl,
                    decoration: const InputDecoration(labelText: 'Narration'),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _loading ? null : _submit,
                      child: _loading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Save Transaction'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BankEntriesTab extends ConsumerStatefulWidget {
  const _BankEntriesTab();

  @override
  ConsumerState<_BankEntriesTab> createState() => _BankEntriesTabState();
}

class _BankEntriesTabState extends ConsumerState<_BankEntriesTab> {
  int? _selectedBankId;

  @override
  Widget build(BuildContext context) {
    final banksAsync = ref.watch(_bankLedgersProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        banksAsync.when(
          data: (banks) => SizedBox(
            width: 320,
            child: DropdownButtonFormField<int>(
              value: _selectedBankId,
              isExpanded: true,
              decoration: const InputDecoration(labelText: 'Select Bank Account'),
              items: banks
                  .map(
                    (b) => DropdownMenuItem(
                      value: b.lid,
                      child: Text(b.accountName, overflow: TextOverflow.ellipsis),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _selectedBankId = v),
            ),
          ),
          loading: () => const LinearProgressIndicator(),
          error: (e, _) => Text('Error: $e'),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: _selectedBankId == null
              ? const Center(child: Text('Select a bank account to view entries'))
              : _BankEntriesList(lid: _selectedBankId!),
        ),
      ],
    );
  }
}

class _BankEntriesList extends ConsumerWidget {
  const _BankEntriesList({required this.lid});
  final int lid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<StatementLine>>(
      future: ref.read(ledgerRepositoryProvider).getLedgerStatement(lid),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final lines = snapshot.data!;
        if (lines.isEmpty) {
          return const Center(child: Text('No entries yet'));
        }
        return Card(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: lines.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final l = lines[i];
              return ListTile(
                title: Text(l.narration?.isNotEmpty == true ? l.narration! : l.voucherType),
                subtitle: Text('${l.voucherNo} • ${l.date.toString().split(' ').first}'),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l.debit > 0
                          ? '+${MoneyFormat.plain(l.debit)}'
                          : '-${MoneyFormat.plain(l.credit)}',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: l.debit > 0 ? Colors.green[700] : Colors.red[700],
                      ),
                    ),
                    Text(
                      MoneyFormat.withDrCr(l.runningBalance),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
