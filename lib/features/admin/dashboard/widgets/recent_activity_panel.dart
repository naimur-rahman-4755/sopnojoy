import 'package:flutter/material.dart';
import '../../../../../core/constacts/spacing.dart';

class RecentActivityPanel extends StatelessWidget {
  const RecentActivityPanel({super.key});

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
          Text("Recent Messages",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: 16),
          ListTile(
            title: Text("John Smith"),
            subtitle: Text("Interested in volunteering"),
          ),
          Divider(),
          ListTile(
            title: Text("Lisa Anderson"),
            subtitle: Text("Partnership inquiry"),
          ),
        ],
      ),
    );
  }
}