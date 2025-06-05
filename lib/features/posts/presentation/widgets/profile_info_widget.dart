
import 'package:flutter/material.dart';

import '../../../../core/themes/font_weight_helper.dart';
import '../../../../core/themes/images.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
       const  CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(AppAssets.profileIcon),
        ),
       const SizedBox(
          width: 10,
        ),
        Text(
          'User Name',
          style: AppFonts.semiBold (context),
        ),
      ],
    );
  }
}
