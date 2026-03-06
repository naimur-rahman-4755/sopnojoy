import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopnojoy/features/admin/volunteer/widgets/volunteer_admin_model.dart';
import '../../../../core/provider/volunteer_admin_provider.dart';
import 'volunteer_status_badge.dart';
import 'volunteer_details_dialog.dart';

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
            DataColumn(label: Text('Status')),
            DataColumn(label: Text('Created')),
            DataColumn(label: Text('Actions')),
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
                 DataCell(VolunteerStatusBadge(status: v.status)),
                DataCell(Text(v.createdAt.toLocal().toString().split(' ')[0])),
                DataCell(Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) =>
                              VolunteerDetailsDialog(volunteer: v),
                        );
                      },
                    ),
                    DropdownButton<String>(
                      value: v.status,
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(value: 'new', child: Text('New')),
                        DropdownMenuItem(value: 'reviewed', child: Text('Reviewed')),
                        DropdownMenuItem(value: 'accepted', child: Text('Accepted')),
                        DropdownMenuItem(value: 'rejected', child: Text('Rejected')),
                      ],
                      onChanged: (val) {
                        ref
                            .read(volunteerAdminProvider.notifier)
                            .updateStatus(v.id, val!);
                      },
                    ),
                  ],
                )),
              ],
            );
          }),
        ),
      ),
    );
  }
}