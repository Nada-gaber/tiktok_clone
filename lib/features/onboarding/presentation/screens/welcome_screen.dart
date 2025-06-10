import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tiktok_clone/core/routing/routes.dart';
import 'package:tiktok_clone/core/themes/images.dart';
import 'package:tiktok_clone/core/widgets/shared_button.dart';
import '../widgets/rich_text_terms.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Future<void> _requestMediaPermissions() async {
    // Request camera, photos, and videos permissions
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.photos,
      Permission.videos,
    ].request();

    if (mounted) {
      bool allGranted = statuses.values.every((status) => status.isGranted);
      if (allGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Camera, photos, and videos access granted!')),
        );
        Navigator.pushReplacementNamed(context, Routes.navBar);
      } else {
        // If any permission is denied, inform the user via SnackBar (optional)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Some permissions were denied. Please enable them in settings.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to TikTok',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Videos to make your day',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                AppAssets.mediaOnboarding,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              const TermsServicesWidgets(),
              CustomButtonWidget(
                onPressed: () => _requestMediaPermissions(),
                buttonText: 'Agree and continue',
                minWidth: 340,
                buttonHeight: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
