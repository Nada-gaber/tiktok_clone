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
    this.color = Colors.white,
  });

  final String? iconString;
  final String? assetName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
           padding: EdgeInsets.zero,
          onPressed: () => log('Liked!'),
          icon: SvgPicture.asset(
            assetName ?? AppAssets.heartIcon,
            colorFilter:  ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
            width: 45,
            height: 45,
          ),
        ),
        Text(
          iconString ?? "0",
          style: AppFonts.regular (context),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
