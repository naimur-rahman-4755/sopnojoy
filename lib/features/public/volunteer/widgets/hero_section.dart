import 'package:flutter/material.dart';

import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';

class HeroSection extends StatelessWidget {
  const HeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.sectionBg,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxl,
        horizontal: AppSpacing.md,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
          const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Column(
            children: [
              Text('Join Our Team', style: AppTextStyles.h1),
              const SizedBox(height: AppSpacing.md),
              Text(
                "Be part of a movement that's changing lives and building stronger communities",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
