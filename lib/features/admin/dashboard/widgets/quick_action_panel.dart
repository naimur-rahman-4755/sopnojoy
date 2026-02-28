import 'package:flutter/material.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../app/admin_routes.dart';

class QuickActionsPanel extends StatelessWidget {
  const QuickActionsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Quick Actions",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          ListTile(
            leading: const Icon(Icons.add),
            title: const Text("Add New Event"),
            onTap: () {
              Navigator.pushNamed(context, AdminRoutes.events);
            },
          ),

          ListTile(
            leading: const Icon(Icons.group_add),
            title: const Text("Approve Volunteers"),
            onTap: () {
              Navigator.pushNamed(context, AdminRoutes.volunteer);
            },
          ),

          ListTile(
            leading: const Icon(Icons.campaign),
            title: const Text("Create Notice"),
            onTap: () {
              Navigator.pushNamed(context, AdminRoutes.notices);
            },
          ),
        ],
      ),
    );
  }
}