import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/themes/font_weight_helper.dart';
import '../../../../core/themes/images.dart';

class ReelIconButton extends StatelessWidget {
  const ReelIconButton({
    super.key,
    required this.iconString,
    required this.assetName,
  });

  final String? iconString;
  final String? assetName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
           padding: EdgeInsets.zero,
          onPressed: () => log('Liked!'),
          icon: SvgPicture.asset(
            assetName ?? AppAssets.heartIcon,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            width: 45,
            height: 45,
          ),
        ),
        Text(
          iconString ?? "0",
          style: AppFonts.regular,
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
