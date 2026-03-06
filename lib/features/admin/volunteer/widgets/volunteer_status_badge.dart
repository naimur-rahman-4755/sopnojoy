import 'package:flutter/material.dart';
import '../../../../../core/constacts/color.dart';

class VolunteerStatusBadge extends StatelessWidget {
  final String status;
  const VolunteerStatusBadge({super.key, required this.status});

  Color get color {
    switch (status) {
      case 'new':
        return AppColors.warning;
      case 'reviewed':
        return AppColors.primaryBlue;
      case 'accepted':
        return AppColors.success;
      case 'rejected':
        return AppColors.error;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}