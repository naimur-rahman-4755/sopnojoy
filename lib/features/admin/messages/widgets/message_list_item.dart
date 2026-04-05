import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';
import '../../../../core/provider/admin_message_provider.dart';
import 'admin_message_model.dart';
import 'message_details_card.dart';

class MessageListItem extends ConsumerWidget {
  final AdminMessage message;
  const MessageListItem({super.key, required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedMessageProvider);
    final isSelected = selected?.id == message.id;

    return InkWell(
      onTap: () {
        // Set selected message
        ref.read(selectedMessageProvider.notifier).state = message;

        // Check if desktop or mobile/tablet
        final isDesktop = MediaQuery.of(context).size.width > 1000;

        // On mobile/tablet open dialog
        if (!isDesktop) {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                ),
                child: SizedBox(
                  width: 600,
                  child: MessageDetailsCard(message: message),
                ),
              );
            },
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.sectionBg : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.name, style: AppTextStyles.h4),
            const SizedBox(height: AppSpacing.xs),
            Text(message.email, style: AppTextStyles.bodySmall),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message.message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.body,
            ),
          ],
        ),
      ),
    );
  }
}