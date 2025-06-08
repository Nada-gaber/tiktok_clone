import 'package:flutter/material.dart';
class AppColors {
  // Light theme colors
  static const Color lightBackground = Color(0xFFF8F8F8);
  static const Color lightCardBackground = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF000000);
  static const Color lightTextSecondary = Color(0xFF666666);
  static const Color lightButtonSecondary = Color(0xFFEBEBEB);
  static const Color lightIconColor = Color(0xFF000000);
  static const Color lightButtonColor = Color(0xFFFE2C55);
  static const Color lightButtonTextColor = Color(0xFFFFFFFF);
  static const Color lightBorderColor = Color(0xFFE0E0E0);
  static const Color lightErrorColor = Color(0xFFFB4C5D);
  static const Color lightDividerColor = Color(0xFFE0E0E0);
  static const Color lightShadowColor = Color(0x1F000000);
  static const Color lightSuccessColor = Color(0xFF00C853);
  static const Color lightInputFieldBackground = Color(0xFFF5F5F5);
  static const Color lightAppBarBackground = Color(0xFFFFFFFF);

  // Dark theme colors
  static const Color darkBackground = Color(0xFF0F0F0F);
  static const Color darkCardBackground = Color(0xFF1C1C1E);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFAAAAAA);
  static const Color darkButtonSecondary = Color(0xFF3C3C3E);
  static const Color darkIconColor = Color(0xFFFFFFFF);
  static const Color darkButtonColor = Color(0xFFFE2C55);
  static const Color darkButtonTextColor = Color(0xFFFFFFFF);
  static const Color darkBorderColor = Color(0xFF3C3C3E);
  static const Color darkErrorColor = Color(0xFFFB4C5D);
  static const Color darkDividerColor = Color(0xFF3C3C3E);
  static const Color darkShadowColor = Color(0x1FFFFFFF);
  static const Color darkSuccessColor = Color(0xFF00C853);
  static const Color darkInputFieldBackground = Color(0xFF2C2C2E);
  static const Color darkAppBarBackground = Color(0xFF1C1C1E);

  // Utility methods for theme-aware colors
  static Color getNavBarBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkCardBackground
        : lightCardBackground;
  }

  static Color getNavBarBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBorderColor
        : lightBorderColor;
  }

  static Color getNavItemSelectedColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextPrimary
        : lightTextPrimary;
  }

  static Color getNavItemUnselectedColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextSecondary
        : lightTextSecondary;
  }

  static Color getAddButtonColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkIconColor
        : lightIconColor;
  }

  static Color getButtonTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkButtonTextColor
        : lightButtonTextColor;
  }

  static Color getButtonBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkButtonColor
        :  lightButtonColor;
  }

  static Color getButtonSecondaryBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkButtonSecondary
        : lightButtonSecondary;
  }

  static Color getTextPrimary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextPrimary
        : lightTextPrimary;
  }

  static Color getTextSecondary(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextSecondary
        : lightTextSecondary;
  }

  static Color getModalBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkCardBackground
        : lightCardBackground;
  }

  static Color getDividerColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkDividerColor
        : lightDividerColor;
  }

  static Color getOutlinedButtonBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBorderColor
        : lightBorderColor;
  }
  static Color getShadowColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkShadowColor
        : lightShadowColor;
  }
}