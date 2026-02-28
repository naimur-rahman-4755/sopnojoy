import 'package:flutter/material.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';

class AboutHeroSection extends StatelessWidget {
  const AboutHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxl * 1.4,
        horizontal: AppSpacing.md,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE9F2FB),
            Color(0xFFF3FBF6),
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 850,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Main Title
              Text(
                'About Shopno Joy',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  color: AppColors.headingText,
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              // Decorative Divider
              Container(
                width: 70,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // Quote Icon
              Icon(
                Icons.format_quote,
                size: 40,
                color: AppColors.primaryBlue.withOpacity(0.4),
              ),

              const SizedBox(height: AppSpacing.sm),

              // Quote Text
              Text(
                'Hope is being able to see that there is light despite all of the darkness.',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 18,
                  height: 1.8,
                  fontStyle: FontStyle.italic,
                  color: AppColors.bodyText,
                ),
              ),

              const SizedBox(height: AppSpacing.md),

              // Author
              Text(
                '— Desmond Tutu',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.headingText.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
