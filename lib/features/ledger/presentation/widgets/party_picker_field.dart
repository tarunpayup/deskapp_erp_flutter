import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/app_providers.dart';
import '../../../../data/db/app_database.dart';

/// Party (ledger account) autocomplete — legacy `search_party`/`query`
/// AJAX endpoints (function.php, documents/map.md Module 4), used by Cash
/// and Bank voucher entry to pick the transaction counterparty.
class PartyPickerField extends ConsumerStatefulWidget {
  const PartyPickerField({
    super.key,
    required this.onSelected,
    this.label = 'Party',
    this.types = const ['Sundry Debtor', 'Sundry Creditor', 'Bank'],
  });

  final ValueChanged<LedgerTableData> onSelected;
  final String label;
  final List<String> types;

  @override
  ConsumerState<PartyPickerField> createState() => _PartyPickerFieldState();
}

class _PartyPickerFieldState extends ConsumerState<PartyPickerField> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<LedgerTableData>(
      displayStringForOption: (l) => l.accountName,
      optionsBuilder: (value) async {
        if (value.text.trim().isEmpty) return const [];
        return ref
            .read(ledgerRepositoryProvider)
            .searchParties(value.text.trim(), types: widget.types);
      },
      onSelected: widget.onSelected,
      fieldViewBuilder: (context, controller, focusNode, onSubmit) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: widget.label,
            prefixIcon: const Icon(Icons.person_search_outlined),
          ),
          validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Required' : null,
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420, maxHeight: 280),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, i) {
                  final o = options.elementAt(i);
                  return ListTile(
                    dense: true,
                    title: Text(o.accountName),
                    subtitle: Text(o.accountType),
                    onTap: () => onSelected(o),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
