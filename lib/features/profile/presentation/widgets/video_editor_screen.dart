// import 'package:flutter/material.dart';
// import 'package:tiktok_clone/features/profile/presentation/widgets/video_editor_controller.dart';
// import 'package:video_editor_2/domain/bloc/controller.dart';
// import 'package:video_editor_2/ui/crop/crop_grid.dart';
// import 'package:video_editor_2/ui/trim/trim_slider.dart';


// class VideoEditorScreen extends StatelessWidget {
//   final VideoEditorController controller;

//   const VideoEditorScreen({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Edit Video"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save),
//             onPressed: () async {
//               final file = await exportTrimmedVideo(controller);
//               if (file != null && context.mounted) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Saved to ${file.path}')),
//                 );
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Export failed')),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           AspectRatio(
//             aspectRatio: controller.video.value.aspectRatio,
//             child: CropGridViewer.preview(controller: controller),
//           ),
//           TrimSlider(controller: controller),
//         ],
//       ),
//     );
//   }
// }
