import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/auth_controller.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/ledger/presentation/bank_screen.dart';
import '../../features/ledger/presentation/cash_screen.dart';
import '../../features/ledger/presentation/daybook_screen.dart';
import '../../features/ledger/presentation/journal_screen.dart';
import '../../features/ledger/presentation/ledger_form_screen.dart';
import '../../features/ledger/presentation/manage_ledger_screen.dart';
import '../../features/ledger/presentation/opening_balance_screen.dart';
import '../../features/karigar/presentation/job_work_form_screen.dart';
import '../../features/karigar/presentation/job_work_management_screen.dart';
import '../../features/karigar/presentation/karigar_form_screen.dart';
import '../../features/karigar/presentation/karigar_list_screen.dart';
import '../../features/karigar/presentation/karigar_product_screen.dart';
import '../../features/karigar/presentation/karigar_rate_card_screen.dart';
import '../../features/karigar/presentation/karigar_statement_screen.dart';
import '../../features/karigar/presentation/remarks_report_screen.dart';
import '../../features/karigar/presentation/work_type_screen.dart';
import '../../features/ledger/presentation/transaction_report_screen.dart';
import '../../features/ledger/presentation/trial_balance_screen.dart';
import '../../features/payroll/presentation/attendance_report_screen.dart';
import '../../features/payroll/presentation/attendance_screen.dart';
import '../../features/payroll/presentation/employee_form_screen.dart';
import '../../features/payroll/presentation/employee_list_screen.dart';
import '../../features/payroll/presentation/payroll_screen.dart';
import '../../features/shell/presentation/app_shell.dart';
import '../../features/shell/presentation/nav_items.dart';
import '../../features/trade/domain/trade_models.dart';
import '../../features/trade/presentation/party_balance_report_screen.dart';
import '../../features/trade/presentation/party_rates_screen.dart';
import '../../features/trade/presentation/procurement_screen.dart';
import '../../features/trade/presentation/product_screen.dart';
import '../../features/trade/presentation/sales_screen.dart';
import '../../features/trade/presentation/trader_form_screen.dart';
import '../../features/trade/presentation/trader_list_screen.dart';
import '../widgets/coming_soon_screen.dart';
import '../widgets/splash_screen.dart';
import 'router_refresh_notifier.dart';

/// Screens built so far, keyed by their nav route — see nav_items.dart for
/// the full IA. Anything not listed here falls back to ComingSoonScreen
/// until that module is implemented (documents/map.md, built module by
/// module).
final Map<String, WidgetBuilder> _builtScreens = {
  '/home': (context) => const HomeScreen(),
  '/office/ledger/add': (context) => const LedgerFormScreen(),
  '/office/ledger/manage': (context) => const ManageLedgerScreen(),
  '/office/opening-balance': (context) => const OpeningBalanceScreen(),
  '/office/cash': (context) => const CashScreen(),
  '/office/bank': (context) => const BankScreen(),
  '/office/journal': (context) => const JournalScreen(),
  '/reports/trial-balance': (context) => const TrialBalanceScreen(),
  '/reports/daybook': (context) => const DaybookScreen(),
  '/office/customers/add': (context) =>
      const TraderFormScreen(type: TraderType.customer),
  '/office/customers': (context) => const TraderListScreen(
    type: TraderType.customer,
    addRoute: '/office/customers/add',
  ),
  '/office/vendors/add': (context) => const TraderFormScreen(type: TraderType.vendor),
  '/office/vendors': (context) => const TraderListScreen(
    type: TraderType.vendor,
    addRoute: '/office/vendors/add',
  ),
  '/office/products/add': (context) => const ProductScreen(),
  '/office/products': (context) => const ProductScreen(),
  '/office/party-rates': (context) => const PartyRatesScreen(),
  '/office/sales': (context) => const SalesScreen(),
  '/office/invoices': (context) => const SalesScreen(),
  '/office/procurement': (context) => const ProcurementScreen(),
  '/office/bill': (context) => const ProcurementScreen(),
  '/office/employees/add': (context) => const EmployeeFormScreen(),
  '/office/employees': (context) => const EmployeeListScreen(),
  '/office/attendance': (context) => const AttendanceScreen(),
  '/office/payroll': (context) => const PayrollScreen(),
  '/reports/attendance': (context) => const AttendanceReportScreen(),
  '/factory/products/add': (context) => const KarigarProductScreen(),
  '/factory/products': (context) => const KarigarProductScreen(),
  '/factory/process/add': (context) => const WorkTypeScreen(),
  '/factory/process': (context) => const WorkTypeScreen(),
  '/factory/karigar/add': (context) => const KarigarFormScreen(),
  '/factory/karigar': (context) => const KarigarListScreen(),
  '/factory/karigar/rates': (context) => const KarigarRateCardScreen(),
  '/factory/karigar/job-work': (context) => const JobWorkFormScreen(),
  '/factory/karigar/job-management': (context) => const JobWorkManagementScreen(),
  '/factory/karigar/report': (context) => const RemarksReportScreen(),
  '/factory/karigar/full-report': (context) => const KarigarStatementScreen(),
  '/reports/customers': (context) => const PartyBalanceReportScreen(type: TraderType.customer),
  '/reports/vendors': (context) => const PartyBalanceReportScreen(type: TraderType.vendor),
  '/reports/transactions': (context) => const TransactionReportScreen(),
};

/// App-wide router with auth-gated redirects (mirrors index.php's
/// is_authenticated() guard, documents/map.md Module 1) and the full nav
/// tree wired from nav_items.dart — unbuilt modules resolve to
/// ComingSoonScreen until that module is implemented.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: RouterRefreshNotifier(ref, authControllerProvider),
    redirect: (context, state) {
      final authState = ref.read(authControllerProvider);
      final loc = state.matchedLocation;

      if (authState is AuthLoading) {
        return loc == '/splash' ? null : '/splash';
      }

      final loggedIn = authState is AuthAuthenticated;
      if (loc == '/splash') {
        return loggedIn ? '/home' : '/login';
      }
      if (!loggedIn && loc != '/login') return '/login';
      if (loggedIn && loc == '/login') return '/home';
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      ShellRoute(
        builder: (context, state, child) =>
            AppShell(currentRoute: state.matchedLocation, child: child),
        routes: [
          for (final leaf in navLeavesByRoute.values)
            GoRoute(
              path: leaf.route,
              builder: (context, state) =>
                  _builtScreens[leaf.route]?.call(context) ??
                  ComingSoonScreen(title: leaf.label),
            ),
          // Drill-in routes not in the sidebar nav tree.
          GoRoute(
            path: '/office/ledger/edit/:lid',
            builder: (context, state) => LedgerFormScreen(
              lid: int.parse(state.pathParameters['lid']!),
            ),
          ),
          GoRoute(
            path: '/office/customers/edit/:id',
            builder: (context, state) => TraderFormScreen(
              type: TraderType.customer,
              traderId: int.parse(state.pathParameters['id']!),
            ),
          ),
          GoRoute(
            path: '/office/vendors/edit/:id',
            builder: (context, state) => TraderFormScreen(
              type: TraderType.vendor,
              traderId: int.parse(state.pathParameters['id']!),
            ),
          ),
          GoRoute(
            path: '/office/employees/edit/:id',
            builder: (context, state) => EmployeeFormScreen(
              employeeId: int.parse(state.pathParameters['id']!),
            ),
          ),
          GoRoute(
            path: '/factory/karigar/edit/:id',
            builder: (context, state) => KarigarFormScreen(
              karigarId: int.parse(state.pathParameters['id']!),
            ),
          ),
        ],
      ),
    ],
  );
});
