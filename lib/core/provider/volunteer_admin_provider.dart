import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sopnojoy/core/provider/supabase_provider.dart';

import '../../features/admin/volunteer/widgets/volunteer_admin_model.dart';
import '../data/supabase_service.dart';

final volunteerAdminProvider =
StateNotifierProvider<VolunteerAdminNotifier, AsyncValue<List<VolunteerAdminModel>>>(
      (ref) {
    final service = ref.read(supabaseServiceProvider);
    return VolunteerAdminNotifier(service)..fetch();
  },
);

class VolunteerAdminNotifier
    extends StateNotifier<AsyncValue<List<VolunteerAdminModel>>> {
  final SupabaseService _service;

  VolunteerAdminNotifier(this._service)
      : super(const AsyncLoading());

  Future<void> fetch() async {
    try {
      state = const AsyncLoading();
      final data = await _service.fetchAllVolunteerApplications();
      state = AsyncData(data);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateStatus(String id, String status) async {
    await _service.updateVolunteerStatus(id: id, status: status);
    await fetch();
  }

  Future<void> updateNotes(String id, String notes) async {
    await _service.updateVolunteerNotes(id: id, notes: notes);
    await fetch();
  }
}