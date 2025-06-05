import 'package:flutter/material.dart';
import '../themes/app_sizes.dart';
import '../themes/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final double padding;
  final double minWidth;
  final Color buttonColor;
  final Color textColor;
  final Color disabledButtonColor; // Added for disabled state
  final Color disabledTextColor; // Added for disabled state
  final double buttonHeight;

  const CustomButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.padding = 8.0,
    this.minWidth = 200.0,
    this.buttonColor = AppColors.buttonColor,
    this.textColor = Colors.white,
    this.disabledButtonColor =
         AppColors.buttonSecondaryColor, // Light grey for disabled button
    this.disabledTextColor =
         AppColors.backgroundDarkBlue, // Dark grey for disabled text
    this.buttonHeight = 45.0,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      disabledColor: disabledButtonColor, 
      elevation: 0,
      minWidth: minWidth,
      height:
          AppSizes.height(context, buttonHeight / 812), // Proportional height
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.paddingSmall(context)),
        child: Text(
          buttonText,
          style: TextStyle(
            color: onPressed != null ? textColor : disabledTextColor,
          ),
        ),
      ),
    );
  }
}
