import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopnojoy/core/provider/supabase_provider.dart';

import '../../features/admin/dashboard/widgets/state_model.dart';
import '../../features/admin/messages/widgets/admin_message_model.dart';
import '../../features/public/impact/data/impact_metrics_model.dart';

/// Fetch impact metrics
final impactMetricsProvider =
FutureProvider<List<ImpactMetric>>((ref) async {
  final service = ref.watch(supabaseServiceProvider);
  return service.fetchImpactMetrics();
});

/// Fetch all contact messages
final contactMessagesProvider =
FutureProvider<List<AdminMessage>>((ref) async {
  final service = ref.watch(supabaseServiceProvider);
  return service.fetchAllMessages();
});

/// Aggregate dashboard stats
final dashboardStatsProvider =
FutureProvider<List<DashboardStat>>((ref) async {
  final metrics = await ref.watch(impactMetricsProvider.future);
  final messages = await ref.watch(contactMessagesProvider.future);

  return mapDashboardStats(metrics, messages);
});

/// ----------------------
/// Mapping Logic
/// ----------------------

List<DashboardStat> mapDashboardStats(
    List<ImpactMetric> metrics,
    List<AdminMessage> messages,
    ) {
  final List<DashboardStat> stats = [];

  /// Map Impact Metrics
  for (final metric in metrics) {
    stats.add(
      DashboardStat(
        title: metric.title,
        value: _formatNumber(metric.value) + metric.suffix,
        icon: _mapIcon(metric.key),
        growthPercent: null,
      ),
    );
  }

  /// Add Total Messages
  stats.add(
    DashboardStat(
      title: "Total Messages",
      value: _formatNumber(messages.length),
      icon: Icons.message_outlined,
      growthPercent: null,
    ),
  );

  return stats;
}

/// Thousand separator
String _formatNumber(int value) {
  return value.toString().replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => ",",
  );
}

/// Icon mapper based on metric key
IconData _mapIcon(String key) {
  switch (key) {
    case 'people_helped':
      return Icons.volunteer_activism_outlined;
    case 'meals_served':
      return Icons.restaurant_outlined;
    case 'health_camps':
      return Icons.local_hospital_outlined;
    case 'active_volunteers':
      return Icons.group_outlined;
    default:
      return Icons.bar_chart;
  }
}

/// Fetch latest 2 messages sorted by newest first
final recentMessagesProvider =
FutureProvider<List<AdminMessage>>((ref) async {
  final service = ref.watch(supabaseServiceProvider);
  final allMessages = await service.fetchAllMessages();

  allMessages.sort(
        (a, b) => b.createdAt.compareTo(a.createdAt),
  );

  return allMessages.take(2).toList();
});