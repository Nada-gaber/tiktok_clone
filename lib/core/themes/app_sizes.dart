import 'package:flutter/material.dart';

class AppSizes {
  static double width(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.width * fraction;
  }

  static double height(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.height * fraction;
  }

  static double font(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.width * fraction;
  }

  static double paddingSmall(BuildContext context) => width(context, 0.02); // ~2% of screen width
  static double paddingMedium(BuildContext context) => width(context, 0.04); // ~4% of screen width
  static double paddingLarge(BuildContext context) => width(context, 0.06); // ~6% of screen width
  static double fontSmall(BuildContext context) => font(context, 0.03); // ~3% of screen width
  static double fontRegular(BuildContext context) => font(context, 0.035); // ~3.5% of screen width
  static double fontMedium(BuildContext context) => font(context, 0.04); // ~4% of screen width
  static double fontLarge(BuildContext context) => font(context, 0.045); // ~4.5% of screen width
  static double fontExtraLarge(BuildContext context) => font(context, 0.08); // ~8% of screen width
  static double buttonWidthHalf(BuildContext context) => width(context, 0.5);
  static double buttonWidthFourth(BuildContext context) => width(context, 0.4);

  static double buttonWidthThird(BuildContext context) => width(context, 0.33);
  static double buttonHeight(BuildContext context) => height(context, 0.07);
  static double iconSizeSmall(BuildContext context) => width(context, 0.05); // ~5% of screen width
  static double iconSizeLarge(BuildContext context) => width(context, 0.22); // ~25% of screen width

  static double iconSizeMedium(BuildContext context) => width(context, 0.07); // ~7% of screen width
  static double avatarRadius(BuildContext context) => width(context, 0.13); // ~13% of screen width
  static double tabBarHeight(BuildContext context) => height(context, 0.5); // ~50% of screen height
  static double imageHeightMedium(BuildContext context) => height(context, 0.4); // ~40% of screen height
  static double gridSpacing(BuildContext context) => width(context, 0.01); // ~1% of screen width
}