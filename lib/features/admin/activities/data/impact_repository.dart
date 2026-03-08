import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../public/impact/data/impact_metrics_model.dart';

class ImpactRepository {
  final SupabaseClient client;

  ImpactRepository(this.client);

  Future<List<ImpactMetric>> fetchImpactMetrics() async {
    final response = await client
        .from('impact_metrics')
        .select()
        .order('sort_order', ascending: true);

    return (response as List)
        .map((e) => ImpactMetric.fromMap(e))
        .toList();
  }

  Future<void> updateImpactMetric({
    required String id,
    required String title,
    required int value,
  }) async {

    await client
        .from('impact_metrics')
        .update({
      'title': title,
      'value': value,
    })
        .eq('id', id);
  }
}