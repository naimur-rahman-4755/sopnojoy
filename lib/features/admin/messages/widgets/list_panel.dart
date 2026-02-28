import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/provider/admin_message_provider.dart';
import 'message_list_item.dart';

class MessagesListPanel extends ConsumerWidget {
  const MessagesListPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(messagesProvider).value ?? [];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius:
        BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.lg),
        itemBuilder: (_, index) =>
            MessageListItem(message: messages[index]),
        separatorBuilder: (_, __) =>
        const Divider(color: AppColors.border),
        itemCount: messages.length,
      ),
    );
  }
}