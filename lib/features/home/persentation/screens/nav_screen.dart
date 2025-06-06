import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok_clone/core/themes/colors.dart';
import 'package:tiktok_clone/core/widgets/loading_tiktok_widget.dart';
import 'package:tiktok_clone/features/home/persentation/helpers/post_helper.dart';
import 'package:tiktok_clone/features/profile/presentation/screens/profile.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/themes/app_sizes.dart';
import '../../../../core/themes/font_weight_helper.dart';
import '../../../../core/themes/images.dart';
import '../../../auth/logic/cubit/auth_cubit/auth_cubit.dart';
import '../../../auth/logic/cubit/auth_cubit/auth_state.dart';
import '../../../posts/data/model/post_model.dart';
import '../../../profile/presentation/screens/not_logged_in_profile.dart';
import '../../../videos/logic/video_searching_cubit.dart';
import '../../../videos/presentation/screens/videos_searching.dart';
import 'reels_video.dart';
import 'inbox_screen.dart';


class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const ReelsVideo(),
      BlocProvider(
        create: (context) => getIt<SearchVideoCubit>()..searchVideos(),
        child: const SearchVideoScreen(),
      ),
      const InboxScreen(),
      user == null ? const NotLoggedInProfile() : const InboxScreen(),
      BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const LoadingTiktokWidget(),
            unauthenticated: () => const NotLoggedInProfile(),
            authenticated: (user) => const ProfileScreen(),
            orElse: () => const NotLoggedInProfile(),
          );
        },
      ),
    ];
  }

  void _onItemTapped(int index) {
    if (index == 2) return; // Ignore index for Upload button
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Post> _posts = [];

  void _addNewPost(Post post) {
    setState(() {
      _posts.insert(0, post); // Add at the top
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingSmall(context),
              vertical: AppSizes.paddingMedium(context),
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundDarkBlue,
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                  width: AppSizes.width(context, 0.5 / 375), // Proportional border width
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(0, AppAssets.homeIcon, 'Home'),
                _navItem(1, AppAssets.searchIcon, 'Discover'),
                _uploadButton(),
                _navItem(3, AppAssets.inboxIcon, 'Inbox'),
                _navItem(4, AppAssets.profileIcon, 'Profile'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(int index, String assetPath, String indexTitle) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: SizedBox(
          width: AppSizes.width(context, 0.15), // ~15% of screen width
          height: AppSizes.height(context, 0.06), // ~6% of screen height
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                assetPath,
                width: AppSizes.iconSizeSmall(context),
                height: AppSizes.iconSizeSmall(context),
                colorFilter: ColorFilter.mode(
                  _selectedIndex == index
                      ? AppColors.backgroundLightGray
                      : AppColors.buttonSecondaryColor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: AppSizes.paddingSmall(context)),
              Expanded(
                child: Text(
                  indexTitle,
                  style: AppFonts.caption(context).copyWith(
                    color: _selectedIndex == index
                        ? AppColors.backgroundLightGray
                        : AppColors.buttonSecondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _uploadButton() {
    return GestureDetector(
      onTap: () => pickImageAndCreatePost(
        context: context,
        onPostCreated: _addNewPost,
      ),
      child: SvgPicture.asset(
        AppAssets.addButton,
        width: AppSizes.iconSizeMedium(context),
        height: AppSizes.iconSizeMedium(context),
      ),
    );
  }
}
