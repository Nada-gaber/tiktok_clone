import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/routing/routes.dart';
import 'package:tiktok_clone/features/onboarding/screens/onboarding_screens.dart';
import 'package:tiktok_clone/features/profile/logic/cubit/auth/auth_cubit.dart';
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
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const NavScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterSheet(),
        );

      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreens(),
        );
    }
    return null;
  }
}
