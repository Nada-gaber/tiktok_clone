import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/themes/colors.dart';
import '../../../../core/themes/images.dart';
import '../../../posts/data/model/post_model.dart';
import '../../../posts/presentation/widgets/profile_info_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post;

  const PostDetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(image: AssetImage(AppAssets.tiktokLogo), height: 32),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [const ProfileDetailsWidget(),
              const SizedBox(height: 16),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.dividerColor),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.file(
                  post.imageFile,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Row(children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 20),
                Icon(Icons.comment_outlined),
                SizedBox(width: 20),
                Icon(Icons.share),
              ]),
              const SizedBox(height: 20),
              Text(
                post.caption,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
