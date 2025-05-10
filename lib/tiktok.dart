import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/routing/app_router.dart';
import 'package:tiktok_clone/core/themes/colors.dart';

import 'core/routing/routes.dart';

class Tiktok extends StatelessWidget {
  final AppRouter appRouter;

  const Tiktok({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.backgroundLightGray,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.navBar,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
