import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/tiktok.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/posts/data/model/post_model.dart';
import 'firebase_options.dart';
import 'core/di/dependency_injection.dart';

Future<bool> _checkFirstLaunch() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
    if (isFirstLaunch) {
      await prefs.setBool('isFirstLaunch', false);
    }
    return isFirstLaunch;
  } catch (e) {
    return true; // Default to onboarding on error
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".tiktok.env");
  await Hive.initFlutter();
  Hive.registerAdapter(PostAdapter());
  await Hive.openBox<Post>('posts');
  setupGetIt();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final isFirstLaunch = await _checkFirstLaunch(); // Perform check once
  runApp(Tiktok(isFirstLaunch: isFirstLaunch));
}
