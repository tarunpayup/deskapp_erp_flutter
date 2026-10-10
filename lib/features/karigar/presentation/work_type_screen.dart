import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/db/app_database.dart';

/// Process (work type) management — legacy fo-tr-job-process.php /
/// fo-tr-manage-job-process.php (documents/map.md Module 3). Deletion is
/// blocked while any karigar references the process (rule #6).
class WorkTypeScreen extends ConsumerStatefulWidget {
  const WorkTypeScreen({super.key});

  @override
  ConsumerState<WorkTypeScreen> createState() => _WorkTypeScreenState();
}

class _WorkTypeScreenState extends ConsumerState<WorkTypeScreen> {
  final _nameCtrl = TextEditingController();
  int? _editingId;

  @override
  void dispose() {
    _nameCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _nameCtrl.text.trim();
    if (name.isEmpty) return;
    final repo = ref.read(karigarRepositoryProvider);
    if (_editingId != null) {
      await repo.updateWorkType(_editingId!, name);
    } else {
      await repo.addWorkType(name);
    }
    setState(() {
      _nameCtrl.clear();
      _editingId = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final workTypesAsync = ref.watch(_workTypesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Process', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _nameCtrl,
                decoration: InputDecoration(
                  labelText: _editingId != null ? 'Edit Process Name' : 'New Process Name',
                ),
                onSubmitted: (_) => _save(),
              ),
            ),
            const SizedBox(width: 12),
            FilledButton(onPressed: _save, child: Text(_editingId != null ? 'Save' : 'Add')),
            if (_editingId != null)
              TextButton(
                onPressed: () => setState(() {
                  _editingId = null;
                  _nameCtrl.clear();
                }),
                child: const Text('Cancel'),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            child: workTypesAsync.when(
              data: (types) {
                if (types.isEmpty) return const Center(child: Text('No processes yet'));
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: types.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final t = types[i];
                    return ListTile(
                      title: Text(t.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit_outlined),
                            onPressed: () => setState(() {
                              _editingId = t.id;
                              _nameCtrl.text = t.name;
                            }),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_outline),
                            color: AppColors.danger,
                            onPressed: () => _confirmDelete(context, t.id),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _confirmDelete(BuildContext context, int id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete process?'),
        content: const Text('This cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.danger),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    try {
      await ref.read(karigarRepositoryProvider).deleteWorkType(id);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }
}

final _workTypesProvider = StreamProvider<List<WorkTypesTableData>>((ref) {
  return ref.watch(karigarRepositoryProvider).watchWorkTypes();
});
