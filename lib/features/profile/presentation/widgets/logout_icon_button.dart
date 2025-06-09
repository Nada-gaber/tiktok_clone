import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/themes/colors.dart';

import '../../../../core/themes/app_sizes.dart';
import '../../../../core/themes/font_weight_helper.dart';
import '../../../auth/logic/cubit/auth_cubit/auth_cubit.dart';

class LogoutIconButton extends StatelessWidget {
  const LogoutIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.logout,
        size: AppSizes.iconSizeSmall(context),
      ),
      onPressed: () async {
        // Show TikTok-style confirmation dialog
        final bool? confirmLogout = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext dialogContext) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Log Out?',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Message with subtle grey text
                    const Text(
                      'Are you sure you want to log out?',
                      style: TextStyle(
                        fontSize: 16,
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
                              color:
                                  AppColors.getButtonSecondaryBackgroundColor(
                                      context),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Cancel',
                              style: AppFonts.regular(context).copyWith(
                                color: AppColors.getTextPrimary(context),
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
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.getButtonBackgroundColor(
                                      context),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  'Log Out',
                                  style: AppFonts.regular(context).copyWith(
                                    color:
                                        AppColors.getButtonTextColor(context),
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
