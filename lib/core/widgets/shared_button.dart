import 'package:flutter/material.dart';
import '../themes/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final Color? textColor;
  final Color? buttonColor;
  final double buttonHeight;
  final double minWidth;
  final Color? disabledButtonColor;
  final Color? disabledTextColor;
  final double? padding;

  const CustomButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textColor,
    this.buttonColor,
     this.buttonHeight = 45.0,
    this.minWidth = 200.0,
    this.disabledButtonColor,
    this.disabledTextColor,
    this.padding = 8.0,
  });

  // this.padding = 8.0,
  // this.minWidth = 200.0,
  // this.buttonColor = AppColors.buttonColor,
  // this.textColor = Colors.white,
  // this.disabledButtonColor =
  //      AppColors.buttonSecondaryColor, // Light grey for disabled button
  // this.disabledTextColor =
  //      AppColors.backgroundDarkBlue, // Dark grey for disabled text
  // this.buttonHeight = 45.0,

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: minWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor ?? AppColors.getButtonTextColor(context),
          backgroundColor:
              buttonColor ?? AppColors.getButtonBackgroundColor(context),
          disabledForegroundColor: disabledTextColor ??
              AppColors.getButtonTextColor(context).withOpacity(0.7),
          disabledBackgroundColor: disabledButtonColor ??
              AppColors.getButtonBackgroundColor(context).withOpacity(0.5),
          padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: onPressed != null
                    ? (textColor ?? AppColors.getButtonTextColor(context))
                    : (disabledTextColor ??
                        AppColors.getButtonTextColor(context).withOpacity(0.7)),
              ),
        ),
      ),
    );
  }
}
