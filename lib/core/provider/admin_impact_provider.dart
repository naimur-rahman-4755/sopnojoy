import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/admin/activities/data/impact_repository.dart';
import '../../features/public/impact/data/impact_metrics_model.dart';

final impactRepositoryProvider = Provider<ImpactRepository>((ref) {
  final client = Supabase.instance.client;
  return ImpactRepository(client);
});

final fetchImpactMetricsProvider =
FutureProvider<List<ImpactMetric>>((ref) async {

  final repo = ref.watch(impactRepositoryProvider);
  return repo.fetchImpactMetrics();
});

final updateImpactMetricProvider =
FutureProvider.family<void, Map<String, dynamic>>((ref, data) async {

  final repo = ref.watch(impactRepositoryProvider);

  await repo.updateImpactMetric(
    id: data['id'],
    title: data['title'],
    value: data['value'],
  );

  ref.invalidate(fetchImpactMetricsProvider);
});