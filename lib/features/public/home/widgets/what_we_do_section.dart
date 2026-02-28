import 'package:flutter/material.dart';
import '../../../../core/constacts/assets.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';

class WhatWeDoSection extends StatelessWidget {
  const WhatWeDoSection({super.key});

  static const double _desktopBreakpoint = 900;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl * 1.5,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: Column(
            children: const [
              _SectionHeader(),
              SizedBox(height: AppSpacing.xl),
              _WhatWeDoCards(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'What We Do',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.headingText,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Our programs are designed to create immediate impact while building long-term solutions',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.bodyText,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

class _WhatWeDoCards extends StatelessWidget {
  const _WhatWeDoCards();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        if (isDesktop) {
          // Desktop: use Row + IntrinsicHeight + Expanded
          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:  [
                Expanded(child: _WhatWeDoCard.food()),
                SizedBox(width: AppSpacing.lg),
                Expanded(child: _WhatWeDoCard.health()),
                SizedBox(width: AppSpacing.lg),
                Expanded(child: _WhatWeDoCard.education()),
                SizedBox(width: AppSpacing.lg),
                Expanded(child: _WhatWeDoCard.emergency()),
              ],
            ),
          );
        }

        // Mobile / Tablet: use Column without Expanded
        return Column(
          children:  [
            _WhatWeDoCard.food(mobile: true),
            SizedBox(height: AppSpacing.lg),
            _WhatWeDoCard.health(mobile: true),
            SizedBox(height: AppSpacing.lg),
            _WhatWeDoCard.education(mobile: true),
            SizedBox(height: AppSpacing.lg),
            _WhatWeDoCard.emergency(mobile: true),
          ],
        );
      },
    );
  }
}

class _WhatWeDoCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final bool mobile; // ✅ new

  const _WhatWeDoCard({
    required this.image,
    required this.title,
    required this.description,
    this.mobile = false,
  });

  factory _WhatWeDoCard.food({bool mobile = false}) {
    return _WhatWeDoCard(
      image: AppAssets.new1,
      title: 'Food Drives',
      description: 'Regular distribution of nutritious meals to those in need',
      mobile: mobile,
    );
  }

  factory _WhatWeDoCard.health({bool mobile = false}) {
    return _WhatWeDoCard(
      image: AppAssets.new1,
      title: 'Health Camps',
      description: 'Free medical checkups and health awareness sessions',
      mobile: mobile,
    );
  }

  factory _WhatWeDoCard.education({bool mobile = false}) {
    return _WhatWeDoCard(
      image: AppAssets.new1,
      title: 'Education Support',
      description: 'Providing resources and mentorship for underprivileged students',
      mobile: mobile,
    );
  }

  factory _WhatWeDoCard.emergency({bool mobile = false}) {
    return _WhatWeDoCard(
      image: AppAssets.new1,
      title: 'Emergency Relief',
      description: 'Swift response during natural disasters and crises',
      mobile: mobile,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppSpacing.radiusLg),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // ✅ Only use Expanded for desktop
          mobile
              ? Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: _CardContent(title: title, description: description),
          )
              : Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: _CardContent(title: title, description: description),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final String title;
  final String description;

  const _CardContent({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.headingText,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.bodyText,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}