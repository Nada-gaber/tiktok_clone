import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/auth/logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:tiktok_clone/features/auth/logic/cubit/auth_cubit/auth_state.dart';

import '../../../../core/themes/app_sizes.dart';
import '../../../../core/themes/font_weight_helper.dart';
import '../../../../core/themes/images.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            authenticated: (user) {
              return Row(
                children: [
                  CircleAvatar(
                    radius: AppSizes.avatarRadius(context) /2.5,
                    backgroundImage: user.photoURL != null &&
                            user.photoURL!.isNotEmpty
                        ? NetworkImage(
                            '${user.photoURL!}?t=${DateTime.now().millisecondsSinceEpoch}')
                        : const AssetImage(AppAssets.defaultProfile)
                            as ImageProvider,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    user.displayName ?? 'User',
                    style: AppFonts.title(context),
                  ),
                ],
              );
            },
            orElse: () {
              return Text(
                'Guest',
                style: AppFonts.title(context),
              );
            },
          );
        },
      ),
    );
  }
}
