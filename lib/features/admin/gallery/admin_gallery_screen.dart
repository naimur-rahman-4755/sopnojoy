import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/admin_routes.dart';
import '../../../core/constacts/spacing.dart';
import '../../../core/constacts/text_style.dart';
import '../../../core/provider/supabase_provider.dart';
import '../shared/layout/admin_layout.dart';

import 'widgets/upload_image_button.dart';
import 'widgets/gallery_grid.dart';

class GalleryAdminScreen extends ConsumerWidget {
  const GalleryAdminScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagesAsync = ref.watch(galleryImagesProvider);

    return AdminLayout(
      currentRoute: AdminRoutes.gallery,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Gallery Manager", style: AppTextStyles.pageTitle),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    "Manage images shown on public website",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              const Spacer(),
              const UploadImageButton(),
            ],
          ),

          const SizedBox(height: AppSpacing.xl),

          Expanded(
            child: imagesAsync.when(
              loading: () =>
              const Center(child: CircularProgressIndicator()),

              error: (e, _) =>
              const Center(child: Text("Failed to load gallery images")),

              data: (images) {
                if (images.isEmpty) {
                  return const Center(
                    child: Text(
                      "Gallery is empty. Upload your first image.",
                    ),
                  );
                }

                return GalleryGrid(images: images);
              },
            ),
          ),
        ],
      ),
    );
  }
}