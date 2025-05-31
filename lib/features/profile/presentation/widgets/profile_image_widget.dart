import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/profile/presentation/screens/edit_profile.dart';

import '../../../../core/themes/images.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({
    super.key,
    required File? imageFile,
    required this.widget,
  }) : _imageFile = imageFile;

  final File? _imageFile;
  final EditProfileScreen widget;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: _imageFile != null
          ? FileImage(_imageFile)
          : (widget.user.photoURL != null &&
                      widget.user.photoURL!.isNotEmpty
                  ? NetworkImage(widget.user.photoURL!)
                  : const AssetImage(AppAssets.defaultProfile))
              as ImageProvider,
    );
  }
}