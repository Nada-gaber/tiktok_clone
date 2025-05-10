import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok_clone/core/themes/colors.dart';
import 'package:tiktok_clone/features/profile/presentation/screens/profile.dart';
import '../../../../core/themes/images.dart';
import '../../../profile/presentation/screens/not_logged_in_profile.dart';
import 'reels_video.dart';
import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser;

  // List of screens for navigation
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const ReelsVideo(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      user == null ?const ProfileScreen()  :const NotLoggedInProfile() ,
    ];
  }

  void _onItemTapped(int index) {
    if (index == 2) return; // Ignore index for Upload button
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],

      // Custom Bottom Navigation Bar
      bottomNavigationBar: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
            decoration: const BoxDecoration(
              color: AppColors.appBarBackground,
              border: Border(top: BorderSide(color: Colors.black, width: 0.5)),
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

  // Function for normal tab items
  Widget _navItem(int index, String assetPath, String indexTitle) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: SizedBox(
          width: 30,
          height: 30,
          child: Column(
            children: [
              SvgPicture.asset(
                assetPath,
                width: 18,
                height: 18,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == index
                      ? AppColors.backgroundDarkBlue
                      : AppColors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Text(
                  indexTitle,
                  style: TextStyle(
                    color: _selectedIndex == index
                        ? AppColors.backgroundDarkBlue
                        : AppColors.textSecondary,
                    fontSize: 8,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Special Floating Upload Button
  Widget _uploadButton() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      ),
      child: SvgPicture.asset(
        AppAssets.addButton,
        width: 30,
        height: 30,
      ),
    );
  }
}
