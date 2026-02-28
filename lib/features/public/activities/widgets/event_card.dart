import 'package:flutter/material.dart';
import '../../../../../core/constacts/color.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../../core/constacts/text_style.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String description;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.h4),
          const SizedBox(height: AppSpacing.sm),
          Text(date, style: AppTextStyles.bodySmall),
          Text(location, style: AppTextStyles.bodySmall),
          const SizedBox(height: AppSpacing.sm),
          Text(description, style: AppTextStyles.body),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Text('Join This Event', style: AppTextStyles.link),
          ),
        ],
      ),
    );
  }
}
