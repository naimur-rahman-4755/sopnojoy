import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sopnojoy/core/provider/supabase_provider.dart';
import '../../features/public/volunteer/model/volunteer_application_model.dart';
import '../data/supabase_service.dart';

final volunteerApplicationProvider = StateNotifierProvider<
    VolunteerApplicationController, AsyncValue<void>>(
      (ref) {
    final service = ref.read(supabaseServiceProvider);
    return VolunteerApplicationController(service);
  },
);

class VolunteerApplicationController
    extends StateNotifier<AsyncValue<void>> {
  final SupabaseService _service;

  VolunteerApplicationController(this._service)
      : super(const AsyncData(null));

  Future<void> submit(VolunteerApplication application) async {
    state = const AsyncLoading();

    try {
      await _service.insertVolunteerApplication(application);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}