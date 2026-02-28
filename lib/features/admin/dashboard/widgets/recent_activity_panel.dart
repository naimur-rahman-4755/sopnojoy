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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Messages",
            style: AppTextStyles.h4,
          ),
          const SizedBox(height: AppSpacing.lg),

          recentAsync.when(
            loading: () => const _LoadingState(),
            error: (e, _) => _ErrorState(message: e.toString()),
            data: (messages) {
              if (messages.isEmpty) {
                return const _EmptyState();
              }

              return Column(
                children: List.generate(
                  messages.length,
                      (index) {
                    final msg = messages[index];

                    return Column(
                      children: [
                        _MessageTile(message: msg),
                        if (index != messages.length - 1)
                          const Divider(height: AppSpacing.xl),
                      ],
                    );
                  },
                ),
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
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          child: Text(
            message.name.isNotEmpty
                ? message.name[0].toUpperCase()
                : "?",
          ),
        ),
        const SizedBox(width: AppSpacing.md),

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
                _truncate(message.message, 50),
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),

        const SizedBox(width: AppSpacing.md),

        Text(
          _formatDate(message.createdAt),
          style: AppTextStyles.bodySmall,
        ),
      ],
    );
  }

  String _truncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return "${text.substring(0, maxLength)}...";
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Text("No recent messages yet."),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String message;

  const _ErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Text(
        "Error loading messages",
        style: AppTextStyles.body,
      ),
    );
  }
}

