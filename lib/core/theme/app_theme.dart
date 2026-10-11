import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

/// Plays the platform click sound whenever a button/InkWell-based widget
/// is tapped, by hooking the shared Material splash factory (set as
/// `ThemeData.splashFactory` below) instead of touching every button call
/// site individually — there's no custom button widget in this app, so
/// this is the one place that reaches all of them.
class _ClickSoundInkSplashFactory extends InteractiveInkFeatureFactory {
  const _ClickSoundInkSplashFactory();

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    SystemSound.play(SystemSoundType.click);
    return InkRipple.splashFactory.create(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      textDirection: textDirection,
      containedInkWell: containedInkWell,
      rectCallback: rectCallback,
      borderRadius: borderRadius,
      customBorder: customBorder,
      radius: radius,
      onRemoved: onRemoved,
    );
  }
}

/// App-wide Material theme reproducing the legacy DeskApp admin theme's
/// look (heading color #202342, primary #1b00ff, light page background
/// #ecf0f4 — see documents/map.md and AppColors for sourcing), typeset in
/// Poppins. Only four static weights are bundled locally as assets (see
/// pubspec.yaml) rather than fetched at runtime (offline-first) — Thin
/// (100), Regular (400), SemiBold (600), Bold (700) — so every TextStyle
/// below must use one of exactly those four FontWeights.
abstract class AppTheme {
  static const _fontFamily = 'Poppins';

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.sidebarBg,
        error: AppColors.danger,
        surface: AppColors.surface,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: AppColors.pageBg,
      fontFamily: _fontFamily,
      splashFactory: const _ClickSoundInkSplashFactory(),
    );

    final textTheme = base.textTheme.apply(fontFamily: _fontFamily).copyWith(
      headlineLarge: const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        color: AppColors.heading,
      ),
      headlineMedium: const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        color: AppColors.heading,
      ),
      titleLarge: const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        color: AppColors.heading,
      ),
      titleMedium: const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w600,
        color: AppColors.heading,
      ),
      bodyLarge: const TextStyle(
        fontFamily: _fontFamily,
        color: AppColors.textPrimary,
      ),
      bodyMedium: const TextStyle(
        fontFamily: _fontFamily,
        color: AppColors.textPrimary,
      ),
      labelLarge: const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w600,
      ),
    );

    return base.copyWith(
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.heading,
        elevation: 0.5,
        shadowColor: AppColors.divider,
        titleTextStyle: const TextStyle(
          fontFamily: _fontFamily,
          color: AppColors.heading,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(color: AppColors.heading),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.danger),
        ),
        labelStyle: const TextStyle(color: AppColors.textMuted),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppColors.sidebarBg,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(
          color: Colors.white.withValues(alpha: 0.6),
        ),
        selectedLabelTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
