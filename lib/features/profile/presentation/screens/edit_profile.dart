import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/core/widgets/shared_button.dart';
import '../../../../core/themes/app_sizes.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/font_weight_helper.dart';
import '../../data/models/user_model.dart';
import '../helper/update_profile.dart';
import '../widgets/profile_image_widget.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;

  const EditProfileScreen({super.key, required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController();
  File? _imageFile;
  bool _hasChanges = false;
  final _profileService = ProfileService();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.user.displayName;
    _nameController.addListener(_checkForChanges);
  }

  void _checkForChanges() {
    setState(() {
      _hasChanges = _nameController.text.trim() != widget.user.displayName ||
          _imageFile != null;
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _hasChanges = true;
      });
    }
  }

  Future<void> _updateProfile() async {
    try {
      final updatedUser = await _profileService.updateProfile(
        uid: widget.user.uid,
        currentDisplayName: widget.user.displayName,
        newDisplayName: _nameController.text,
        imageFile: _imageFile,
        currentPhotoURL: widget.user.photoURL,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated')),
      );

      // Pop and return updated user
      Navigator.pop(context, updatedUser);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: AppFonts.title(context)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.paddingMedium(context)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: AppSizes.paddingMedium(context)),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ProfileImageWidget(
                      imageFile: _imageFile,
                      widget: widget,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          padding:
                              EdgeInsets.all(AppSizes.paddingSmall(context)),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.buttonColor,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: AppSizes.iconSizeSmall(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.paddingSmall(context)),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Display Name',
                    hintText: 'Enter your name',
                    labelStyle: AppFonts.regular(context).copyWith(
                      color: AppColors.textSecondary,
                    ),
                    hintStyle: AppFonts.regular(context).copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  style:
                      AppFonts.regular(context).copyWith(color: AppColors.backgroundDarkBlue),
                ),
                SizedBox(height: AppSizes.paddingSmall(context)),
                CustomButtonWidget(
                  onPressed: _hasChanges ? _updateProfile : null,
                  buttonText: 'Save Changes',
                  minWidth: AppSizes.width(context, 1.0), // Full width
                  buttonHeight: AppSizes.buttonHeight(context),
                  disabledButtonColor: AppColors.buttonColor.withOpacity(0.5),
                  disabledTextColor: Colors.white.withOpacity(0.7),
                ),
                SizedBox(height: AppSizes.paddingMedium(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
