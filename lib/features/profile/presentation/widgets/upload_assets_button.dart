import 'package:flutter/material.dart';
import '../../../../core/themes/app_sizes.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../home/persentation/helpers/post_helper.dart';
import '../../../posts/data/model/post_model.dart';

typedef OnPostCreated = void Function(Post post);

class CustomUploadButton extends StatelessWidget {
  final OnPostCreated onPostCreated;

  const CustomUploadButton({super.key, required this.onPostCreated});

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(
      onPressed: () => pickImageAndCreatePost(
        context: context,
        onPostCreated: onPostCreated,
      ),
      buttonText: 'Create Post',
      minWidth: AppSizes.buttonWidthHalf(context),
      buttonHeight: AppSizes.buttonHeight(context),
    );
  }
}