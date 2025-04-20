import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tiktok_clone/core/routing/app_router.dart';
import 'package:tiktok_clone/core/themes/colors.dart';
import 'package:tiktok_clone/tiktok.dart';

import 'core/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".tiktok.env");

  setupGetIt();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.backgroundDarkBlue,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));

  runApp(Tiktok(
    appRouter: AppRouter(),
  ));
}
