import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/themes/app_sizes.dart';
import 'package:tiktok_clone/core/themes/colors.dart';
import 'package:tiktok_clone/core/themes/theme_cubit.dart';

import 'images.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDarkMode = themeMode == ThemeMode.dark;
        return GestureDetector(
          onTap: () => context.read<ThemeCubit>().toggleTheme(),
          child: Container(
            margin: EdgeInsets.only(right: AppSizes.paddingSmall(context)),
            padding: EdgeInsets.all(AppSizes.paddingSmall(context)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.getButtonBackgroundColor(context),
                  AppColors.getButtonSecondaryBackgroundColor(context),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.getShadowColor(context),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Image.asset(
              isDarkMode
                  ? AppAssets.lightThemeIcon
                  : AppAssets.darkThemeIcon, // Define these in AppAssets
              width: AppSizes.iconSizeSmall(context),
              height: AppSizes.iconSizeSmall(context),
              color: AppColors.getButtonTextColor(context),
            ),
          ),
        );
      },
    );
  }
}
