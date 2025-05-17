import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../posts/data/model/post_model.dart';
import '../../../posts/presentation/screens/create_post_screen.dart';

typedef OnPostCreated = void Function(Post post);

Future<void> pickImageAndCreatePost({
  required BuildContext context,
  required OnPostCreated onPostCreated,
}) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    final File imageFile = File(image.path);
    final newPost = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CreatePostScreen(imageFile: imageFile),
      ),
    );

    if (newPost != null && newPost is Post) {
      onPostCreated(newPost);
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('No image selected')),
    );
  }
}
