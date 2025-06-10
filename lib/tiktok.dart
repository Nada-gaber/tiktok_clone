import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/themes/app_theme.dart';
import 'core/themes/theme_cubit.dart';

class Tiktok extends StatelessWidget {
  final bool isFirstLaunch;

  const Tiktok({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          final initialRoute = isFirstLaunch ? Routes.onBoarding : Routes.navBar;
          return MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            initialRoute: initialRoute,
            onGenerateRoute: AppRouter().generateRoute,
          );
        },
      ),
    );
  }
}