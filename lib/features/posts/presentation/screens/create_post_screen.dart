import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/themes/colors.dart';
import 'package:tiktok_clone/core/themes/font_weight_helper.dart';
import 'package:tiktok_clone/core/widgets/shared_button.dart';
import '../../data/model/post_model.dart';
import '../widgets/profile_info_widget.dart';

class CreatePostScreen extends StatefulWidget {
  final File imageFile;
  const CreatePostScreen({super.key, required this.imageFile});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _captionController = TextEditingController();

  void _submitPost() {
    final newPost = Post(
      imageFile: widget.imageFile,
      caption: _captionController.text,
    );
    Navigator.pop(context, newPost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Create new post',
          style: AppFonts.bold (context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ProfileDetailsWidget(),
                CustomButtonWidget(
                  onPressed: _submitPost,
                  buttonText: 'Create',
                  minWidth: 100,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Image.file(widget.imageFile, height: 200),
            const SizedBox(height: 20),
            TextField(
              controller: _captionController,
              decoration:  InputDecoration(
                labelText: 'What\'s on your mind?',
                labelStyle: AppFonts.caption (context),
                fillColor: AppColors.inputFieldBackground,
                filled: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
