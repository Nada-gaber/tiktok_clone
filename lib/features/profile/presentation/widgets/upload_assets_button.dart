
import 'package:flutter/material.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/themes/font_weight_helper.dart';

class CustomUploadButton extends StatelessWidget {
  const CustomUploadButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        print('Upload Photo');
      },
      color: AppColors.buttonColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Upload',
          style: AppFonts.semiBold.copyWith(
            color: AppColors.backgroundLightGray,
          ),
        ),
      ),
    );
  }
}
