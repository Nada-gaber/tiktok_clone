import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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

void _submitPost() async {
    final newPost = Post(
      imagePath: widget.imageFile.path, // Store the file path
      caption: _captionController.text,
    );
    final box = Hive.box<Post>('posts');
    await box.add(newPost); // Save to Hive
    Navigator.pop(context, newPost);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'New Post',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CustomButtonWidget(
              onPressed: _submitPost,
              buttonText: 'Share',
              minWidth: 80,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Preview
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.grey[200],
                child: Image.file(
                  widget.imageFile,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 16),
              // Profile and Caption
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileDetailsWidget(),
                    Spacer(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _captionController,
                  decoration: const InputDecoration(
                    hintText: 'Write a caption...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  maxLines: 5,
                  minLines: 1,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Divider(height: 1),
              // Additional Options (e.g., Instagram-like features)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on_outlined, size: 20),
                      label: const Text('Add Location'),
                      style: TextButton.styleFrom(foregroundColor: Colors.black),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.person_add_alt_1_outlined, size: 20),
                      label: const Text('Tag People'),
                      style: TextButton.styleFrom(foregroundColor: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
