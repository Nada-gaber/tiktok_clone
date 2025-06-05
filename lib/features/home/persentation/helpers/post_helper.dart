import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../posts/data/model/post_model.dart';
import 'handle_image_selection.dart';


typedef OnPostCreated = void Function(Post post);

Future<void> pickImageAndCreatePost({
  required BuildContext context,
  required OnPostCreated onPostCreated,
}) async {
  // Early return if context is not mounted
  if (!context.mounted) {
    debugPrint('Error: Context is not mounted at the start of pickImageAndCreatePost');
    return;
  }

  final ImagePicker picker = ImagePicker();

  // Show bottom sheet for choosing image source
  await showModalBottomSheet(
    context: context,
    builder: (BuildContext bottomSheetContext) {
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () async {
                  Navigator.pop(bottomSheetContext); // Close the bottom sheet
                  if (context.mounted) {
                    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                    await handleImageSelection(context, image, onPostCreated);
                  } else {
                    debugPrint('Error: Context is not mounted after gallery selection');
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Photo'),
                onTap: () async {
                  Navigator.pop(bottomSheetContext); // Close the bottom sheet
                  if (context.mounted) {
                    final XFile? image = await picker.pickImage(source: ImageSource.camera);
                    await handleImageSelection(context, image, onPostCreated);
                  } else {
                    debugPrint('Error: Context is not mounted after camera selection');
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.cancel),
                title: const Text('Cancel'),
                onTap: () => Navigator.pop(bottomSheetContext),
              ),
            ],
          ),
        ),
      );
    },
  );
}
