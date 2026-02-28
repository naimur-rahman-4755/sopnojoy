import 'package:flutter/material.dart';
import 'package:sopnojoy/features/admin/dashboard/widgets/state_model.dart';
import '../../../../../core/constacts/color.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../../core/constacts/text_style.dart';

class ImpactStatCard extends StatefulWidget {
  final DashboardStat stat;

  const ImpactStatCard({
    super.key,
    required this.stat,
  });

  @override
  State<ImpactStatCard> createState() => _ImpactStatCardState();
}

class _ImpactStatCardState extends State<ImpactStatCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Color growthColor = widget.stat.isPositive
        ? AppColors.success
        : AppColors.error;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? (Matrix4.identity()..scale(1.02))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          color: AppColors.cardBg.withOpacity(.85),
          border: Border.all(
            color: AppColors.border.withOpacity(.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? .12 : .06),
              blurRadius: _isHovered ? 25 : 12,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Top Row → Icon + Growth
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(.08),
                  ),
                  child: Icon(
                    widget.stat.icon,
                    color: AppColors.primary,
                    size: 22,
                  ),
                ),
                if (widget.stat.growthPercent != null)
                  Row(
                    children: [
                      Icon(
                        widget.stat.isPositive
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        size: 16,
                        color: growthColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${widget.stat.growthPercent!.toStringAsFixed(1)}%",
                        style: AppTextStyles.body.copyWith(
                          color: growthColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
              ],
            ),

            const Spacer(),

            /// Animated Value (Ready for Supabase updates)
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              child: Text(
                widget.stat.value,
                key: ValueKey(widget.stat.value),
                style: AppTextStyles.h2,
              ),
            ),

            const SizedBox(height: AppSpacing.xs),

            Text(
              widget.stat.title,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.bodyText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}