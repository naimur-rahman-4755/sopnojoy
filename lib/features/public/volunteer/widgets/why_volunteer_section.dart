import 'package:flutter/material.dart';

import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';

class WhyVolunteerSection extends StatelessWidget {
  const WhyVolunteerSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              Text('Why Volunteer with Shopno Joy?', style: AppTextStyles.h2),
              const SizedBox(height: AppSpacing.xl),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth >= 900;
                  return isDesktop
                      ? Row(
                    children: const [
                      Expanded(
                        child: _WhyCard(
                          icon: Icons.favorite_border,
                          title: 'Make a Real Difference',
                          description:
                          'Your time and skills directly impact lives and transform communities.',
                        ),
                      ),
                      SizedBox(width: AppSpacing.lg),
                      Expanded(
                        child: _WhyCard(
                          icon: Icons.groups_outlined,
                          title: 'Join a Community',
                          description:
                          'Connect with passionate, like-minded individuals dedicated to positive change.',
                        ),
                      ),
                      SizedBox(width: AppSpacing.lg),
                      Expanded(
                        child: _WhyCard(
                          icon: Icons.check_circle_outline,
                          title: 'Grow Personally',
                          description:
                          'Develop new skills, gain experience, and discover your potential.',
                        ),
                      ),
                    ],
                  )
                      : Column(
                    children: const [
                      _WhyCard(
                        icon: Icons.favorite_border,
                        title: 'Make a Real Difference',
                        description:
                        'Your time and skills directly impact lives and transform communities.',
                      ),
                      SizedBox(height: AppSpacing.lg),
                      _WhyCard(
                        icon: Icons.groups_outlined,
                        title: 'Join a Community',
                        description:
                        'Connect with passionate, like-minded individuals dedicated to positive change.',
                      ),
                      SizedBox(height: AppSpacing.lg),
                      _WhyCard(
                        icon: Icons.check_circle_outline,
                        title: 'Grow Personally',
                        description:
                        'Develop new skills, gain experience, and discover your potential.',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class _WhyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _WhyCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.sectionBg,
          child: Icon(icon, color: AppColors.primaryBlue, size: 26),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(title, style: AppTextStyles.h4, textAlign: TextAlign.center),
        const SizedBox(height: AppSpacing.sm),
        Text(
          description,
          textAlign: TextAlign.center,
          style: AppTextStyles.body,
        ),
      ],
    );
  }
}