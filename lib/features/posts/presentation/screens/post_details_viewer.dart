import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/themes/colors.dart';
import '../../../../core/themes/app_sizes.dart';
import '../../../../core/themes/font_weight_helper.dart';
import '../../../../core/themes/images.dart';
import '../../data/model/post_model.dart';
import '../widgets/profile_info_widget.dart';

class PostDetailsScreen extends StatelessWidget {
  final Post post;

  const PostDetailsScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: const AssetImage(AppAssets.tiktokLogo),
          height: AppSizes.height(context, 0.04), // ~4% of screen height
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.paddingMedium(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ProfileDetailsWidget(),
              SizedBox(height: AppSizes.paddingMedium(context)),
              Container(
                height: AppSizes.imageHeightMedium(context),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppSizes.width(context, 0.03)),
                  border: Border.all(color: AppColors.dividerColor),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.file(
                  post.imagePath != null
                      ? File(post.imagePath!)
                      :  File(''), // Handle null case
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: AppSizes.paddingMedium(context)),
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: AppSizes.iconSizeSmall(context),
                  ),
                  SizedBox(width: AppSizes.paddingMedium(context)),
                  Icon(
                    Icons.comment_outlined,
                    size: AppSizes.iconSizeSmall(context),
                  ),
                  SizedBox(width: AppSizes.paddingMedium(context)),
                  Icon(
                    Icons.share,
                    size: AppSizes.iconSizeSmall(context),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.paddingMedium(context)),
              Text(
                post.caption,
                style: AppFonts.regular(context).copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
