import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../data/models/user_model.dart';

class ProfileService {
  Future<UserModel> updateProfile({
    required String uid,
    required String currentDisplayName,
    String? newDisplayName,
    File? imageFile,
    String? currentPhotoURL,
  }) async {
    try {
      String? photoURL = currentPhotoURL;

      // Upload new profile picture if provided
      if (imageFile != null) {
        final storageRef = FirebaseStorage.instance.ref().child('profilePictures/$uid');
        await storageRef.putFile(imageFile);
        photoURL = await storageRef.getDownloadURL();
      }

      // Use current display name if new name is empty
      final displayName = newDisplayName?.trim().isEmpty ?? true
          ? currentDisplayName
          : newDisplayName!.trim();

      // Update Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'displayName': displayName,
        'photoURL': photoURL,
      });

      // Update Firebase Auth
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await currentUser.updateDisplayName(displayName);
        if (photoURL != null) {
          await currentUser.updatePhotoURL(photoURL);
        }
      }

      // Create updated UserModel
      return UserModel(
        uid: uid,
        displayName: displayName,
        photoURL: photoURL,
        email: currentUser?.email ?? '', // Preserve email
      );
    } catch (e) {
      throw Exception('Error updating profile: $e');
    }
  }
}