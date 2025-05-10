import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/routing/routes.dart';
import 'package:tiktok_clone/features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/home/persentation/screens/home_screen.dart';
import '../../features/home/persentation/screens/nav_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

        case Routes.navBar:
        return MaterialPageRoute(
          builder: (context) => const NavScreen(),
        );
        case Routes.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
    }
    return null;
  }
}
