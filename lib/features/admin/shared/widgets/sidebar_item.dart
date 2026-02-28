import 'package:flutter/material.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';

class SidebarItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String route;
  final bool isActive;
  final bool collapsed;
  final VoidCallback? onTap;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.route,
    required this.isActive,
    required this.collapsed,
    this.onTap,
  });

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final horizontalMargin =
    widget.collapsed ? AppSpacing.sm : AppSpacing.md;

    final horizontalPadding =
    widget.collapsed ? AppSpacing.sm : AppSpacing.md;

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: widget.isActive
              ? Colors.white.withOpacity(.18)
              : hovered
              ? Colors.white.withOpacity(.10)
              : Colors.transparent,
          borderRadius:
          BorderRadius.circular(AppSpacing.radiusMd),
        ),
        child: InkWell(
          borderRadius:
          BorderRadius.circular(AppSpacing.radiusMd),
          onTap: widget.onTap ??
                  () =>
                  Navigator.pushReplacementNamed(
                      context, widget.route),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: AppSpacing.md,
            ),
            child: widget.collapsed
                ? Center(
              child: Icon(
                widget.icon,
                color: AppColors.textOnDark,
              ),
            )
                : Row(
              children: [
                Icon(
                  widget.icon,
                  color: AppColors.textOnDark,
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    widget.label,
                    style: AppTextStyles.sidebarItem,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}