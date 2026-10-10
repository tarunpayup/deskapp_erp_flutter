import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/account_types.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../../data/db/app_database.dart';
import '../domain/ledger_models.dart';
import 'widgets/party_picker_field.dart';

/// Cash voucher entry — legacy o-t-cash.php (documents/map.md Module 4):
/// Cash In/Out against a party, optional write-off, with a live Cash
/// balance summary card.
class CashScreen extends ConsumerStatefulWidget {
  const CashScreen({super.key});

  @override
  ConsumerState<CashScreen> createState() => _CashScreenState();
}

class _CashScreenState extends ConsumerState<CashScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  final _writeOffCtrl = TextEditingController();
  final _narrationCtrl = TextEditingController();

  CashDirection _direction = CashDirection.receive;
  LedgerTableData? _party;
  DateTime _date = DateTime.now();
  bool _writeOffEnabled = false;
  bool _loading = false;

  @override
  void dispose() {
    _amountCtrl.dispose();
    _writeOffCtrl.dispose();
    _narrationCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _party == null) {
      if (_party == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Select a party')));
      }
      return;
    }
    setState(() => _loading = true);
    try {
      await ref
          .read(ledgerRepositoryProvider)
          .postCashTransaction(
            direction: _direction,
            partyLedgerId: _party!.lid,
            date: _date,
            amount: double.parse(_amountCtrl.text.trim()),
            writeOffAmount: _writeOffEnabled
                ? (double.tryParse(_writeOffCtrl.text.trim()) ?? 0)
                : 0,
            narration: _narrationCtrl.text.trim(),
          );
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Cash transaction saved')));
        _formKey.currentState!.reset();
        _amountCtrl.clear();
        _writeOffCtrl.clear();
        _narrationCtrl.clear();
        setState(() {
          _party = null;
          _writeOffEnabled = false;
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
    final cashLedgerAsync = ref.watch(
      _cashLedgerProvider,
    );

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cash', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          cashLedgerAsync.when(
            data: (ledger) => _CashBalanceCard(ledger: ledger),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          const SizedBox(height: 24),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SegmentedButton<CashDirection>(
                        segments: const [
                          ButtonSegment(
                            value: CashDirection.receive,
                            label: Text('Cash In'),
                            icon: Icon(Icons.arrow_downward),
                          ),
                          ButtonSegment(
                            value: CashDirection.pay,
                            label: Text('Cash Out'),
                            icon: Icon(Icons.arrow_upward),
                          ),
                        ],
                        selected: {_direction},
                        onSelectionChanged: (s) =>
                            setState(() => _direction = s.first),
                      ),
                      const SizedBox(height: 16),
                      PartyPickerField(onSelected: (p) => setState(() => _party = p)),
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
                      const SizedBox(height: 8),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        value: _writeOffEnabled,
                        title: const Text('Write off remaining balance'),
                        onChanged: (v) => setState(() => _writeOffEnabled = v ?? false),
                      ),
                      if (_writeOffEnabled)
                        TextFormField(
                          controller: _writeOffCtrl,
                          decoration: const InputDecoration(labelText: 'Write-off amount'),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
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
        ],
      ),
    );
  }
}

final _cashLedgerProvider = StreamProvider<LedgerTableData?>((ref) {
  final repo = ref.watch(ledgerRepositoryProvider);
  return repo
      .watchLedgers(accountType: 'Cash')
      .map((rows) => rows.where((r) => r.accountName == SystemAccounts.cash).firstOrNull);
});

class _CashBalanceCard extends StatelessWidget {
  const _CashBalanceCard({required this.ledger});
  final LedgerTableData? ledger;

  @override
  Widget build(BuildContext context) {
    final balance = ledger?.currentBalance ?? 0;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColors.success,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Current Cash Balance', style: TextStyle(color: AppColors.textMuted)),
                Text(
                  MoneyFormat.withDrCr(balance),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
