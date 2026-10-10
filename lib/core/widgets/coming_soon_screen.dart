import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Placeholder for modules not yet built — the nav tree is wired up in full
/// from day one (per map.md's menu.php-derived IA) so the app's structure
/// is visible immediately; screens are filled in module by module.
class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.construction_outlined,
            size: 56,
            color: AppColors.textMuted,
          ),
          const SizedBox(height: 16),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          const Text(
            'This module hasn\'t been built yet.',
            style: TextStyle(color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
