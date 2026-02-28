import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';
import '../../../../core/provider/supabase_provider.dart';
import 'notice_container.dart';
import 'notice_edit_card.dart';

class NoticeStateHandler extends ConsumerWidget {
  final bool isEditMode;
  final bool isSaving;
  final VoidCallback onEdit;
  final VoidCallback onCancel;
  final Future<void> Function({
  required String id,
  required String label,
  required String message,
  }) onSave;

  const NoticeStateHandler({
    required this.isEditMode,
    required this.isSaving,
    required this.onEdit,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noticeAsync = ref.watch(noticeProvider);

    return noticeAsync.when(
      loading: () => const _NoticeLoadingState(),
      error: (err, _) => _NoticeErrorState(error: err.toString()),
      data: (notice) {
        if (notice == null) {
          return const _NoticeEmptyState();
        }

        return NoticeEditCard(
          notice: notice,
          isEditMode: isEditMode,
          isSaving: isSaving,
          onEdit: onEdit,
          onCancel: onCancel,
          onSave: (label, message) {
            onSave(
              id: notice.id,
              label: label,
              message: message,
            );
          },
        );
      },
    );
  }
}

class _NoticeLoadingState extends StatelessWidget {
  const _NoticeLoadingState();

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

class _NoticeErrorState extends StatelessWidget {
  final String error;

  const _NoticeErrorState({required this.error});

  @override
  Widget build(BuildContext context) {
    return NoticeContainer(
      child: Text(
        "Error: $error",
        style: AppTextStyles.body,
      ),
    );
  }
}

class _NoticeEmptyState extends StatelessWidget {
  const _NoticeEmptyState();

  @override
  Widget build(BuildContext context) {
    return const NoticeContainer(
      child: Text(
        "No notice available.",
        style: AppTextStyles.body,
      ),
    );
  }
}
