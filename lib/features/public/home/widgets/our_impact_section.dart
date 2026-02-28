import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/provider/supabase_provider.dart';
import '../../impact/widgets/impact_metrics_model.dart';

class OurImpactSection extends ConsumerWidget {
  const OurImpactSection({super.key});

  static const double _desktopBreakpoint = 900;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metricsAsync = ref.watch(impactMetricsProvider);

    return metricsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (metrics) {
        if (metrics.isEmpty) return const SizedBox.shrink();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.xl * 2,
            horizontal: AppSpacing.md,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.primaryBlue,
                AppColors.success,
              ],
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSpacing.maxContentWidth,
              ),
              child: Column(
                children: [
                  const _ImpactHeader(),
                  const SizedBox(height: AppSpacing.xl),
                  _ImpactStats(metrics: metrics),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ImpactStats extends StatelessWidget {
  const _ImpactStats({required this.metrics});
  final List<ImpactMetric> metrics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;

        if (isDesktop) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: metrics
                .map(
                  (m) => Expanded(
                child: _ImpactItem(
                  value: m.formattedValue,
                  label: m.title,
                ),
              ),
            )
                .toList(growable: false),
          );
        }

        return Column(
          children: [
            for (int i = 0; i < metrics.length; i++) ...[
              _ImpactItem(
                value: metrics[i].formattedValue,
                label: metrics[i].title,
              ),
              if (i != metrics.length - 1)
                const SizedBox(height: AppSpacing.lg),
            ],
          ],
        );
      },
    );
  }
}

class _ImpactItem extends StatelessWidget {
  final String value;
  final String label;

  const _ImpactItem({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.9),
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

class _ImpactHeader extends StatelessWidget {
  const _ImpactHeader();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Our Impact',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

