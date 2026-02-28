import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/public/activities/data/event_model.dart';
import 'supabase_provider.dart';

final upcomingEventsProvider =
FutureProvider<List<Event>>((ref) async {
  final service = ref.watch(supabaseServiceProvider);
  return service.fetchUpcomingEvents();
});