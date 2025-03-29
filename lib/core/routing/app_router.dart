import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/routing/routes.dart';
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
    }
    return null;
  }
}
