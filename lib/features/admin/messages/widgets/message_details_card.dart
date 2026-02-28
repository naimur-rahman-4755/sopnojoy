import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';
import '../../../../core/provider/admin_message_provider.dart';
import '../../../../core/provider/supabase_provider.dart';
import 'admin_message_model.dart';

class MessageDetailsCard extends ConsumerStatefulWidget {
  final AdminMessage message;
  const MessageDetailsCard({super.key, required this.message});

  @override
  ConsumerState<MessageDetailsCard> createState() =>
      _MessageDetailsCardState();
}

class _MessageDetailsCardState
    extends ConsumerState<MessageDetailsCard> {
  late TextEditingController _notesController;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _notesController =
        TextEditingController(text: widget.message.adminNotes);
  }

  Future<void> _updateStatus(String status) async {
    setState(() => _saving = true);
    final service = ref.read(supabaseServiceProvider);

    await service.updateMessageStatus(
        id: widget.message.id, status: status);

    ref.invalidate(messagesProvider);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Status updated')),
    );

    setState(() => _saving = false);
  }

  Future<void> _saveNotes() async {
    setState(() => _saving = true);
    final service = ref.read(supabaseServiceProvider);

    await service.updateAdminNotes(
      id: widget.message.id,
      notes: _notesController.text.trim(),
    );

    ref.invalidate(messagesProvider);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Notes saved')),
    );

    setState(() => _saving = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius:
        BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.message.name,
                style: AppTextStyles.h3),
            const SizedBox(height: AppSpacing.sm),
            Text(widget.message.email,
                style: AppTextStyles.body),
            const SizedBox(height: AppSpacing.lg),
            Text(widget.message.message,
                style: AppTextStyles.bodyLarge),
            const SizedBox(height: AppSpacing.xl),
            DropdownButton<String>(
              value: widget.message.status,
              items: const [
                DropdownMenuItem(
                    value: 'new', child: Text('New')),
                DropdownMenuItem(
                    value: 'replied',
                    child: Text('Replied')),
                DropdownMenuItem(
                    value: 'closed',
                    child: Text('Closed')),
              ],
              onChanged:
              _saving ? null : (v) => _updateStatus(v!),
            ),
            const SizedBox(height: AppSpacing.lg),
            TextField(
              controller: _notesController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Admin notes...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            ElevatedButton(
              onPressed: _saving ? null : _saveNotes,
              child: const Text('Save Notes'),
            ),
          ],
        ),
      ),
    );
  }
}