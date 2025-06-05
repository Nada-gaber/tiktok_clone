
import 'dart:io';
import 'package:flutter/material.dart';
import '../../data/model/post_model.dart';
import '../screens/post_details_viewer.dart';

class GridViewPosts extends StatelessWidget {
  const GridViewPosts({
    super.key,
    required this.posts,
  });

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        childAspectRatio: 1,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PostDetailsScreen(post: post),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(post.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}