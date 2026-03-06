import 'package:flutter/material.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../app/admin_routes.dart';

class QuickActionsPanel extends StatelessWidget {
  const QuickActionsPanel({super.key});

  Widget _actionTile(
      BuildContext context,
      IconData icon,
      String title,
      String route,
      ) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => Navigator.pushNamed(context, route),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 8,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blue.withOpacity(.1),
              child: Icon(icon, size: 18, color: Colors.blue),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Quick Actions",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          _actionTile(
              context, Icons.add, "Add New Event", AdminRoutes.events),

          _actionTile(
              context, Icons.group_add, "Approve Volunteers", AdminRoutes.volunteer),

          _actionTile(
              context, Icons.campaign, "Create Notice", AdminRoutes.notices),
        ],
      ),
    );
  }
}