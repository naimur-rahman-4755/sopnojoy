import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopnojoy/features/admin/activities/widgets/error_state.dart';
import 'package:sopnojoy/features/admin/activities/widgets/impact_metrics_grid.dart';
import 'package:sopnojoy/features/admin/activities/widgets/loading_state.dart';
import '../../../../../core/constacts/spacing.dart';
import '../../../core/constacts/text_style.dart';
import '../../../core/provider/admin_impact_provider.dart';
import '../shared/layout/admin_layout.dart';


class AdminImpactScreen extends ConsumerWidget {
  const AdminImpactScreen({super.key});

  static const route = '/admin/impact';

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final metricsAsync = ref.watch(fetchImpactMetricsProvider);

    return AdminLayout(
      currentRoute: route,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Impact Metrics',
              style: AppTextStyles.pageTitle,
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              'Manage the impact statistics shown on the website.',
              style: AppTextStyles.body,
            ),

            const SizedBox(height: AppSpacing.xl),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: metricsAsync.when(
                  data: (metrics) => Scrollbar(
                    thumbVisibility: true,
                    child: ImpactMetricsGrid(metrics: metrics),
                  ),
                  loading: () => const ImpactLoadingState(),
                  error: (e, _) => ImpactErrorState(message: e.toString()),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}