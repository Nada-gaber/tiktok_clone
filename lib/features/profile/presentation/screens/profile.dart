import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/core/di/dependency_injection.dart';
import 'package:tiktok_clone/core/themes/images.dart';
import 'package:tiktok_clone/core/widgets/shared_button.dart';
import 'package:tiktok_clone/features/profile/presentation/screens/not_logged_in_profile.dart';
import '../../../../core/themes/app_sizes.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/font_weight_helper.dart';
import '../../../../core/themes/theme_toggle_button.dart';
import '../../../../core/widgets/loading_tiktok_widget.dart';
import '../../../auth/logic/cubit/auth_cubit/auth_cubit.dart';
import '../../../auth/logic/cubit/auth_cubit/auth_state.dart';
import '../widgets/logout_icon_button.dart';
import '../widgets/profile_tab_bar.dart';
import '../widgets/static_profile_details.dart';
import '../widgets/tab_bar_views_profile.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          unauthenticated: () => const NotLoggedInProfile(),
          authenticated: (user) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Profile', style: AppFonts.title(context)),
                centerTitle: true,
                actions: const [
                  LogoutIconButton(),
                ],
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: AppSizes.paddingMedium(context)),
                      CircleAvatar(
                        radius: AppSizes.avatarRadius(context) / 1.5,
                        backgroundImage: user.photoURL != null &&
                                user.photoURL!.isNotEmpty
                            ? NetworkImage(
                                '${user.photoURL!}?t=${DateTime.now().millisecondsSinceEpoch}')
                            : const AssetImage(AppAssets.defaultProfile)
                                as ImageProvider,
                      ),
                      SizedBox(height: AppSizes.paddingSmall(context)),
                      Text(
                        '@${user.displayName}',
                        style: AppFonts.bold(context),
                      ),
                      SizedBox(height: AppSizes.paddingMedium(context)),
                      const StaticProfileDetails(),
                      SizedBox(height: AppSizes.paddingLarge(context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: AppSizes.width(context, 0.2),
                          ),
                          CustomButtonWidget(
                            onPressed: () async {
                              final updatedUser = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditProfileScreen(user: user),
                                ),
                              );
                              if (updatedUser != null && context.mounted) {
                                context.read<AuthCubit>().checkAuth();
                              }
                            },
                            buttonText: 'Edit Profile',
                            buttonHeight: AppSizes.buttonHeight(context) / 1.5,
                            minWidth: AppSizes.buttonWidthHalf(context) / 1.5,
                          ),
                          const ThemeToggleButton(),
                          SizedBox(
                            width: AppSizes.width(context, 0.2),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.paddingMedium(context)),
                      SizedBox(height: AppSizes.paddingMedium(context)),
                      ProfileTabBar(tabController: _tabController),
                      SizedBox(
                        height: AppSizes.tabBarHeight(context),
                        child: TabBarViewProfileTabs(
                            tabController: _tabController),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          orElse: () => const LoadingTiktokWidget(),
        );
      },
    );
  }
}
