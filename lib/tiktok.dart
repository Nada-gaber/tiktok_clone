import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/routing/app_router.dart';
import 'package:tiktok_clone/core/themes/colors.dart';
import 'core/routing/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tiktok extends StatefulWidget {
  final AppRouter appRouter;

  const Tiktok({super.key, required this.appRouter});

  @override
  _TiktokState createState() => _TiktokState();
}

class _TiktokState extends State<Tiktok> {
  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    if (isFirstLaunch) {
      await prefs.setBool('isFirstLaunch', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: SharedPreferences.getInstance()
          .then((prefs) => prefs.getBool('isFirstLaunch') ?? true),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        String initialRoute =
            snapshot.data! ? Routes.onBoarding : Routes.navBar;

        return MaterialApp(
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: AppColors.backgroundLightGray,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute,
          onGenerateRoute: widget.appRouter.generateRoute,
        );
      },
    );
  }
}
