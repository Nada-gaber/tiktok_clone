import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/profile/presentation/widgets/upload_assets_button.dart';

import '../../../../core/themes/font_weight_helper.dart';
import '../../../posts/data/model/post_model.dart';
import '../screens/post_details_viewer.dart';

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
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: _posts.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'What are some good photos you\'ve taken recently?',
                                textAlign: TextAlign.center,
                                style: AppFonts.bold,
                              ),
                              const SizedBox(height: 20),
                              CustomUploadButton(
                                onPostCreated: _addNewPost,
                              ),
                            ],
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                3, // Number of columns like Instagram
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                            childAspectRatio:
                                1, // Adjust if you want square or rectangular tiles
                          ),
                          itemCount: _posts.length,
                          itemBuilder: (context, index) {
                            final post = _posts[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        PostDetailsScreen(post: post),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  post.imageFile,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                ),
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
