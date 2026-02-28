import 'package:flutter/material.dart';
import '../../../../core/constacts/assets.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';

class OurTeamSection extends StatelessWidget {
  const OurTeamSection({super.key});

  static const double _desktopBreakpoint = 900;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl * 2,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: Column(
            children: const [
              _TeamHeader(),
              SizedBox(height: AppSpacing.xl),
              _TeamCards(),
            ],
          ),
        ),
      ),
    );
  }
}




class _TeamHeader extends StatelessWidget {
  const _TeamHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Our Team',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.headingText,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Dedicated volunteers working together to make a difference',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.bodyText,
          ),
        ),
      ],
    );
  }
}

class _TeamCards extends StatelessWidget {
  const _TeamCards();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        return isDesktop
            ?  Row(
          children: [
            Expanded(
              child: _TeamCard(
                image: AppAssets.new1,
                title: 'Community Leaders',
                subtitle: 'Making change happen every day',
              ),
            ),
            SizedBox(width: AppSpacing.lg),
            Expanded(
              child: _TeamCard(
                image: AppAssets.new1,
                title: 'Healthcare Volunteers',
                subtitle: 'Bringing hope through care',
              ),
            ),
            SizedBox(width: AppSpacing.lg),
            Expanded(
              child: _TeamCard(
                image: AppAssets.new1,
                title: 'Food Distribution Team',
                subtitle: 'Ending hunger one meal at a time',
              ),
            ),
          ],
        )
            :  Column(
          children: [
            _TeamCard(
              image: AppAssets.new1,
              title: 'Community Leaders',
              subtitle: 'Making change happen every day',
            ),
            SizedBox(height: AppSpacing.lg),
            _TeamCard(
              image: AppAssets.new1,
              title: 'Healthcare Volunteers',
              subtitle: 'Bringing hope through care',
            ),
            SizedBox(height: AppSpacing.lg),
            _TeamCard(
              image: AppAssets.new1,
              title: 'Food Distribution Team',
              subtitle: 'Ending hunger one meal at a time',
            ),
          ],
        );
      },
    );
  }
}

class _TeamCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const _TeamCard({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.headingText,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.bodyText,
          ),
        ),
      ],
    );
  }
}

