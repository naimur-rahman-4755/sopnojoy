import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sopnojoy/features/public/impact/data/gallery_image_model.dart';
import '../../../../core/constacts/spacing.dart';
import '../../../../core/provider/supabase_provider.dart';
import 'gallery_tile.dart';

class GalleryGrid extends ConsumerWidget {
  const GalleryGrid({
    super.key,
    required this.crossAxisCount, required List<GalleryImage> images,
  });

  final int crossAxisCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesAsync = ref.watch(galleryImagesProvider);

    return imagesAsync.when(
      loading: () => const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.xl),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),

      error: (error, _) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Center(
            child: Text(
              'Failed to load gallery images',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),

      data: (images) {
        if (images.isEmpty) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.xl),
              child: Center(
                child: Text('No images available'),
              ),
            ),
          );
        }

        return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              final image = images[index];

              return GalleryTile(image: image);
            },
            childCount: images.length,
            addRepaintBoundaries: true,
            addAutomaticKeepAlives: false,
          ),
        );
      },
    );
  }
}