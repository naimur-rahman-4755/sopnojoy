import 'package:flutter/material.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';

class ImpactQuoteSection extends StatelessWidget {
  const ImpactQuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.lg,
            ),
            decoration: BoxDecoration(
              color: AppColors.sectionBg, // soft, calm background
              borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            ),
            child: Column(
              children: [
                Text(
                  '“Every day, we witness the power of compassion and community. '
                      'Together, we’re not just helping people — we’re giving them hope '
                      'for a brighter tomorrow.”',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    height: 1.7,
                    color: AppColors.bodyText,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  '— The Shopno Joy Team',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.headingText,
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
