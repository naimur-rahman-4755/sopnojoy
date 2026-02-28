import 'package:flutter/material.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';

class ValuesSection extends StatelessWidget {
  const ValuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: Column(
            children: [
              const Text('Our Values', style: AppTextStyles.h2),
              const SizedBox(height: AppSpacing.xl),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isDesktop = constraints.maxWidth >= 900;

                  // ✅ Desktop Layout (Grid)
                  if (isDesktop) {
                    return GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      crossAxisSpacing: AppSpacing.lg,
                      mainAxisSpacing: AppSpacing.lg,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 0.85, // controls height nicely
                      children: const [
                        _ValueCard(
                          title: 'Compassion',
                          description:
                          'We lead with empathy and understanding, treating every person with dignity and respect.',
                          icon: Icons.favorite_border,
                        ),
                        _ValueCard(
                          title: 'Transparency',
                          description:
                          'We operate with complete openness, ensuring accountability in all our actions and programs.',
                          icon: Icons.visibility,
                        ),
                        _ValueCard(
                          title: 'Community',
                          description:
                          'We believe in the power of collective action and building strong, supportive communities.',
                          icon: Icons.groups,
                        ),
                        _ValueCard(
                          title: 'Sustainability',
                          description:
                          'We create lasting solutions that empower communities for the long term.',
                          icon: Icons.verified,
                        ),
                      ],
                    );
                  }

                  // ✅ Mobile Layout (Natural Height)
                  return const Column(
                    children: [
                      _ValueCard(
                        title: 'Compassion',
                        description:
                        'We lead with empathy and understanding, treating every person with dignity and respect.',
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(height: AppSpacing.lg),
                      _ValueCard(
                        title: 'Transparency',
                        description:
                        'We operate with complete openness, ensuring accountability in all our actions and programs.',
                        icon: Icons.visibility,
                      ),
                      SizedBox(height: AppSpacing.lg),
                      _ValueCard(
                        title: 'Community',
                        description:
                        'We believe in the power of collective action and building strong, supportive communities.',
                        icon: Icons.groups,
                      ),
                      SizedBox(height: AppSpacing.lg),
                      _ValueCard(
                        title: 'Sustainability',
                        description:
                        'We create lasting solutions that empower communities for the long term.',
                        icon: Icons.verified,
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

class _ValueCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _ValueCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // ✅ prevents extra height
        children: [
          Icon(icon, size: 40, color: AppColors.primaryBlue),
          const SizedBox(height: AppSpacing.md),
          Text(title, style: AppTextStyles.h4),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
