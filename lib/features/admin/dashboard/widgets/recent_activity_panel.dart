import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../../core/constacts/text_style.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/provider/dashboard_provider.dart';
import '../../messages/widgets/admin_message_model.dart';

class RecentActivityPanel extends ConsumerWidget {
  const RecentActivityPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentAsync = ref.watch(recentMessagesProvider);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Recent Messages", style: AppTextStyles.h4),

          const SizedBox(height: AppSpacing.lg),

          recentAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => const Text("Error loading messages"),
            data: (messages) {
              if (messages.isEmpty) {
                return const Text("No recent messages");
              }

              return Column(
                children: messages
                    .map((msg) => _MessageTile(message: msg))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  final AdminMessage message;

  const _MessageTile({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            child: Text(
              message.name.isNotEmpty
                  ? message.name[0].toUpperCase()
                  : "?",
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.name,
                  style: AppTextStyles.bodyLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  message.message,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(
            "${message.createdAt.day}/${message.createdAt.month}",
            style: AppTextStyles.bodySmall,
          )
        ],
      ),
    );
  }
}