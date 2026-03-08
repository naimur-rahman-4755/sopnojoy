import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/provider/admin_impact_provider.dart';
import '../../../public/impact/data/impact_metrics_model.dart';

class EditImpactDialog extends ConsumerStatefulWidget {
  final ImpactMetric metric;

  const EditImpactDialog({super.key, required this.metric});

  @override
  ConsumerState<EditImpactDialog> createState() => _EditImpactDialogState();
}

class _EditImpactDialogState extends ConsumerState<EditImpactDialog> {

  late TextEditingController titleController;
  late TextEditingController valueController;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.metric.title);
    valueController =
        TextEditingController(text: widget.metric.value.toString());
  }

  @override
  void dispose() {
    titleController.dispose();
    valueController.dispose();
    super.dispose();
  }

  Future<void> save() async {

    final value = int.tryParse(valueController.text) ?? 0;

    await ref.read(updateImpactMetricProvider({
      'id': widget.metric.id,
      'title': titleController.text,
      'value': value,
    }).future);

    if (mounted) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Impact metric updated successfully"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: const Text("Edit Impact Metric"),
      content: SizedBox(
        width: width > 600 ? 420 : width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: valueController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Value",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [

        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),

        ElevatedButton(
          onPressed: save,
          child: const Text("Save Changes"),
        )

      ],
    );
  }
}