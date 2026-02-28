import 'package:flutter/material.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/constacts/text_style.dart';
import '../../../../core/constacts/color.dart';
import '../../../public/home/notice_banner/notice_banner_model.dart';

class NoticeEditCard extends StatefulWidget {
  final Notice notice;
  final bool isEditMode;
  final bool isSaving;
  final VoidCallback onEdit;
  final VoidCallback onCancel;
  final Function(String label, String message) onSave;

  const NoticeEditCard({
    super.key,
    required this.notice,
    required this.isEditMode,
    required this.isSaving,
    required this.onEdit,
    required this.onCancel,
    required this.onSave,
  });

  @override
  State<NoticeEditCard> createState() => _NoticeEditCardState();
}

class _NoticeEditCardState extends State<NoticeEditCard> {
  late final TextEditingController _labelController;
  late final TextEditingController _messageController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _labelController =
        TextEditingController(text: widget.notice.label);
    _messageController =
        TextEditingController(text: widget.notice.message);
  }

  @override
  void dispose() {
    _labelController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant NoticeEditCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.isEditMode) {
      _labelController.text = widget.notice.label;
      _messageController.text = widget.notice.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: widget.isEditMode
          ? _buildEditMode()
          : _buildViewMode(),
    );
  }

  Widget _buildViewMode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.notice.label, style: AppTextStyles.h4),
        const SizedBox(height: AppSpacing.md),
        Text(widget.notice.message,
            style: AppTextStyles.bodyLarge),
        const SizedBox(height: AppSpacing.xl),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: widget.onEdit,
            child: const Text("Edit Notice"),
          ),
        ),
      ],
    );
  }

  Widget _buildEditMode() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Edit Notice", style: AppTextStyles.h4),
          const SizedBox(height: AppSpacing.lg),

          /// Label Field
          TextFormField(
            controller: _labelController,
            decoration: const InputDecoration(
              labelText: "Label",
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
            value == null || value.isEmpty
                ? "Label required"
                : null,
          ),

          const SizedBox(height: AppSpacing.lg),

          /// Message Field
          TextFormField(
            controller: _messageController,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: "Message",
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
            value == null || value.isEmpty
                ? "Message required"
                : null,
          ),

          const SizedBox(height: AppSpacing.xl),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed:
                widget.isSaving ? null : widget.onCancel,
                child: const Text("Cancel"),
              ),
              const SizedBox(width: AppSpacing.md),
              ElevatedButton(
                onPressed: widget.isSaving
                    ? null
                    : () {
                  if (_formKey.currentState!
                      .validate()) {
                    widget.onSave(
                      _labelController.text.trim(),
                      _messageController.text.trim(),
                    );
                  }
                },
                child: widget.isSaving
                    ? const SizedBox(
                  height: 18,
                  width: 18,
                  child:
                  CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
                    : const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}