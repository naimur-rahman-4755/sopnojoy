import 'package:flutter/material.dart';
import '../../../../core/constacts/spacing.dart';
import '../data/gallery_image_model.dart';

class GalleryTile extends StatelessWidget {
  const GalleryTile({
    super.key,
    required this.image,
  });

  final GalleryImage image;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        child: Image.network(
          image.imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,

          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;

            return const Center(
              child: CircularProgressIndicator(),
            );
          },

          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade200,
              child: const Center(
                child: Icon(Icons.broken_image),
              ),
            );
          },
        ),
      ),
    );
  }
}