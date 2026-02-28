import 'package:flutter/material.dart';
import '../../../../../core/constacts/color.dart';
import '../../../../../core/constacts/spacing.dart';

class WhatWeDoHeroSection extends StatelessWidget {
  const WhatWeDoHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xxl * 1.4,
        horizontal: AppSpacing.md,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF3F8FD),
            Color(0xFFEAF6F1),
          ],
        ),
      ),
      child:  Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 850),
          child: _HeroContent(),
        ),
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        _HeroTitle(),
        SizedBox(height: AppSpacing.lg),
        _HeroDivider(),
        SizedBox(height: AppSpacing.xl),
        _HeroSubtitle(),
      ],
    );
  }
}

class _HeroTitle extends StatelessWidget {
  const _HeroTitle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      'What We Do',
      textAlign: TextAlign.center,
      style: theme.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        height: 1.2,
        color: AppColors.headingText,
      ),
    );
  }
}


class _HeroDivider extends StatelessWidget {
  const _HeroDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 3,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}


class _HeroSubtitle extends StatelessWidget {
  const _HeroSubtitle();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      'Our comprehensive programs address root causes while providing immediate relief — creating sustainable impact for communities in need.',
      textAlign: TextAlign.center,
      style: theme.textTheme.titleMedium?.copyWith(
        fontSize: 18,
        height: 1.8,
        color: AppColors.bodyText,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}


