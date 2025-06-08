import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/app_sizes.dart';
import '../../../../core/themes/colors.dart';
import '../../../auth/logic/cubit/auth_cubit/auth_cubit.dart';

class LogoutIconButton extends StatelessWidget {
  const LogoutIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.logout,
        size: AppSizes.iconSizeSmall(context),
        color: Colors.white, // TikTok-like white icon for contrast
      ),
      onPressed: () async {
        // Show TikTok-style confirmation dialog
        final bool? confirmLogout = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          barrierColor:
              Colors.black.withOpacity(0.7), // Dark, semi-transparent overlay
          builder: (BuildContext dialogContext) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              backgroundColor: Colors.grey[900], // Dark background like TikTok
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title with bold, modern font
                    const Text(
                      'Log Out?',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text for contrast
                        fontFamily:
                            'Helvetica', // Modern font (ensure available or use default)
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Message with subtle grey text
                    Text(
                      'Are you sure you want to log out?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    // Buttons with TikTok-like styling
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Cancel button
                        TextButton(
                          onPressed: () =>
                              Navigator.of(dialogContext).pop(false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[800], // Subtle dark button
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        // Logout button with TikTok's vibrant accent
      TextButton(
        onPressed: () =>
            Navigator.of(dialogContext).pop(true),
        child: Builder(
          builder: (context) {
            final colorScheme = Theme.of(context).colorScheme;
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.onPrimary, // Theme-aware start color
                    colorScheme.onSecondary, // Theme-aware end color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
        ),
      ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );

        // Proceed with logout if confirmed
        if (confirmLogout == true && context.mounted) {
          context.read<AuthCubit>().signOut();
        }
      },
    );
  }
}