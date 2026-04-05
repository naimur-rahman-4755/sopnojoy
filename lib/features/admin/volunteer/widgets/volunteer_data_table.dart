import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopnojoy/features/admin/volunteer/widgets/volunteer_admin_model.dart';

class VolunteerDataTable extends ConsumerWidget {
  final List<VolunteerAdminModel> volunteers;

  const VolunteerDataTable({super.key, required this.volunteers});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (volunteers.isEmpty) {
      return const Center(child: Text('No volunteer applications found.'));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('No')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Phone')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Area')),
            DataColumn(label: Text('Created')),
          ],
          rows: List.generate(volunteers.length, (index) {
            final v = volunteers[index];

            return DataRow(
              cells: [
                DataCell(Text('${index + 1}')),
                DataCell(Text(v.fullName)),
                DataCell(Text(v.phone)),
                DataCell(Text(v.email)),
                DataCell(Text(v.areaOfInterest)),
                DataCell(Text(v.createdAt.toLocal().toString().split(' ')[0])),
              ],
            );
          }),
        ),
      ),
    );
  }
}