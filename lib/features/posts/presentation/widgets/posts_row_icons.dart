
import 'package:flutter/material.dart';

class PostRowIcons extends StatelessWidget {
  const PostRowIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Implement like functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.comment_outlined),
            onPressed: () {
              // Implement comment functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              // Implement share functionality
            },
          ),
        ],
      ),
    );
  }
}
