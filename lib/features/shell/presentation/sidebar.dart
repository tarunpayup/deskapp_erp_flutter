import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import 'nav_items.dart';

/// Permanent sidebar for 7–10" tablets, reproducing the legacy dark-navy
/// left-side-bar (#0b132b) with expandable groups (Accounts, Transactions,
/// Trader, Dealings, Payroll under Office; Final Product, Process, Karigar
/// under Factory; etc.) — see nav_items.dart / documents/map.md.
class Sidebar extends StatefulWidget {
  const Sidebar({super.key, required this.currentRoute});
  final String currentRoute;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final Set<String> _expanded = {'Home'};

  @override
  void initState() {
    super.initState();
    _expandGroupContaining(widget.currentRoute);
  }

  @override
  void didUpdateWidget(covariant Sidebar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentRoute != widget.currentRoute) {
      _expandGroupContaining(widget.currentRoute);
    }
  }

  void _expandGroupContaining(String route) {
    for (final section in navTree) {
      for (final group in section.groups) {
        if (group.children.any((l) => l.route == route)) {
          _expanded.add(group.label);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: AppColors.sidebarBg,
      child: Column(
        children: [
          const _SidebarHeader(),
          const Divider(color: Colors.white12, height: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                for (final section in navTree) ...[
                  if (section.label.isNotEmpty) _SectionCap(section.label),
                  for (final group in section.groups)
                    _GroupTile(
                      group: group,
                      expanded: _expanded.contains(group.label),
                      currentRoute: widget.currentRoute,
                      onToggle: () => setState(() {
                        if (_expanded.contains(group.label)) {
                          _expanded.remove(group.label);
                        } else {
                          _expanded.add(group.label);
                        }
                      }),
                    ),
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarHeader extends StatelessWidget {
  const _SidebarHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'DeskApp',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCap extends StatelessWidget {
  const _SectionCap(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white54,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

class _GroupTile extends StatelessWidget {
  const _GroupTile({
    required this.group,
    required this.expanded,
    required this.currentRoute,
    required this.onToggle,
  });

  final NavGroup group;
  final bool expanded;
  final String currentRoute;
  final VoidCallback onToggle;

  bool get _containsCurrent =>
      group.children.any((l) => l.route == currentRoute);

  @override
  Widget build(BuildContext context) {
    final isSingleLeaf = group.children.length == 1;

    if (isSingleLeaf) {
      final leaf = group.children.first;
      return _LeafTile(
        label: group.label,
        icon: group.icon,
        route: leaf.route,
        active: currentRoute == leaf.route,
        indent: false,
      );
    }

    return Column(
      children: [
        InkWell(
          onTap: onToggle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Icon(
                  group.icon,
                  size: 20,
                  color: _containsCurrent ? Colors.white : Colors.white70,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    group.label,
                    style: TextStyle(
                      color: _containsCurrent ? Colors.white : Colors.white70,
                      fontWeight: _containsCurrent
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  expanded ? Icons.expand_less : Icons.expand_more,
                  size: 18,
                  color: Colors.white54,
                ),
              ],
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: const SizedBox(width: double.infinity),
          secondChild: Column(
            children: [
              for (final leaf in group.children)
                _LeafTile(
                  label: leaf.label,
                  route: leaf.route,
                  active: currentRoute == leaf.route,
                  indent: true,
                ),
            ],
          ),
          crossFadeState: expanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 150),
        ),
      ],
    );
  }
}

class _LeafTile extends StatelessWidget {
  const _LeafTile({
    required this.label,
    required this.route,
    required this.active,
    required this.indent,
    this.icon,
  });

  final String label;
  final String route;
  final bool active;
  final bool indent;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: active ? Colors.black.withValues(alpha: 0.35) : Colors.transparent,
      child: InkWell(
        onTap: () => context.go(route),
        child: Padding(
          padding: EdgeInsets.fromLTRB(indent ? 54 : 20, 11, 20, 11),
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20, color: active ? Colors.white : Colors.white70),
                const SizedBox(width: 14),
              ],
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: active ? Colors.white : Colors.white70,
                    fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                    fontSize: 13.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
