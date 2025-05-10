import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/core/widgets/shared_button.dart';

class CustomUploadButton extends StatelessWidget {
  const CustomUploadButton({super.key});

  void _pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image selected: ${image.name}'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No image selected'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      onPressed: () => _pickImage(context),
      buttonText: 'Upload Image',
      padding: 0,
      minWidth: 100,
    );
  }
}
