
import 'package:shared_preferences/shared_preferences.dart';

class LaunchUtils {
  static Future<bool> checkFirstLaunch() async {
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
}