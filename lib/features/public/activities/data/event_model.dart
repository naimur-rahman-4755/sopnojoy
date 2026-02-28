class Event {
  final String id;
  final String title;
  final DateTime eventDate;
  final String? location;
  final String? description;
  final String ctaText;
  final String? ctaUrl;
  final String? coverImageUrl;

  const Event({
    required this.id,
    required this.title,
    required this.eventDate,
    this.location,
    this.description,
    required this.ctaText,
    this.ctaUrl,
    this.coverImageUrl,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as String,
      title: map['title'] as String,
      eventDate: DateTime.parse(map['event_date'] as String),
      location: map['location'] as String?,
      description: map['description'] as String?,
      ctaText: map['cta_text'] as String? ?? 'Join This Event',
      ctaUrl: map['cta_url'] as String?,
      coverImageUrl: map['cover_image_url'] as String?,
    );
  }
}