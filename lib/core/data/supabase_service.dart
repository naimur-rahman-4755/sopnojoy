import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/admin/messages/widgets/admin_message_model.dart';
import '../../features/public/activities/data/event_model.dart';
import '../../features/public/contact/data/contact_message_model.dart';
import '../../features/public/home/notice_banner/notice_banner_model.dart';
import '../../features/public/impact/widgets/impact_metrics_model.dart';
import '../../features/public/volunteer/model/volunteer_application_model.dart';

class SupabaseService {
  SupabaseService(this._client);

  final SupabaseClient _client;

  // ----------------------
  // Notice Methods
  // ----------------------

  Future<Notice?> fetchActiveNotice() async {
    final now = DateTime.now().toUtc().toIso8601String();

    final response = await _client
        .from('notices')
        .select()
        .eq('is_active', true)
        .or(
      'starts_at.is.null,starts_at.lte.$now',
    )
        .or(
      'ends_at.is.null,ends_at.gte.$now',
    )
        .order('sort_order', ascending: true)
        .limit(1)
        .maybeSingle();

    if (response == null) return null;

    return Notice.fromMap(response);
  }


  Future<Notice?> updateNotice({
    required String id,
    required String label,
    required String message,
  }) async {
    final response = await _client
        .from('notices')
        .update({
      'label': label,
      'message': message,
    })
        .eq('id', id)
        .select()
        .maybeSingle();

    if (response == null) return null;
    return Notice.fromMap(response);
  }

  // ----------------------
  // Admin Messages
  // ----------------------

  Future<List<AdminMessage>> fetchAllMessages() async {
    final response = await _client
        .from('contact_messages')
        .select()
        .order('created_at', ascending: false);

    return (response as List)
        .map((e) => AdminMessage.fromMap(e))
        .toList(growable: false);
  }

  Future<void> updateMessageStatus({
    required String id,
    required String status,
  }) async {
    await _client
        .from('contact_messages')
        .update({'status': status})
        .eq('id', id);
  }

  Future<void> updateAdminNotes({
    required String id,
    required String notes,
  }) async {
    await _client
        .from('contact_messages')
        .update({'admin_notes': notes})
        .eq('id', id);
  }

  // ----------------------
  // Impact Metrics
  // ----------------------

  Future<List<ImpactMetric>> fetchImpactMetrics() async {
    final response = await _client
        .from('impact_metrics')
        .select()
        .eq('is_active', true)
        .order('sort_order', ascending: true);

    return (response as List)
        .map((e) => ImpactMetric.fromMap(e))
        .toList(growable: false);
  }

  // ----------------------
  // Volunteer Application
  // ----------------------

  Future<void> insertVolunteerApplication(
      VolunteerApplication application,
      ) async {
    try {
      await _client
          .from('volunteer_applications')
          .insert(application.toMap());
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }

  // ----------------------
  // Contact Message
  // ----------------------

  Future<void> insertContactMessage(ContactMessage message) async {
    try {
      await _client
          .from('contact_messages')
          .insert(message.toMap());
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    } catch (_) {
      throw Exception('Something went wrong. Please try again.');
    }
  }

  // ----------------------
  // Events
  // ----------------------

  Future<List<Event>> fetchUpcomingEvents() async {
    try {
      final response = await _client
          .from('events')
          .select()
          .eq('is_published', true)
          .order('event_date', ascending: false)
          .limit(3);

      return (response as List)
          .map((e) => Event.fromMap(e))
          .toList(growable: false);
    } on PostgrestException catch (e) {
      throw Exception(e.message);
    } catch (_) {
      throw Exception('Failed to fetch events.');
    }
  }
}