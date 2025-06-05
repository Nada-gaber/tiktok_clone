
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/model/post_model.dart';
import 'posts_row_icons.dart';

class ValueListenableBuilderPostsHive extends StatelessWidget {
  const ValueListenableBuilderPostsHive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<Post>('posts').listenable(),
      builder: (context, Box<Post> box, _) {
        final posts = box.values.toList();
        if (posts.isEmpty) {
          return const Center(
            child: Text(
              'No posts yet',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 16.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12)),
                      child: Image.file(
                        File(post.imagePath),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300,
                      ),
                    ),
                    // Caption
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        post.caption,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    // Interaction Buttons (Like, Comment, etc.)
                    const PostRowIcons(),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}