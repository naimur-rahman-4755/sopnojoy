class EventAdminModel {
  final String id;
  final String title;
  final DateTime eventDate;
  final String? location;
  final String? description;
  final String ctaText;
  final String? ctaUrl;
  final bool isPublished;

  const EventAdminModel({
    required this.id,
    required this.title,
    required this.eventDate,
    this.location,
    this.description,
    required this.ctaText,
    this.ctaUrl,
    required this.isPublished,
  });

  factory EventAdminModel.fromMap(Map<String, dynamic> map) {
    return EventAdminModel(
      id: map['id'],
      title: map['title'],
      eventDate: DateTime.parse(map['event_date']),
      location: map['location'],
      description: map['description'],
      ctaText: map['cta_text'] ?? 'Join This Event',
      ctaUrl: map['cta_url'],
      isPublished: map['is_published'] ?? true,
    );
  }
}