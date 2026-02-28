class VolunteerApplication {
  final String fullName;
  final String phone;
  final String email;
  final String areaOfInterest;
  final String status;
  final String? notes;

  const VolunteerApplication({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.areaOfInterest,
    this.status = 'new',
    this.notes,
  });

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
}