import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopnojoy/features/admin/messages/widgets/status_badge.dart';

import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';
import '../../../../core/provider/admin_message_provider.dart';
import 'admin_message_model.dart';

class MessageListItem extends ConsumerWidget {
  final AdminMessage message;
  const MessageListItem({super.key, required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedMessageProvider);

    final isSelected = selected?.id == message.id;

    return InkWell(
      onTap: () =>
      ref.read(selectedMessageProvider.notifier).state =
          message,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.sectionBg
              : Colors.transparent,
          borderRadius:
          BorderRadius.circular(AppSpacing.radiusMd),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(message.name,
                      style: AppTextStyles.h4),
                ),
                StatusBadge(status: message.status),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(message.email,
                style: AppTextStyles.bodySmall),
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