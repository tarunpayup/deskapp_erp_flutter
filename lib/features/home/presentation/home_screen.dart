import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/money_format.dart';
import '../../auth/presentation/auth_controller.dart';
import '../../trade/domain/trade_models.dart';

/// Home dashboard — replaces the legacy body.php (which was mostly
/// hardcoded dummy KPI cards — only the Vendors count was real,
/// documents/map.md Module 1). KPI cards are now wired to the real
/// repositories built for each module.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(authControllerProvider);
    final fullName = session is AuthAuthenticated ? session.session.fullName : '';

    final customersAsync = ref.watch(_customerCountProvider);
    final vendorsAsync = ref.watch(_vendorCountProvider);
    final cashAsync = ref.watch(_cashBalanceProvider);
    final jobWorkAsync = ref.watch(_activeJobWorkCountProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back${fullName.isNotEmpty ? ', $fullName' : ''}!',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 4),
          const Text(
            'Here\'s what\'s happening across Office and Factory today.',
            style: TextStyle(color: AppColors.textMuted),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 900 ? 4 : 2;
              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.7,
                children: [
                  _KpiCard(
                    label: 'Customers',
                    icon: Icons.people_outline,
                    color: AppColors.primary,
                    value: customersAsync.when(
                      data: (v) => '$v',
                      loading: () => '—',
                      error: (_, __) => '—',
                    ),
                    onTap: () => context.go('/office/customers'),
                  ),
                  _KpiCard(
                    label: 'Vendors',
                    icon: Icons.local_shipping_outlined,
                    color: AppColors.info,
                    value: vendorsAsync.when(
                      data: (v) => '$v',
                      loading: () => '—',
                      error: (_, __) => '—',
                    ),
                    onTap: () => context.go('/office/vendors'),
                  ),
                  _KpiCard(
                    label: 'Cash Balance',
                    icon: Icons.account_balance_wallet_outlined,
                    color: AppColors.success,
                    value: cashAsync.when(
                      data: (v) => MoneyFormat.plain(v),
                      loading: () => '—',
                      error: (_, __) => '—',
                    ),
                    onTap: () => context.go('/office/cash'),
                  ),
                  _KpiCard(
                    label: 'Active Job Work',
                    icon: Icons.engineering_outlined,
                    color: AppColors.warning,
                    value: jobWorkAsync.when(
                      data: (v) => '$v',
                      loading: () => '—',
                      error: (_, __) => '—',
                    ),
                    onTap: () => context.go('/factory/karigar/job-management'),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 32),
          Text('Quick links', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _QuickLinkChip(label: 'Add Sale', route: '/office/sales'),
              _QuickLinkChip(label: 'Add Procurement', route: '/office/procurement'),
              _QuickLinkChip(label: 'Mark Attendance', route: '/office/attendance'),
              _QuickLinkChip(label: 'Job Work', route: '/factory/karigar/job-work'),
            ],
          ),
        ],
      ),
    );
  }
}

final _customerCountProvider = StreamProvider<int>((ref) {
  return ref
      .watch(tradeRepositoryProvider)
      .watchTraders(type: TraderType.customer, status: 'Active')
      .map((list) => list.length);
});

final _vendorCountProvider = StreamProvider<int>((ref) {
  return ref
      .watch(tradeRepositoryProvider)
      .watchTraders(type: TraderType.vendor, status: 'Active')
      .map((list) => list.length);
});

final _cashBalanceProvider = StreamProvider<double>((ref) {
  return ref
      .watch(ledgerRepositoryProvider)
      .watchLedgers(accountType: 'Cash')
      .map((list) => list.fold<double>(0, (s, l) => s + l.currentBalance));
});

final _activeJobWorkCountProvider = StreamProvider<int>((ref) {
  return ref
      .watch(karigarRepositoryProvider)
      .watchJobWork(status: 'Open')
      .map((list) => list.length);
});

class _KpiCard extends StatelessWidget {
  const _KpiCard({
    required this.label,
    required this.icon,
    required this.color,
    required this.value,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final Color color;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 22),
              ),
              const Spacer(),
              Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
              Text(label, style: const TextStyle(color: AppColors.textMuted)),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickLinkChip extends StatelessWidget {
  const _QuickLinkChip({required this.label, required this.route});
  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      avatar: const Icon(Icons.arrow_forward, size: 16),
      onPressed: () => context.go(route),
    );
  }
}
