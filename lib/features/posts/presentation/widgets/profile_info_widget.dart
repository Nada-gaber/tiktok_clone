
import 'package:flutter/material.dart';

import '../../../../core/themes/font_weight_helper.dart';
import '../../../../core/themes/images.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(AppAssets.profileIcon),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'User Name',
          style: AppFonts.semiBold,
        ),
      ],
    );
  }
}
