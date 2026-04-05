class AdminMessage {
  final String id;
  final String name;
  final String email;
  final String message;
  final String? adminNotes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AdminMessage({
    required this.id,
    required this.name,
    required this.email,
    required this.message,
    this.adminNotes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdminMessage.fromMap(Map<String, dynamic> map) {
    return AdminMessage(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      message: map['message'],
      adminNotes: map['admin_notes'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  AdminMessage copyWith({
    String? status,
    String? adminNotes,
  }) {
    return AdminMessage(
      id: id,
      name: name,
      email: email,
      message: message,
      adminNotes: adminNotes ?? this.adminNotes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}