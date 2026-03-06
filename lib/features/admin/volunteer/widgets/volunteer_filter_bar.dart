import 'package:flutter/material.dart';
import '../../../../../core/constacts/text_style.dart';

class VolunteerFilterBar extends StatelessWidget {
  final int total;
  final String selected;
  final ValueChanged<String> onChanged;

  const VolunteerFilterBar({
    super.key,
    required this.total,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total: $total', style: AppTextStyles.bodyLarge),
        DropdownButton<String>(
          value: selected,
          items: const [
            DropdownMenuItem(value: 'all', child: Text('All')),
            DropdownMenuItem(value: 'new', child: Text('New')),
            DropdownMenuItem(value: 'reviewed', child: Text('Reviewed')),
            DropdownMenuItem(value: 'accepted', child: Text('Accepted')),
            DropdownMenuItem(value: 'rejected', child: Text('Rejected')),
          ],
          onChanged: (v) => onChanged(v!),
        ),
      ],
    );
  }
}