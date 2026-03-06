import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopnojoy/features/admin/volunteer/widgets/volunteer_admin_model.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../core/provider/volunteer_admin_provider.dart';

class VolunteerDetailsDialog extends ConsumerStatefulWidget {
  final VolunteerAdminModel volunteer;

  const VolunteerDetailsDialog({super.key, required this.volunteer});

  @override
  ConsumerState<VolunteerDetailsDialog> createState() =>
      _VolunteerDetailsDialogState();
}

class _VolunteerDetailsDialogState
    extends ConsumerState<VolunteerDetailsDialog> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.volunteer.notes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.volunteer.fullName),
      content: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Email: ${widget.volunteer.email}'),
            const SizedBox(height: AppSpacing.sm),
            Text('Phone: ${widget.volunteer.phone}'),
            const SizedBox(height: AppSpacing.sm),
            Text('Area: ${widget.volunteer.areaOfInterest}'),
            const SizedBox(height: AppSpacing.lg),
            TextField(
              controller: controller,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Admin Notes',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            await ref
                .read(volunteerAdminProvider.notifier)
                .updateNotes(widget.volunteer.id, controller.text);

            if (context.mounted) Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}