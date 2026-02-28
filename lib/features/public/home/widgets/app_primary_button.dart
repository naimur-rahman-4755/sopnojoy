

import 'package:flutter/material.dart';

import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';

class AppPrimaryButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onPressed;
  final bool fullWidth;

  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: AppColors.scaffoldBg,
          shape: const StadiumBorder(), // pill shape
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTextStyles.button,
            ),
            const SizedBox(width: AppSpacing.sm),
            Icon(
              icon,
              size: 18,
              color: AppColors.scaffoldBg,
            ),
          ],
        ),
      ),
    );
  }
}
