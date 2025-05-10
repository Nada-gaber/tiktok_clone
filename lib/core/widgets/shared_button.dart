import 'package:flutter/material.dart';

import '../themes/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final double padding;
  final double minWidth;
  const CustomButtonWidget(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.padding = 8.0,
      this.minWidth = 200.0});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.buttonColor,
      elevation: 0,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
