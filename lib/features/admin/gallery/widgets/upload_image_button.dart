import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/provider/supabase_provider.dart';

class UploadImageButton extends ConsumerWidget {
  const UploadImageButton({super.key});

  Future<void> _upload(BuildContext context, WidgetRef ref) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result == null) return;

    final file = result.files.first;

    if (file.size > 5 * 1024 * 1024) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Max file size 5MB")),
      );
      return;
    }

    final Uint8List bytes = file.bytes!;
    final fileName = file.name;

    final service = ref.read(supabaseServiceProvider);

    try {
      await service.uploadGalleryImage(
        fileName: fileName,
        bytes: bytes,
      );

      ref.invalidate(galleryImagesProvider);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Image uploaded successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Upload failed: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => _upload(context, ref),
      icon: const Icon(Icons.upload),
      label: const Text("Upload Image"),
    );
  }
}