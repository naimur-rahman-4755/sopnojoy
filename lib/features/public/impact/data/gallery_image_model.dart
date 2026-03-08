import 'package:flutter/foundation.dart';

@immutable
class GalleryImage {
  const GalleryImage({
    required this.id,
    required this.imageUrl,
    required this.imagePath,
    this.title,
    required this.createdAt,
  });

  final String id;
  final String imageUrl;
  final String imagePath;
  final String? title;
  final DateTime createdAt;

  factory GalleryImage.fromMap(Map<String, dynamic> map) {
    return GalleryImage(
      id: map['id'] as String,
      imageUrl: map['image_url'] as String,
      imagePath: map['image_path'] as String,
      title: map['title'] as String?,
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image_url': imageUrl,
      'image_path': imagePath,
      'title': title,
      'created_at': createdAt.toIso8601String(),
    };
  }
}