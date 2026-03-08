import 'package:flutter/material.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';
import '../data/admin_event_model.dart';

class EventCard extends StatelessWidget {
  final EventAdminModel event;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const EventCard({
    super.key,
    required this.event,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Text(event.title, style: AppTextStyles.h4),

            const SizedBox(height: AppSpacing.sm),

            Text(
              "${event.eventDate.toLocal()}".split(' ')[0],
              style: AppTextStyles.bodySmall,
            ),

            if (event.location != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xs),
                child: Text(event.location!, style: AppTextStyles.bodySmall),
              ),

            const SizedBox(height: AppSpacing.sm),

            if (event.description != null)
              Text(
                event.description!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.body,
              ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                TextButton(
                  onPressed: onEdit,
                  child: const Text("Edit"),
                ),

                const SizedBox(width: AppSpacing.sm),

                TextButton(
                  onPressed: onDelete,
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: AppColors.error),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}