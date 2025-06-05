
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/features/home/persentation/helpers/post_helper.dart';

import '../../../posts/data/model/post_model.dart';
import '../../../posts/presentation/screens/create_post_screen.dart';
Future<void> handleImageSelection(
  BuildContext context,
  XFile? image,
  OnPostCreated onPostCreated,
) async {
  if (!context.mounted) {
    debugPrint('Error: Context is not mounted at the start of _handleImageSelection');
    return;
  }

  if (image != null && image.path.isNotEmpty) {
    try {
      final File imageFile = File(image.path);
      if (await imageFile.exists()) {
        if (context.mounted) {
          final newPost = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CreatePostScreen(imageFile: imageFile),
            ),
          );

          if (context.mounted && newPost != null && newPost is Post) {
            onPostCreated(newPost);
          } else if (!context.mounted) {
            debugPrint('Error: Context is not mounted after Navigator.push');
          }
        } else {
          debugPrint('Error: Context is not mounted before Navigator.push');
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Selected image file is invalid')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error processing image: $e')),
        );
      }
    }
  } else {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }
}