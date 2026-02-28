import 'package:flutter/material.dart';
import '../../../../../core/constacts/color.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../../core/constacts/text_style.dart';

class ProgramBlock extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String impact;
  final bool imageLeft;

  const ProgramBlock({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.impact,
    required this.imageLeft,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        final imageWidget = _ProgramImage(image: image);

        final contentWidget = _ProgramCardContent(
          title: title,
          description: description,
          impact: impact,
        );

        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
          child: ConstrainedBox(
            constraints:
            const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
            child: isDesktop
                ? Row(
              children: imageLeft
                  ? [
                Expanded(child: imageWidget),
                const SizedBox(width: AppSpacing.xl),
                Expanded(child: contentWidget),
              ]
                  : [
                Expanded(child: contentWidget),
                const SizedBox(width: AppSpacing.xl),
                Expanded(child: imageWidget),
              ],
            )
                : Column(
              children: [
                imageWidget,
                const SizedBox(height: AppSpacing.lg),
                contentWidget,
              ],
            ),
          ),
        );
      },
    );
  }
}


class _ProgramImage extends StatelessWidget {
  final String image;

  const _ProgramImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class _ProgramCardContent extends StatelessWidget {
  final String title;
  final String description;
  final String impact;

  const _ProgramCardContent({
    required this.title,
    required this.description,
    required this.impact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.h3),
          const SizedBox(height: AppSpacing.sm),
          Text(description, style: AppTextStyles.body),
          const SizedBox(height: AppSpacing.md),
          _ImpactTag(impact: impact),
        ],
      ),
    );
  }
}


class _ImpactTag extends StatelessWidget {
  final String impact;

  const _ImpactTag({required this.impact});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
      ),
      child: Text(
        'Impact: $impact',
        style: AppTextStyles.bodySmall?.copyWith(
          color: AppColors.primaryBlue,
        ),
      ),
    );
  }
}
