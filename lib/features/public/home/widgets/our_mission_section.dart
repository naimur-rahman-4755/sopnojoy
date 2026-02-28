import 'package:flutter/material.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';

class OurMissionSection extends StatelessWidget {
  const OurMissionSection({super.key});

  static const double _desktopBreakpoint = 900;

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
          child: Column(
            children: const [
              _SectionHeader(),
              SizedBox(height: AppSpacing.xl),
              _MissionCards(),
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
          'Our Mission',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.headingText,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          'To empower underprivileged communities by ensuring access to basic human needs — poverty reduction, food security, health, and social justice — fostering peace and resilience for a sustainable future.',
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

class _MissionCards extends StatelessWidget {
  const _MissionCards();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        if (isDesktop) {
          return IntrinsicHeight( // ✅ Makes all cards equal height
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.stretch, // ✅ Stretch to tallest
              children:  [
                Expanded(child: _MissionCard.poverty()),
                SizedBox(width: AppSpacing.lg),
                Expanded(child: _MissionCard.hunger()),
                SizedBox(width: AppSpacing.lg),
                Expanded(child: _MissionCard.health()),
              ],
            ),
          );
        }

        return Column(
          children: [
            _MissionCard.poverty(),
            SizedBox(height: AppSpacing.lg),
            _MissionCard.hunger(),
            SizedBox(height: AppSpacing.lg),
            _MissionCard.health(),
          ],
        );
      },
    );
  }
}


class _MissionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final List<String> points;

  const _MissionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.points,
  });

  factory _MissionCard.poverty() {
    return const _MissionCard(
      icon: Icons.favorite_border,
      iconColor: Colors.blue,
      title: 'No Poverty',
      subtitle: 'Empowering communities through sustainable programs',
      points: [
        'Skill training programs',
        'Financial support initiatives',
        'Community empowerment workshops',
      ],
    );
  }

  factory _MissionCard.hunger() {
    return const _MissionCard(
      icon: Icons.restaurant,
      iconColor: Colors.green,
      title: 'Zero Hunger',
      subtitle: 'Ensuring no one goes to bed hungry',
      points: [
        'Food distribution drives',
        'Nutrition awareness programs',
        'Meal support for vulnerable communities',
      ],
    );
  }

  factory _MissionCard.health() {
    return const _MissionCard(
      icon: Icons.health_and_safety_outlined,
      iconColor: Colors.orange,
      title: 'Good Health & Well-being',
      subtitle: 'Promoting health and wellness for all',
      points: [
        'Health awareness campaigns',
        'Hygiene promotion programs',
        'Medical camp initiatives',
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 42, color: iconColor),
          const SizedBox(height: AppSpacing.md),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.headingText,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.bodyText,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          ...points.map(
                (point) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: AppColors.primaryBlue,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      point,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.bodyText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

