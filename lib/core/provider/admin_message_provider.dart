import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../../../core/provider/supabase_provider.dart';
import '../../features/admin/messages/widgets/admin_message_model.dart';

final messagesProvider =
FutureProvider<List<AdminMessage>>((ref) async {
  final service = ref.watch(supabaseServiceProvider);
  return service.fetchAllMessages();
});

final selectedMessageProvider =
StateProvider<AdminMessage?>((ref) => null);