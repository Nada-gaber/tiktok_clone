import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      primaryColor: AppColors.lightButtonColor,
      colorScheme: ColorScheme.light(
        primary: AppColors.lightButtonColor,
        secondary: AppColors.lightButtonSecondary,
        error: AppColors.lightErrorColor,
        surface: AppColors.lightCardBackground,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.lightTextPrimary),
        bodyMedium: TextStyle(color: AppColors.lightTextSecondary),
        titleLarge: TextStyle(color: AppColors.lightTextPrimary),
        labelSmall: TextStyle(color: AppColors.lightTextPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.lightButtonTextColor,
          backgroundColor: AppColors.lightButtonColor,
          disabledForegroundColor: AppColors.lightButtonTextColor.withOpacity(0.7),
          disabledBackgroundColor: AppColors.lightButtonColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.lightTextPrimary,
          backgroundColor: AppColors.lightButtonSecondary,
          side: BorderSide(color: AppColors.lightBorderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightBorderColor),
        ),
        filled: true,
        fillColor: AppColors.lightInputFieldBackground,
        labelStyle: TextStyle(color: AppColors.lightTextSecondary),
        hintStyle: TextStyle(color: AppColors.lightTextSecondary),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightAppBarBackground,
        foregroundColor: AppColors.lightTextPrimary,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightCardBackground,
        selectedItemColor: AppColors.lightTextPrimary,
        unselectedItemColor: AppColors.lightTextSecondary,
      ),
      dividerColor: AppColors.lightDividerColor,
      iconTheme: IconThemeData(color: AppColors.lightIconColor),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      primaryColor: AppColors.darkButtonColor,
      colorScheme: ColorScheme.dark(
        primary: AppColors.darkButtonColor,
        secondary: AppColors.darkButtonSecondary,
        error: AppColors.darkErrorColor,
        surface: AppColors.darkCardBackground,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.darkTextPrimary),
        bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
        titleLarge: TextStyle(color: AppColors.darkTextPrimary),
        labelSmall: TextStyle(color: AppColors.darkTextPrimary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.darkButtonTextColor,
          backgroundColor: AppColors.darkButtonColor,
          disabledForegroundColor: AppColors.darkButtonTextColor.withOpacity(0.7),
          disabledBackgroundColor: AppColors.darkButtonColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.darkTextPrimary,
          backgroundColor: AppColors.darkButtonSecondary,
          side: BorderSide(color: AppColors.darkBorderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.darkBorderColor),
        ),
        filled: true,
        fillColor: AppColors.darkInputFieldBackground,
        labelStyle: TextStyle(color: AppColors.darkTextSecondary),
        hintStyle: TextStyle(color: AppColors.darkTextSecondary),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkAppBarBackground,
        foregroundColor: AppColors.darkTextPrimary,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkCardBackground,
        selectedItemColor: AppColors.darkTextPrimary,
        unselectedItemColor: AppColors.darkTextSecondary,
      ),
      dividerColor: AppColors.darkDividerColor,
      iconTheme: IconThemeData(color: AppColors.darkIconColor),
    );
  }
}