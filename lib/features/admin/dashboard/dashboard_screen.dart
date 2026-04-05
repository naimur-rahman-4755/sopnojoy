import 'package:flutter/material.dart';
import 'package:sopnojoy/features/admin/dashboard/widgets/dashboard_grid.dart';
import 'package:sopnojoy/features/admin/dashboard/widgets/quick_action_panel.dart';
import '../../../../core/constacts/spacing.dart';
import '../shared/layout/admin_layout.dart';
import 'widgets/recent_activity_panel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const name = '/shopnopanelx/dashboard';

  @override
  Widget build(BuildContext context) {
    return AdminLayout(
      currentRoute: name,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // KPI / Dashboard grid
                    const DashboardGrid(),
                    const SizedBox(height: AppSpacing.xl),

                    // Recent activity + Quick actions
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(child: RecentActivityPanel()),
                        SizedBox(width: AppSpacing.xl),
                        Expanded(child: QuickActionsPanel()),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}