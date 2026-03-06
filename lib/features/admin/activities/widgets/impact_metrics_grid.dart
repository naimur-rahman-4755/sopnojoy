import 'package:flutter/material.dart';
import '../../../public/impact/widgets/impact_metrics_model.dart';
import 'impact_metric_card.dart';

class ImpactMetricsGrid extends StatelessWidget {
  final List<ImpactMetric> metrics;

  const ImpactMetricsGrid({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    int crossAxisCount = 4;

    if (width < 1400) crossAxisCount = 3;
    if (width < 1100) crossAxisCount = 2;
    if (width < 700) crossAxisCount = 1;

    return GridView.builder(
      itemCount: metrics.length,
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,

        // bigger height to avoid overflow
        mainAxisExtent: 260,
      ),
      itemBuilder: (_, index) {
        return ImpactMetricCard(metric: metrics[index]);
      },
    );
  }
}