import 'package:flutter/material.dart';
import 'app_sizes.dart';
import 'colors.dart';

class AppFonts {
  static TextStyle regular(BuildContext context) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: AppSizes.fontRegular(context),
      );

  static TextStyle bold(BuildContext context) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: AppSizes.fontMedium(context),
      );

  static TextStyle extraBold(BuildContext context) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w800,
        fontSize: AppSizes.fontLarge(context),
      );

  static TextStyle semiBold(BuildContext context) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: AppSizes.fontMedium(context),
      );

  static TextStyle light(BuildContext context) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontSize: AppSizes.fontRegular(context),
      );

  static TextStyle italic(BuildContext context) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        fontSize: AppSizes.fontRegular(context),
      );

  static TextStyle caption(BuildContext context) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontSize: AppSizes.fontSmall(context),
      );

  static TextStyle button(BuildContext context) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: AppSizes.fontRegular(context),
      //  color: Colors.white,
      );

  static TextStyle title(BuildContext context) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: AppSizes.fontLarge(context),
      );

  static TextStyle head(BuildContext context) => TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w800,
        fontSize: AppSizes.fontExtraLarge(context),
        color: 
        AppColors.getTextPrimary(context)
      );
}