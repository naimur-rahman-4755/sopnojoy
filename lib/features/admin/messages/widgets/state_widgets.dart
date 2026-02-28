import 'package:flutter/material.dart';

import '../../../../core/constacts/color.dart';
import '../../../../core/constacts/text_style.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  const EmptyStateWidget({
    super.key,
    this.message = 'No messages found',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message, style: AppTextStyles.body),
    );
  }
}

class ErrorStateWidget extends StatelessWidget {
  final String message;
  const ErrorStateWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error: $message',
        style:
        AppTextStyles.body.copyWith(color: AppColors.error),
      ),
    );
  }
}