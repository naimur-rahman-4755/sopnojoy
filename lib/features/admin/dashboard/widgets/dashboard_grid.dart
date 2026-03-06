import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../../core/provider/dashboard_provider.dart';
import 'stat_card.dart';

class DashboardGrid extends ConsumerWidget {
  const DashboardGrid({super.key});

  int _getCrossAxisCount(double width) {
    if (width >= 1500) return 4;
    if (width >= 1100) return 3;
    if (width >= 750) return 2;
    return 1;
  }

  double _getAspectRatio(double width) {
    if (width < 600) return 1.2;
    if (width < 1000) return 1.4;
    return 1.3;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    final statsAsync = ref.watch(dashboardStatsProvider);

    final crossAxisCount = _getCrossAxisCount(width);
    final ratio = _getAspectRatio(width);

    return statsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text("Error: $e")),
      data: (stats) {
        if (stats.isEmpty) {
          return const Center(child: Text("No dashboard data available"));
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final itemHeight = (constraints.maxWidth / crossAxisCount) * ratio;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: stats.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: AppSpacing.lg,
                mainAxisSpacing: AppSpacing.lg,
                childAspectRatio: constraints.maxWidth / crossAxisCount / itemHeight,
              ),
              itemBuilder: (context, index) {
                return ImpactStatCard(stat: stats[index]);
              },
            );
          },
        );
      },
    );
  }
}