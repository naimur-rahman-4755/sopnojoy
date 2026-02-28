import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopnojoy/features/admin/notices/widgets/notice_state_handler.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';
import '../../../../core/constacts/color.dart';
import '../../../core/provider/supabase_provider.dart';
import '../shared/layout/admin_layout.dart';

class AdminNoticeScreen extends ConsumerStatefulWidget {
  final String currentRoute;

  const AdminNoticeScreen({
    super.key,
    required this.currentRoute,
  });

  @override
  ConsumerState<AdminNoticeScreen> createState() =>
      _AdminNoticeScreenState();
}

class _AdminNoticeScreenState
    extends ConsumerState<AdminNoticeScreen> {
  bool _isEditMode = false;
  bool _isSaving = false;

  Future<void> _updateNotice({
    required String id,
    required String label,
    required String message,
  }) async {
    setState(() => _isSaving = true);

    try {
      final service = ref.read(supabaseServiceProvider);

      await service.updateNotice(
        id: id,
        label: label,
        message: message,
      );

      ref.invalidate(noticeProvider);

      setState(() {
        _isEditMode = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Notice updated successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Update failed: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminLayout(
      currentRoute: widget.currentRoute,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _PageHeader(),
              const SizedBox(height: AppSpacing.xl),
              const _SectionHeader(title: "Current Notice"),
              const SizedBox(height: AppSpacing.lg),
              NoticeStateHandler(
                isEditMode: _isEditMode,
                isSaving: _isSaving,
                onEdit: () => setState(() => _isEditMode = true),
                onCancel: () => setState(() => _isEditMode = false),
                onSave: _updateNotice,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Notice Banner",
      style: AppTextStyles.h2,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.h3,
    );
  }
}