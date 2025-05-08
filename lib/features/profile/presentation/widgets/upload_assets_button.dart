// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_editor_2/domain/bloc/controller.dart';
// import '../../../../core/themes/colors.dart';
// import 'video_editor_screen.dart';

// class CustomUploadButton extends StatelessWidget {
//   const CustomUploadButton({super.key});

//   Future<void> _pickAndEditVideo(BuildContext context) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       final controller = VideoEditorController.file(pickedFile);
//       await controller.initialize(); // Important!

//       // Navigate to the video editing screen
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => VideoEditorScreen(controller: controller),
//         ),
//       );
//     } else {
//       print('No video selected.');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: () => _pickAndEditVideo(context),
//       color: AppColors.buttonColor,
//       elevation: 0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       child: const Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Text(
//           'Upload',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
