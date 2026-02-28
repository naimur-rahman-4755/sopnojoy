class ImpactMetric {
  final String id;
  final String key;
  final String title;
  final int value;
  final String suffix;
  final String? icon;
  final bool isActive;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ImpactMetric({
    required this.id,
    required this.key,
    required this.title,
    required this.value,
    required this.suffix,
    required this.icon,
    required this.isActive,
    required this.sortOrder,
    required this.createdAt,
    required this.updatedAt,
  });

  String get formattedValue => '$value$suffix';

  factory ImpactMetric.fromMap(Map<String, dynamic> map) {
    return ImpactMetric(
      id: map['id'] as String,
      key: map['key'] as String,
      title: map['title'] as String,
      value: (map['value'] as num).toInt(),
      suffix: map['suffix'] as String? ?? '+',
      icon: map['icon'] as String?,
      isActive: map['is_active'] as bool,
      sortOrder: map['sort_order'] as int,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }
}