import 'package:flutter/material.dart';

import '../../../../core/themes/images.dart';
import '../../data/models/video_model.dart';

class ReelCircleAvatar extends StatelessWidget {
  const ReelCircleAvatar({
    super.key,
    required this.video,
  });

  final Hit? video;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: (video?.userImageURL != null &&
                  video?.userImageURL?.isNotEmpty == true)
              ? NetworkImage(video!.userImageURL!)
              : const AssetImage(AppAssets.defaultProfile) as ImageProvider,
        ),
        Positioned(
          bottom: -10,
          child: Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}