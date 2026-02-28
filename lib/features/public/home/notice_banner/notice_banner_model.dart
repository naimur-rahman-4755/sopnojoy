class Notice {
  final String id;
  final String label;
  final String message;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final bool isActive;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Notice({
    required this.id,
    required this.label,
    required this.message,
    required this.startsAt,
    required this.endsAt,
    required this.isActive,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notice.fromMap(Map<String, dynamic> map) {
    return Notice(
      id: map['id'] as String,
      label: map['label'] as String,
      message: map['message'] as String,
      startsAt: map['starts_at'] != null
          ? DateTime.parse(map['starts_at'])
          : null,
      endsAt: map['ends_at'] != null
          ? DateTime.parse(map['ends_at'])
          : null,
      isActive: map['is_active'] as bool,
      sortOrder: map['sort_order'] as int,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }
}