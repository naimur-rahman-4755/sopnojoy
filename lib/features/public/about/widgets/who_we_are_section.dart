import 'package:flutter/material.dart';
import '../../../../core/constacts/assets.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';

class WhoWeAreSection extends StatelessWidget {
  const WhoWeAreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;

              return isDesktop
                  ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: _TextContent()),
                  SizedBox(width: AppSpacing.xl),
                  Expanded(child: _ImageContent()),
                ],
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _TextContent(),
                  SizedBox(height: AppSpacing.lg),
                  _ImageContent(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TextContent extends StatelessWidget {
  const _TextContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text('Who We Are', style: AppTextStyles.h2),
        SizedBox(height: AppSpacing.md),
        Text(
          'Shopno Joy was founded with a simple yet powerful vision: to create a world where no one is left behind. Born from the dreams of passionate volunteers who witnessed the struggles of their community, we started our journey in 2018.\n\nWhat began as a small group of friends distributing food to those in need has grown into a comprehensive organization addressing poverty, hunger, and health challenges across multiple communities.\n\nToday, we work with hundreds of volunteers, partnering with local communities to create sustainable change through education, healthcare, nutrition, and economic empowerment programs.',
          style: AppTextStyles.bodyLarge,
        ),
      ],
    );
  }
}

class _ImageContent extends StatelessWidget {
  const _ImageContent();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      child: Image.asset(
        AppAssets.heroImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
