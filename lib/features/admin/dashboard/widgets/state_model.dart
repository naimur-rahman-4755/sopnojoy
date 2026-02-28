import 'package:flutter/material.dart';

class DashboardStat {
  final String title;
  final String value;
  final IconData icon;
  final double? growthPercent;
  final bool isPositive;

  const DashboardStat({
    required this.title,
    required this.value,
    required this.icon,
    this.growthPercent,
    this.isPositive = true,
  });
}