import 'package:flutter/material.dart';
import 'package:sopnojoy/features/admin/dashboard/widgets/stat_card.dart';
import 'package:sopnojoy/features/admin/dashboard/widgets/state_model.dart';
import '../../../../../core/constacts/spacing.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  int _getCrossAxisCount(double width) {
    if (width >= 1400) return 4;
    if (width >= 1000) return 3;
    if (width >= 700) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = _getCrossAxisCount(width);

    final stats = _dummyStats; // Later replace with Supabase data

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: AppSpacing.lg,
        mainAxisSpacing: AppSpacing.lg,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) {
        return ImpactStatCard(stat: stats[index]);
      },
    );
  }
}

const List<DashboardStat> _dummyStats = [
  DashboardStat(
    title: "People Helped",
    value: "12,480",
    icon: Icons.volunteer_activism_outlined,
    growthPercent: 14.2,
    isPositive: true,
  ),
  DashboardStat(
    title: "Meals Served",
    value: "38,920",
    icon: Icons.restaurant_outlined,
    growthPercent: 8.5,
    isPositive: true,
  ),
  DashboardStat(
    title: "Health Camps Held",
    value: "126",
    icon: Icons.local_hospital_outlined,
    growthPercent: 4.1,
    isPositive: true,
  ),
  DashboardStat(
    title: "Active Volunteers",
    value: "1,248",
    icon: Icons.group_outlined,
    growthPercent: 6.3,
    isPositive: true,
  ),
  DashboardStat(
    title: "Total Messages",
    value: "342",
    icon: Icons.message_outlined,
    growthPercent: -2.4,
    isPositive: false,
  ),
  DashboardStat(
    title: "Total Donations",
    value: "\$48,596",
    icon: Icons.attach_money_outlined,
    growthPercent: 18.7,
    isPositive: true,
  ),
];