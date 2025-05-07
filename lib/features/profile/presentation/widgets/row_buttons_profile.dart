
import 'package:flutter/material.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/themes/font_weight_helper.dart';

class RowButtonProfile extends StatelessWidget {
  const RowButtonProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {
            print('Edit Profile');
          },
          color: AppColors.buttonSecondaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Text(
            'Edit Profile',
            style: AppFonts.semiBold,
          ),
        ),
        const SizedBox(width: 20),
        MaterialButton(
          onPressed: () {
            print('Edit Profile');
          },
          color: AppColors.buttonSecondaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Text(
            'Share Profile',
            style: AppFonts.semiBold,
          ),
        ),
      ],
    );
  }
}
