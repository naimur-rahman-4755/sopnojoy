import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constacts/spacing.dart';
import '../../../../core/provider/supabase_provider.dart';
import '../../../public/impact/data/gallery_image_model.dart';

class GalleryItemCard extends ConsumerWidget {
  const GalleryItemCard({
    super.key,
    required this.image,
  });

  final GalleryImage image;

  Future<void> _deleteImage(BuildContext context, WidgetRef ref) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Image"),
        content: const Text(
            "Are you sure you want to delete this image?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel")),
          ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Delete")),
        ],
      ),
    );

    if (confirm != true) return;

    final service = ref.read(supabaseServiceProvider);

    try {
      await service.deleteGalleryImage(image);

      ref.invalidate(galleryImagesProvider);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Image deleted")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RepaintBoundary(
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                image.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(
                      child: CircularProgressIndicator());
                },
                errorBuilder: (_, __, ___) => const Center(
                  child: Icon(Icons.broken_image),
                ),
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.delete,
                      color: Colors.white, size: 18),
                  onPressed: () => _deleteImage(context, ref),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}