import 'package:flutter/material.dart';

import '../../../../core/constacts/spacing.dart';
import '../../../public/impact/data/gallery_image_model.dart';
import 'gallery_item_card.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({
    super.key,
    required this.images,
  });

  final List<GalleryImage> images;

  int _crossAxisCount(double width) {
    if (width >= 1200) return 4;
    if (width >= 700) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GridView.builder(
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _crossAxisCount(width),
        crossAxisSpacing: AppSpacing.lg,
        mainAxisSpacing: AppSpacing.lg,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return GalleryItemCard(image: images[index]);
      },
    );
  }
}