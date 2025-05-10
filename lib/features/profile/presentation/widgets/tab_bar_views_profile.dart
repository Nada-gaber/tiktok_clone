import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok_clone/features/profile/presentation/widgets/upload_assets_button.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/font_weight_helper.dart';
import '../../../../core/themes/images.dart';

class TabBarViewProfileTabs extends StatelessWidget {
  const TabBarViewProfileTabs({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 62.0, vertical: 55.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  AppAssets.imageGallery,
                  width: 60,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(height: 10),
                const Text(
                  'What are some good photos you\'ve taken recently?',
                  textAlign: TextAlign.center,
                  style: AppFonts.bold,
                ),
                const SizedBox(height: 20),
               const CustomUploadButton()

              ],
            ),
          ),
          const Center(child: Text('Lock View')),
          const Center(child: Text('Bookmark View')),
          const Center(child: Text('Favorite View')),
        ],
      ),
    );
  }
}
