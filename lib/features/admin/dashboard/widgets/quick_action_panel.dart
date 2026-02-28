import 'package:flutter/material.dart';
import '../../../../../core/constacts/spacing.dart';

class QuickActionsPanel extends StatelessWidget {
  const QuickActionsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Quick Actions",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Add New Event"),
          ),
          ListTile(
            leading: Icon(Icons.group_add),
            title: Text("Approve Volunteers"),
          ),
          ListTile(
            leading: Icon(Icons.campaign),
            title: Text("Create Notice"),
          ),
        ],
      ),
    );
  }
}