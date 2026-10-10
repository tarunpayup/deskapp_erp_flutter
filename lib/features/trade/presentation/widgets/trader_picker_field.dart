import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/app_providers.dart';
import '../../../../data/db/app_database.dart';
import '../../domain/trade_models.dart';

/// Customer/Vendor autocomplete picker — same pattern as the Ledger
/// module's PartyPickerField, scoped to one [TraderType].
class TraderPickerField extends ConsumerWidget {
  const TraderPickerField({
    super.key,
    required this.type,
    required this.onSelected,
    this.label,
  });

  final TraderType type;
  final ValueChanged<TradersTableData> onSelected;
  final String? label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Autocomplete<TradersTableData>(
      displayStringForOption: (t) => t.traderName,
      optionsBuilder: (value) async {
        if (value.text.trim().isEmpty) return const [];
        return ref.read(tradeRepositoryProvider).searchTraders(value.text.trim(), type: type);
      },
      onSelected: onSelected,
      fieldViewBuilder: (context, controller, focusNode, onSubmit) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: label ?? '${type.label} *',
            prefixIcon: const Icon(Icons.person_search_outlined),
          ),
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
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
                    title: Text(o.traderName),
                    subtitle: Text(o.traderCode),
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
