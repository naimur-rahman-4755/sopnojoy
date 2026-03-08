import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/provider/supabase_provider.dart';

class AddEventDialog extends ConsumerStatefulWidget {
  const AddEventDialog({super.key});

  @override
  ConsumerState<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends ConsumerState<AddEventDialog> {

  final title = TextEditingController();
  final location = TextEditingController();
  final description = TextEditingController();
  final ctaText = TextEditingController(text: "Join This Event");
  final ctaUrl = TextEditingController();

  DateTime? selectedDate;

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  Future<void> saveEvent() async {
    final service = ref.read(supabaseServiceProvider);

    await service.insertEvent(
      title: title.text,
      eventDate: selectedDate!,
      location: location.text,
      description: description.text,
      ctaText: ctaText.text,
      ctaUrl: ctaUrl.text,
    );

    ref.invalidate(eventsProvider);

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      title: const Text("Add Event"),
      content: SizedBox(
        width: 420,
        child: SingleChildScrollView(
          child: Column(
            children: [

              TextField(
                controller: title,
                decoration: const InputDecoration(labelText: "Title"),
              ),

              const SizedBox(height: AppSpacing.md),

              TextField(
                controller: location,
                decoration: const InputDecoration(labelText: "Location"),
              ),

              const SizedBox(height: AppSpacing.md),

              TextField(
                controller: description,
                maxLines: 3,
                decoration: const InputDecoration(labelText: "Description"),
              ),

              const SizedBox(height: AppSpacing.md),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? "Pick Event Date"
                          : selectedDate.toString().split(' ')[0],
                    ),
                  ),
                  TextButton(
                    onPressed: pickDate,
                    child: const Text("Select"),
                  )
                ],
              ),

              const SizedBox(height: AppSpacing.md),

              TextField(
                controller: ctaText,
                decoration: const InputDecoration(labelText: "CTA Text"),
              ),

              const SizedBox(height: AppSpacing.md),

              TextField(
                controller: ctaUrl,
                decoration: const InputDecoration(labelText: "CTA URL"),
              ),

              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
      actions: [

        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),

        ElevatedButton(
          onPressed: selectedDate == null ? null : saveEvent,
          child: const Text("Save Event"),
        )
      ],
    );
  }
}