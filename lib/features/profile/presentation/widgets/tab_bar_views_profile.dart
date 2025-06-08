import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktok_clone/features/posts/presentation/widgets/upload_assets_button.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/font_weight_helper.dart';
import '../../../../core/themes/images.dart';
import '../../../posts/data/model/post_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../posts/presentation/widgets/grid_view_posts.dart';
import '../../../posts/presentation/widgets/posts_value_listener.dart';

class TabBarViewProfileTabs extends StatefulWidget {
  final TabController tabController;
  const TabBarViewProfileTabs({super.key, required this.tabController});

  @override
  State<TabBarViewProfileTabs> createState() => _TabBarViewProfileTabsState();
}

class _TabBarViewProfileTabsState extends State<TabBarViewProfileTabs> {
  final List<Post> _posts = [];

  void _addNewPost(Post post) {
    setState(() {
      _posts.insert(0, post); // Add at the top
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: widget.tabController,
        children: [
          // First Tab: Grid View (as before, but using Hive)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: ValueListenableBuilder(
              valueListenable: Hive.box<Post>('posts').listenable(),
              builder: (context, Box<Post> box, _) {
                final posts = box.values.toList();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: posts.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 62.0, vertical: 33.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.imageGallery,
                                    width: 60,
                                    colorFilter: ColorFilter.mode(
                                      AppColors.getTextSecondary(context),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'What are some good photos you\'ve taken recently?',
                                    textAlign: TextAlign.center,
                                    style: AppFonts.bold(context),
                                  ),
                                  const SizedBox(height: 20),
                                  CustomUploadButton(
                                    onPostCreated: _addNewPost,
                                  ),
                                ],
                              ),
                            )
                          : GridViewPosts(posts: posts),
                    ),
                  ],
                );
              },
            ),
          ),
          // Second Tab: Scrolling Feed (Instagram-like)
          const ValueListenableBuilderPostsHive(),
          // Third Tab: Bookmark View
          const Center(child: Text('Bookmark View')),
          // Fourth Tab: Favorite View
          const Center(child: Text('Favorite View')),
        ],
      ),
    );
  }
}
