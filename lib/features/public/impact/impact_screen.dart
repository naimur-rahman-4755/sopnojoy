import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopnojoy/features/public/impact/widgets/gallery_grid.dart';

import '../../../core/constacts/assets.dart';
import '../../../core/constacts/color.dart';
import '../../../core/constacts/spacing.dart';
import '../../../core/constacts/text_style.dart';
import '../../../core/provider/supabase_provider.dart';
import '../donate/donate_screen.dart';
import '../home/widgets/desktop_appbar.dart';
import '../home/widgets/footer_section.dart';
import '../home/widgets/mobile_drawer.dart';
import '../volunteer/volunteer_screen.dart';

class ImpactScreen extends StatelessWidget {
  const ImpactScreen({super.key});
  static const name = '/impact';

  static const double _breakpoint = 900;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final viewportWidth = constraints.maxWidth;
        final isDesktop = viewportWidth >= _breakpoint;

        return Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          appBar: isDesktop ? const DesktopAppBar() : const _MobileImpactAppBar(),
          endDrawer: isDesktop ? null : const MobileDrawer(),
          body: ImpactBody(
            isDesktop: isDesktop,
            viewportWidth: viewportWidth,
          ),
        );
      },
    );
  }
}

class ImpactBody extends StatelessWidget {
  const ImpactBody({
    super.key,
    required this.isDesktop,
    required this.viewportWidth,
  });

  final bool isDesktop;
  final double viewportWidth;

  @override
  Widget build(BuildContext context) {
    final contentHorizontalPadding = _contentPaddingFor(viewportWidth);
    final galleryCrossAxisCount = isDesktop ? 3 : 2;

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: _ImpactHeroSection()),

        // Replaces the old ImpactNumbers section.
        // Visually matches HomeScreen "OurImpactSection" gradient style.
        const SliverToBoxAdapter(child: _GradientImpactStatsSection()),

        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: contentHorizontalPadding,
            vertical: AppSpacing.xxl,
          ),
          sliver: SliverToBoxAdapter(
            child: _SuccessStoriesSection(isDesktop: isDesktop),
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            contentHorizontalPadding,
            AppSpacing.xxl,
            contentHorizontalPadding,
            0,
          ),
          sliver: const SliverToBoxAdapter(
            child: _PhotoGalleryHeader(),
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            contentHorizontalPadding,
            0,
            contentHorizontalPadding,
            AppSpacing.xxl,
          ),
          sliver: Consumer(
            builder: (context, ref, _) {
              final imagesAsync = ref.watch(galleryImagesProvider);

              return imagesAsync.when(
                loading: () => const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),

                error: (e, _) => const SliverToBoxAdapter(
                  child: Center(child: Text("Failed to load gallery")),
                ),

                data: (images) {
                  if (images.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(child: Text("No images available")),
                    );
                  }

                  return GalleryGrid(
                    crossAxisCount: galleryCrossAxisCount,
                    images: images,
                  );
                },
              );
            },
          ),
        ),

        const SliverToBoxAdapter(child: _ImpactCTASection()),

        const SliverToBoxAdapter(child: FooterSection()),
      ],
    );
  }

  static double _contentPaddingFor(double viewportWidth) {
    final extraSpace = (viewportWidth - AppSpacing.maxContentWidth) / 2;
    if (extraSpace > AppSpacing.md) return extraSpace;
    return AppSpacing.md;
  }
}

class _MobileImpactAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MobileImpactAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 16,
      title: const Text(
        'SopnoJoy',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.6,
          color: AppColors.headingText,
        ),
      ),
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              tooltip: 'Menu',
              icon: const Icon(Icons.menu, color: AppColors.headingText),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            );
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _ImpactHeroSection extends StatelessWidget {
  const _ImpactHeroSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxl,
        horizontal: AppSpacing.md,
      ),
      color: AppColors.sectionBg,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Column(
            children: [
              Text('Our Impact', style: AppTextStyles.h1),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Every number represents a life touched, a family supported, and a community strengthened',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GradientImpactStatsSection extends ConsumerWidget {
  const _GradientImpactStatsSection();

  static const double _desktopBreakpoint = 900;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricsAsync = ref.watch(impactMetricsProvider);

    return metricsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (metrics) {
        if (metrics.isEmpty) return const SizedBox.shrink();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.xl * 2,
            horizontal: AppSpacing.md,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.primaryBlue,
                AppColors.success,
              ],
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                  maxWidth: AppSpacing.maxContentWidth),
              child: Column(
                children: [
                  Text(
                    'Our Impact',
                    style:
                    Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isDesktop =
                          constraints.maxWidth >= _desktopBreakpoint;

                      if (isDesktop) {
                        return Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: metrics
                              .map(
                                (m) => Expanded(
                              child: _ImpactStatItem(
                                value: m.formattedValue,
                                label: m.title,
                              ),
                            ),
                          )
                              .toList(growable: false),
                        );
                      }

                      return Column(
                        children: [
                          for (int i = 0; i < metrics.length; i++) ...[
                            _ImpactStatItem(
                              value: metrics[i].formattedValue,
                              label: metrics[i].title,
                            ),
                            if (i != metrics.length - 1)
                              const SizedBox(height: AppSpacing.lg),
                          ],
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ImpactStatItem extends StatelessWidget {
  const _ImpactStatItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.9),
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

class _SuccessStoriesSection extends StatelessWidget {
  const _SuccessStoriesSection({required this.isDesktop});

  final bool isDesktop;

  static const List<_StoryData> _stories = [
    _StoryData(
      reverseOnDesktop: false,
      title: 'Emergency Relief Delivered',
      subtitle: 'Rapid response support',
      description:
      'We delivered urgent relief packages to families facing sudden hardship, ensuring access to essentials when they needed it most.',
    ),
    _StoryData(
      reverseOnDesktop: true,
      title: 'Community Health Camp',
      subtitle: 'Preventive care for all',
      description:
      'Our volunteer medical team provided basic screening, consultations, and referrals—helping communities access timely health guidance.',
    ),
    _StoryData(
      reverseOnDesktop: false,
      title: 'Youth Education Support',
      subtitle: 'Keeping students in school',
      description:
      'Through learning materials and mentoring, we supported students to stay engaged in education and build long-term opportunities.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Success Stories', style: AppTextStyles.h2),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Real people, real change—these are the stories that drive our mission forward',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyLarge,
        ),
        const SizedBox(height: AppSpacing.xl),
        for (int i = 0; i < _stories.length; i++) ...[
          _StoryCard(
            isDesktop: isDesktop,
            reverseOnDesktop: _stories[i].reverseOnDesktop,
            title: _stories[i].title,
            subtitle: _stories[i].subtitle,
            description: _stories[i].description,
          ),
          if (i != _stories.length - 1) const SizedBox(height: AppSpacing.xl),
        ],
      ],
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    required this.isDesktop,
    required this.reverseOnDesktop,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  final bool isDesktop;
  final bool reverseOnDesktop;
  final String title;
  final String subtitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    final media = _StoryMediaBlock();
    final copy = _StoryCopyBlock(
      title: title,
      subtitle: subtitle,
      description: description,
    );

    if (isDesktop) {
      final left = Expanded(child: media);
      final right = Expanded(child: copy);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: reverseOnDesktop
            ? <Widget>[
          right,
          const SizedBox(width: AppSpacing.lg),
          left,
        ]
            : <Widget>[
          left,
          const SizedBox(width: AppSpacing.lg),
          right,
        ],
      );
    }

    // Critical fix: NO Expanded inside Column on mobile.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        media,
        const SizedBox(height: AppSpacing.lg),
        copy,
      ],
    );
  }
}

class _StoryMediaBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: SizedBox(
        height: 260,
        child: Image.asset(
          AppAssets.new1,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}

class _StoryCopyBlock extends StatelessWidget {
  const _StoryCopyBlock({
    required this.title,
    required this.subtitle,
    required this.description,
  });

  final String title;
  final String subtitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.h4),
            const SizedBox(height: AppSpacing.sm),
            Text(subtitle, style: AppTextStyles.link),
            const SizedBox(height: AppSpacing.md),
            Text(description, style: AppTextStyles.body),
          ],
        ),
      ),
    );
  }
}

class _PhotoGalleryHeader extends StatelessWidget {
  const _PhotoGalleryHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Photo Gallery', style: AppTextStyles.h2),
        const SizedBox(height: AppSpacing.sm),
        Text('Moments that capture our journey', style: AppTextStyles.bodyLarge),
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }
}


class _ImpactCTASection extends StatelessWidget {
  const _ImpactCTASection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxl,
        horizontal: AppSpacing.md,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryBlue, AppColors.success],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Column(
            children: [
              Text(
                'Be Part of Our Impact',
                style: AppTextStyles.h2.copyWith(color: AppColors.textOnDark),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Every contribution, big or small, creates ripples of change that transform lives.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textOnDark),
              ),
              const SizedBox(height: AppSpacing.xl),
              Wrap(
                spacing: AppSpacing.md,
                runSpacing: AppSpacing.sm,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, JoinUsScreen.name);
                    },
                    child: const Text('Become a Volunteer'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DonateScreen.name);
                    },
                    child: const Text('Make a Donation'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
class _StatData {
  const _StatData({required this.value, required this.label});
  final String value;
  final String label;
}

@immutable
class _StoryData {
  const _StoryData({
    required this.reverseOnDesktop,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  final bool reverseOnDesktop;
  final String title;
  final String subtitle;
  final String description;
}
