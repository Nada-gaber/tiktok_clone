import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/routing/app_router.dart';

import 'core/routing/routes.dart';

class Tiktok extends StatelessWidget {
  final AppRouter appRouter;

  const Tiktok({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: user != null ? Routes.navBar : Routes.login,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
