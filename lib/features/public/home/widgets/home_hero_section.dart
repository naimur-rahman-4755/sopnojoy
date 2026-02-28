import 'package:flutter/material.dart';
import '../../../../app/public_routes.dart';
import '../../../../core/constacts/assets.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import 'app_primary_button.dart';
import '../notice_banner/notice_banner.dart';

const double _desktopBreakpoint = 900;

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({
    super.key,
    required this.heroImage,
  });

  final String heroImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: AppSpacing.lg),
        NoticeBanner(),
        SizedBox(height: AppSpacing.lg),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: _HeroCard(),
        ),
        SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}

/* ---------------- HERO CARD ---------------- */

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= _desktopBreakpoint;

        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSpacing.maxContentWidth,
            ),
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.xxl),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.sectionBg.withOpacity(0.95),
                    AppColors.sectionBg,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 30,
                    offset: const Offset(0, 16),
                  ),
                ],
              ),
              child: isDesktop
                  ? const _DesktopHeroLayout()
                  : const _MobileHeroLayout(),
            ),
          ),
        );
      },
    );
  }
}


/* ---------------- LAYOUTS ---------------- */

class _DesktopHeroLayout extends StatelessWidget {
  const _DesktopHeroLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Expanded(flex: 6, child: _HeroContent(isMobile: false)),
        SizedBox(width: AppSpacing.xxl),
        Expanded(flex: 5, child: _HeroImage()),
      ],
    );
  }
}

class _MobileHeroLayout extends StatelessWidget {
  const _MobileHeroLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _HeroContent(isMobile: true),
        SizedBox(height: AppSpacing.xl),
        _HeroImage(),
      ],
    );
  }
}

/* ---------------- CONTENT ---------------- */

class _HeroContent extends StatelessWidget {
  const _HeroContent({required this.isMobile});

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 520),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Turning Dreams\ninto Hope',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: isMobile ? 36 : 56,
              height: 1.1,
              letterSpacing: -0.5,
              color: AppColors.headingText,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Shopno Joy works to end poverty, hunger, and health inequality through volunteer action and community empowerment.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.bodyText,
              fontSize: 18,
              height: 1.7,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          isMobile ? const _MobileButtons() : const _DesktopButtons(),
        ],
      ),
    );
  }
}

/* ---------------- BUTTONS ---------------- */

class _DesktopButtons extends StatelessWidget {
  const _DesktopButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppPrimaryButton(
          label: 'Join as Volunteer',
          backgroundColor: AppColors.primaryBlue,
          icon: Icons.arrow_forward,
          onPressed: () {
            Navigator.pushNamed(context, PublicRoutes.volunteer);
          },
        ),
        const SizedBox(width: AppSpacing.md),
        AppPrimaryButton(
          label: 'Support Our Work',
          backgroundColor: AppColors.success,
          icon: Icons.favorite_border,
          onPressed: () {
            Navigator.pushNamed(context, PublicRoutes.donate);
          },
        ),
      ],
    );
  }
}

class _MobileButtons extends StatelessWidget {
  const _MobileButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppPrimaryButton(
          label: 'Join as Volunteer',
          backgroundColor: AppColors.primaryBlue,
          icon: Icons.arrow_forward,
          fullWidth: true,
          onPressed: () {
            Navigator.pushNamed(context, PublicRoutes.volunteer);
          },
        ),
        const SizedBox(height: AppSpacing.sm),
        AppPrimaryButton(
          label: 'Support Our Work',
          backgroundColor: AppColors.success,
          icon: Icons.favorite_border,
          fullWidth: true,
          onPressed: () {
            Navigator.pushNamed(context, PublicRoutes.donate);
          },
        ),
      ],
    );
  }
}

/* ---------------- IMAGE ---------------- */

class _HeroImage extends StatelessWidget {
  const _HeroImage();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      child: Image.asset(
        AppAssets.new1,
        fit: BoxFit.contain,
      ),
    );
  }
}
