class ContactMessage {
  final String name;
  final String email;
  final String message;

  const ContactMessage({
    required this.name,
    required this.email,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name.trim(),
      'email': email.trim(),
      'message': message.trim(),
    };
  }
}