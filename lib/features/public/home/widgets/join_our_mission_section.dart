import 'package:flutter/material.dart';
import '../../../../app/public_routes.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import 'app_primary_button.dart';

class JoinOurMissionSection extends StatelessWidget {
  const JoinOurMissionSection({super.key});

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
              _Header(),
              SizedBox(height: AppSpacing.xl),
              _ActionCards(),
            ],
          ),
        ),
      ),
    );
  }
}


class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Join Our Mission',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.headingText,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Whether you want to volunteer, donate, or stay connected — we’d love to hear from you.',
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

class _ActionCards extends StatelessWidget {
  const _ActionCards();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        return isDesktop
            ? Row(
          children: const [
            Expanded(child: _VolunteerCard()),
            SizedBox(width: AppSpacing.lg),
            Expanded(child: _ContactCard()),
          ],
        )
            : Column(
          children: const [
            _VolunteerCard(),
            SizedBox(height: AppSpacing.lg),
            _ContactCard(),
          ],
        );
      },
    );
  }
}

class _BaseActionCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget button;

  const _BaseActionCard({
    required this.title,
    required this.description,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.headingText,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.bodyText,
              height: 1.6,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          button,
        ],
      ),
    );
  }
}

class _VolunteerCard extends StatelessWidget {
  const _VolunteerCard();

  @override
  Widget build(BuildContext context) {
    return _BaseActionCard(
      title: 'Become a Volunteer',
      description:
      'Join our community of changemakers and make a real difference in people’s lives.',
      button: AppPrimaryButton(
        label: 'Register Now',
        backgroundColor: AppColors.primaryBlue,
        icon: Icons.person_outline,
        onPressed: () {
          Navigator.pushNamed(context, PublicRoutes.volunteer);
        },
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard();

  @override
  Widget build(BuildContext context) {
    return _BaseActionCard(
      title: 'Get in Touch',
      description:
      'Have questions or want to learn more? We’re here to help and would love to connect.',
      button: AppPrimaryButton(
        label: 'Contact Us',
        backgroundColor: AppColors.success,
        icon: Icons.arrow_forward,
        onPressed: () {
          Navigator.pushNamed(context, PublicRoutes.contact);
        },
      ),
    );
  }
}
