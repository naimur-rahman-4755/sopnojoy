import 'package:flutter/material.dart';
import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/text_style.dart';
import '../../../public/impact/data/impact_metrics_model.dart';
import '../../../../../core/constacts/spacing.dart';
import 'edit_impact_dialoge.dart';

class ImpactMetricCard extends StatelessWidget {

  final ImpactMetric metric;

  const ImpactMetricCard({super.key, required this.metric});

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 3,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Icon(
              Icons.bar_chart,
              color: AppColors.primaryBlue,
              size: 26,
            ),

            const SizedBox(height: AppSpacing.md),

            // TITLE
            Text(
              metric.title,
              style: AppTextStyles.h4,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: AppSpacing.sm),

            // VALUE
            Text(
              "${metric.value}${metric.suffix}",
              style: AppTextStyles.h2.copyWith(
                color: AppColors.primaryBlue,
              ),
            ),

            const Spacer(),

            // ACTION ROW
            Row(
              children: [

                Flexible(
                  child: Chip(
                    label: Text(
                      metric.isActive ? "Active" : "Inactive",
                      overflow: TextOverflow.ellipsis,
                    ),
                    backgroundColor: metric.isActive
                        ? AppColors.success.withOpacity(.15)
                        : AppColors.error.withOpacity(.15),
                  ),
                ),

                const Spacer(),

                SizedBox(
                  height: 32,
                  child: TextButton(
                    onPressed: () {

                      showDialog(
                        context: context,
                        builder: (_) => EditImpactDialog(metric: metric),
                      );

                    },
                    child: const Text("Edit"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}