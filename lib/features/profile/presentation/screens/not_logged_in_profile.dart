import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok_clone/core/themes/colors.dart';

import '../../../../core/themes/images.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../auth/presentation/screens/login_screen.dart';

class NotLoggedInProfile extends StatelessWidget {
  const NotLoggedInProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            height: 80,
            AppAssets.profileIcon,
            color: AppColors.textSecondary,
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text('Log into existing account'),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomButtonWidget(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: AppColors.backgroundLightGray,

                context: context,
                isScrollControlled:
                    true, // Important for full height + keyboard support
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) => const LoginSheet(),
              );
            },
            buttonText: 'Login',
            padding: 0,
            minWidth: 260,
          ),
        ],
      ),
    );
  }
}
