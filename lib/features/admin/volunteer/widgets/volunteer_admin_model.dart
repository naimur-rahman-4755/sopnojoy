class VolunteerAdminModel {
  final String id;
  final String fullName;
  final String phone;
  final String email;
  final String areaOfInterest;
  final String status;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const VolunteerAdminModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.areaOfInterest,
    required this.status,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VolunteerAdminModel.fromMap(Map<String, dynamic> map) {
    return VolunteerAdminModel(
      id: map['id'],
      fullName: map['full_name'],
      phone: map['phone'],
      email: map['email'],
      areaOfInterest: map['area_of_interest'],
      status: map['status'],
      notes: map['notes'],
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'phone': phone,
      'email': email,
      'area_of_interest': areaOfInterest,
      'status': status,
      'notes': notes,
    };
  }

  VolunteerAdminModel copyWith({
    String? status,
    String? notes,
  }) {
    return VolunteerAdminModel(
      id: id,
      fullName: fullName,
      phone: phone,
      email: email,
      areaOfInterest: areaOfInterest,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}