import 'package:flutter/material.dart';
import '../../../../../core/constacts/color.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../../core/constacts/text_style.dart';

class FocusAreaCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<String> items;

  const FocusAreaCard({
    super.key,
    required this.icon,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust padding and spacing for small widths
        final isSmall = constraints.maxWidth < 400;
        final padding = isSmall ? AppSpacing.md : AppSpacing.lg;
        final iconSize = isSmall ? 28.0 : 36.0;
        final spacingLg = isSmall ? AppSpacing.sm : AppSpacing.lg;
        final spacingMd = isSmall ? AppSpacing.xs : AppSpacing.md;

        return Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CardIcon(icon: icon, size: iconSize),
              SizedBox(height: spacingLg),
              _CardTitle(title: title),
              SizedBox(height: spacingMd),
              _CardItems(items: items, isSmall: isSmall),
            ],
          ),
        );
      },
    );
  }
}

class _CardIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const _CardIcon({required this.icon, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size + 24,
      width: size + 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.primaryBlue.withOpacity(0.15),
            AppColors.primaryBlue.withOpacity(0.05),
          ],
        ),
      ),
      child: Icon(
        icon,
        size: size,
        color: AppColors.primaryBlue,
      ),
    );
  }
}
class _CardTitle extends StatelessWidget {
  final String title;

  const _CardTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _CardItems extends StatelessWidget {
  final List<String> items;
  final bool isSmall;

  const _CardItems({required this.items, this.isSmall = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (e) => Padding(
          padding: EdgeInsets.only(bottom: isSmall ? AppSpacing.xs : AppSpacing.sm),
          child: _BulletItem(text: e),
        ),
      )
          .toList(),
    );
  }
}


class _BulletItem extends StatelessWidget {
  final String text;

  const _BulletItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body.copyWith(height: 1.6),
          ),
        ),
      ],
    );
  }
}