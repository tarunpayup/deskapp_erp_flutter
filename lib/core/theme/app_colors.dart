import 'package:flutter/material.dart';

/// Color palette reverse-engineered from the legacy DeskApp Bootstrap admin
/// theme (`vendors/styles/core.css`, `vendors/styles/style.css`) so the
/// Flutter app reproduces the same look. See documents/map.md Executive
/// Summary for the "match legacy theme closely" decision.
abstract class AppColors {
  // Brand / primary — legacy --primary / --blue (#1b00ff), used for the
  // preloader bar, active sidebar accents, and primary buttons.
  static const Color primary = Color(0xFF1B00FF);
  static const Color primaryDark = Color(0xFF1502BD);

  // Sidebar — legacy .left-side-bar default background.
  static const Color sidebarBg = Color(0xFF0B132B);
  static const Color sidebarBgLight = Color(0xFF0E132B);

  // Page / surface background — legacy `body { background:#ecf0f4 }`.
  static const Color pageBg = Color(0xFFECF0F4);
  static const Color surface = Colors.white;

  // Text — legacy body text / heading colors.
  static const Color textPrimary = Color(0xFF031E23);
  static const Color heading = Color(0xFF202342);
  static const Color textMuted = Color(0xFF6C757D);

  // Bootstrap semantic palette (used throughout the legacy app for badges,
  // alerts, status pills — e.g. Active/Not Active, payment status).
  static const Color success = Color(0xFF28A745);
  static const Color warning = Color(0xFFFFC107);
  static const Color danger = Color(0xFFDC3545);
  static const Color info = Color(0xFF17A2B8);
  static const Color secondary = Color(0xFF6C757D);

  // Sales/Procurement payment-status row tints (from o-tr-bill.php /
  // o-tr-invoices.php — Pending/Partial/Cleared row backgrounds).
  static const Color statusPendingBg = Color(0xFFFFE2E8);
  static const Color statusPartialBg = Color(0xFFFFFDE9);
  static const Color statusClearedBg = Color(0xFFDFF6DF);

  // Accounting Dr/Cr semantic colors (positive=Dr, negative=Cr convention,
  // see map.md Module 4 rule #1).
  static const Color debit = Color(0xFF28A745); // green, money owed to us
  static const Color credit = Color(0xFFDC3545); // red, money we owe

  static const Color divider = Color(0xFFE5E7EB);
  static const Color border = Color(0xFFDDE2E8);
}
