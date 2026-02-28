import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/public/home/notice_banner/notice_banner_model.dart';
import '../../features/public/impact/widgets/impact_metrics_model.dart';
import '../data/supabase_service.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return SupabaseService(client);
});

final noticeProvider = FutureProvider<Notice?>((ref) async {
  final service = ref.watch(supabaseServiceProvider);
  return service.fetchActiveNotice();
});

final impactMetricsProvider =
FutureProvider<List<ImpactMetric>>((ref) async {
  final service = ref.watch(supabaseServiceProvider);
  return service.fetchImpactMetrics();
});