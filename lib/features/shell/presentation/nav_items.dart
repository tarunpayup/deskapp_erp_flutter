import 'package:flutter/material.dart';

/// Single source of truth for the app's navigation tree — transcribed
/// directly from the legacy `menu.php` (documents/map.md Executive Summary
/// "Recommended Flutter navigation"). Each leaf's `route` is a path under
/// the shell's `/app` branch; screens not yet built fall back to the
/// ComingSoonScreen (see app_router.dart) keyed by their route.
class NavLeaf {
  const NavLeaf(this.label, this.route, {this.icon});
  final String label;
  final String route;
  final IconData? icon;
}

class NavGroup {
  const NavGroup(this.label, this.icon, this.children);
  final String label;
  final IconData icon;
  final List<NavLeaf> children;
}

class NavSection {
  const NavSection(this.label, this.groups);
  final String label;
  final List<NavGroup> groups;
}

const navTree = <NavSection>[
  NavSection('', [
    NavGroup('Home', Icons.home_outlined, [NavLeaf('Dashboard', '/home')]),
  ]),
  NavSection('OFFICE', [
    NavGroup('Accounts', Icons.account_balance_outlined, [
      NavLeaf('Add Ledger', '/office/ledger/add'),
      NavLeaf('Manage Ledger', '/office/ledger/manage'),
      NavLeaf('Opening Balance', '/office/opening-balance'),
    ]),
    NavGroup('Transactions', Icons.sync_alt, [
      NavLeaf('Cash', '/office/cash'),
      NavLeaf('Bank', '/office/bank'),
      NavLeaf('Journal', '/office/journal'),
    ]),
    NavGroup('Trader', Icons.handshake_outlined, [
      NavLeaf('Add Customer', '/office/customers/add'),
      NavLeaf('View Customers', '/office/customers'),
      NavLeaf('Add Vendor', '/office/vendors/add'),
      NavLeaf('View Vendors', '/office/vendors'),
      NavLeaf('Add Product', '/office/products/add'),
      NavLeaf('View Products', '/office/products'),
      NavLeaf('Party Rates', '/office/party-rates'),
    ]),
    NavGroup('Dealings', Icons.receipt_long_outlined, [
      NavLeaf('Sales', '/office/sales'),
      NavLeaf('Procurement', '/office/procurement'),
      NavLeaf('Invoices', '/office/invoices'),
      NavLeaf('Bill', '/office/bill'),
    ]),
    NavGroup('Payroll', Icons.badge_outlined, [
      NavLeaf('Add Employee', '/office/employees/add'),
      NavLeaf('Manage Employee', '/office/employees'),
      NavLeaf('Attendance', '/office/attendance'),
      NavLeaf('Payroll', '/office/payroll'),
    ]),
  ]),
  NavSection('FACTORY', [
    NavGroup('Final Product', Icons.inventory_2_outlined, [
      NavLeaf('Add Product', '/factory/products/add'),
      NavLeaf('Manage Product', '/factory/products'),
    ]),
    NavGroup('Process', Icons.precision_manufacturing_outlined, [
      NavLeaf('Add Process', '/factory/process/add'),
      NavLeaf('Manage Process', '/factory/process'),
    ]),
    NavGroup('Karigar', Icons.engineering_outlined, [
      NavLeaf('Add Karigar', '/factory/karigar/add'),
      NavLeaf('Manage Karigar', '/factory/karigar'),
      NavLeaf('Set Job Rates', '/factory/karigar/rates'),
      NavLeaf('Job Work', '/factory/karigar/job-work'),
      NavLeaf('Job Management', '/factory/karigar/job-management'),
      NavLeaf('Karigar Report', '/factory/karigar/report'),
      NavLeaf('Full Report', '/factory/karigar/full-report'),
    ]),
  ]),
  NavSection('REPORTS', [
    NavGroup('Office Reports', Icons.summarize_outlined, [
      NavLeaf('Day Book', '/reports/daybook'),
      NavLeaf('Customer Report', '/reports/customers'),
      NavLeaf('Vendor Report', '/reports/vendors'),
      NavLeaf('Transaction Report', '/reports/transactions'),
      NavLeaf('Attendance Report', '/reports/attendance'),
      NavLeaf('Trial Balance', '/reports/trial-balance'),
    ]),
    NavGroup('Factory Reports', Icons.assessment_outlined, [
      NavLeaf('Karigar Full Report', '/factory/karigar/full-report'),
    ]),
  ]),
];

/// Flat lookup of every leaf, used by the router to generate routes and by
/// the AppBar to resolve the current screen's title.
final navLeavesByRoute = {
  for (final section in navTree)
    for (final group in section.groups)
      for (final leaf in group.children) leaf.route: leaf,
};
