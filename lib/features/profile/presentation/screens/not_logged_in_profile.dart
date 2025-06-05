import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok_clone/core/themes/colors.dart';
import '../../../../core/themes/app_sizes.dart';
import '../../../../core/themes/font_weight_helper.dart';
import '../../../../core/themes/images.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../auth/logic/cubit/auth_cubit/auth_cubit.dart';
import '../../../auth/presentation/screens/login_screen.dart';

class NotLoggedInProfile extends StatelessWidget {
  const NotLoggedInProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: AppFonts.title(context)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            height: AppSizes.iconSizeLarge(context),
            AppAssets.profileIcon,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: AppSizes.paddingMedium(context)),
          Center(
            child: Text(
              'Log into existing account',
              style: AppFonts.regular(context)
              .copyWith(color: Colors.black),
            ),
          ),
          SizedBox(height: AppSizes.paddingSmall(context)),
          CustomButtonWidget(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: AppColors.backgroundLightGray,
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppSizes.paddingMedium(context)),
                  ),
                ),
                builder: (context) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const LoginSheet(),
                ),
              );
            },
            buttonText: 'Login',
            minWidth: AppSizes.buttonWidthHalf(context),
            padding: AppSizes.paddingSmall(context),
            buttonHeight: AppSizes.buttonHeight(context),
          ),
        ],
      ),
    );
  }
}