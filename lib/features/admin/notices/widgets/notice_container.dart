import 'package:flutter/material.dart';

import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/spacing.dart';

class NoticeContainer extends StatelessWidget {
  final Widget child;

  const NoticeContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }
}