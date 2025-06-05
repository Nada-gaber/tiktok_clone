import 'package:flutter/material.dart';
import '../../../../core/themes/app_sizes.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../home/persentation/helpers/post_helper.dart';
class CustomUploadButton extends StatefulWidget {
  final OnPostCreated onPostCreated;

  const CustomUploadButton({super.key, required this.onPostCreated});

  @override
    State<CustomUploadButton> createState() => _CustomUploadButtonState();
}

class _CustomUploadButtonState extends State<CustomUploadButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      onPressed: _isLoading
          ? null // Disable button when loading
          : () async {
              setState(() => _isLoading = true);
              await pickImageAndCreatePost(
                context: context,
                onPostCreated: widget.onPostCreated,
              );
              if (mounted) {
                setState(() => _isLoading = false);
              }
            },
      buttonText: 'Create Post',
      minWidth: AppSizes.buttonWidthHalf(context),
      buttonHeight: AppSizes.buttonHeight(context),
    );
  }
}