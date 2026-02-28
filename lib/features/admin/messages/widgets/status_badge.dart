import 'package:flutter/material.dart';

import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';

class StatusBadge extends StatelessWidget {
  final String status;
  const StatusBadge({super.key, required this.status});

  Color get _color {
    switch (status) {
      case 'new':
        return AppColors.warning;
      case 'replied':
        return AppColors.primaryBlue;
      case 'closed':
        return AppColors.success;
      default:
        return AppColors.border;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.1),
        borderRadius:
        BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Text(
        status.toUpperCase(),
        style: AppTextStyles.bodySmall.copyWith(
          color: _color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}