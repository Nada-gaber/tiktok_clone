import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/profile/presentation/widgets/profile_insights_details_row.dart';
import '../../../../core/themes/font_weight_helper.dart';
import '../../../../core/themes/images.dart';
import '../widgets/row_buttons_profile.dart';
import '../widgets/tab_bar_views_profile.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AppAssets.profileIcon),
            ),
            const SizedBox(height: 10),
            const Text(
              '@Profile Screen',
              style: AppFonts.bold,
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileInsightsDetailsRow(
                  digits: '100',
                  title: 'following',
                ),
                SizedBox(width: 30),
                ProfileInsightsDetailsRow(
                  digits: '200',
                  title: 'followers',
                ),
                SizedBox(width: 30),
                ProfileInsightsDetailsRow(
                  digits: '300',
                  title: 'likes',
                ),
              ],
            ),
            const SizedBox(height: 20),
            const RowButtonProfile(),
            const SizedBox(height: 20),
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(icon: Icon(Icons.grid_on)),
                Tab(icon: Icon(Icons.lock_outline)),
                Tab(icon: Icon(Icons.bookmark_border)),
                Tab(icon: Icon(Icons.favorite_border)),
              ],
            ),
            TabBarViewProfileTabs(tabController: _tabController),
          ],
        ),
      ),
    );
  }
}
