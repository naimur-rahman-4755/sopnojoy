import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:sopnojoy/core/provider/supabase_provider.dart';

import '../../features/public/contact/data/contact_message_model.dart';
import '../data/supabase_service.dart';

final contactMessageProvider =
StateNotifierProvider<ContactMessageController, AsyncValue<void>>(
      (ref) {
    final service = ref.read(supabaseServiceProvider);
    return ContactMessageController(service);
  },
);

class ContactMessageController extends StateNotifier<AsyncValue<void>> {
  final SupabaseService _service;

  ContactMessageController(this._service)
      : super(const AsyncData(null));

  Future<void> submit(ContactMessage message) async {
    state = const AsyncLoading();

    try {
      await _service.insertContactMessage(message);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}