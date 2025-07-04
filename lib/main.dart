import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/tiktok.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/helpers/first_launch.dart';
import 'features/posts/data/model/post_model.dart';
import 'firebase_options.dart';
import 'core/di/dependency_injection.dart';

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
  final isFirstLaunch = await LaunchUtils.checkFirstLaunch();
  runApp(Tiktok(isFirstLaunch: isFirstLaunch));
}
