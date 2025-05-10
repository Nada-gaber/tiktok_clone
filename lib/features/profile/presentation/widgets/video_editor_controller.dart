// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';

// class VideoEditorScreen extends StatefulWidget {
//   final String videoPath;

//   const VideoEditorScreen({super.key, required this.videoPath});

//   @override
//   State<VideoEditorScreen> createState() => _VideoEditorScreenState();
// }

// class _VideoEditorScreenState extends State<VideoEditorScreen> {
//   late VideoPlayerController _controller;
//   double start = 0;
//   double end = 10;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(File(widget.videoPath))
//       ..initialize().then((_) {
//         setState(() {
//           end = _controller.value.duration.inSeconds.toDouble();
//         });
//         _controller.play();
//       });
//   }

//   Future<void> trimVideo() async {
//     final dir = await getTemporaryDirectory();
//     final outputPath = '${dir.path}/trimmed_${DateTime.now().millisecondsSinceEpoch}.mp4';

//     final command =
//         '-i "${widget.videoPath}" -ss $start -to $end -c copy "$outputPath"';

//     await FFmpegKit.execute(command);

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("تم قص الفيديو: $outputPath")),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('تعديل الفيديو')),
//       body: Column(
//         children: [
//           if (_controller.value.isInitialized)
//             AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             ),
//           Slider(
//             min: 0,
//             max: _controller.value.duration.inSeconds.toDouble(),
//             value: start,
//             onChanged: (v) {
//               setState(() => start = v);
//             },
//             label: "بداية: ${start.toInt()} ث",
//           ),
//           Slider(
//             min: start,
//             max: _controller.value.duration.inSeconds.toDouble(),
//             value: end,
//             onChanged: (v) {
//               setState(() => end = v);
//             },
//             label: "نهاية: ${end.toInt()} ث",
//           ),
//           ElevatedButton(
//             onPressed: trimVideo,
//             child: const Text("قص الفيديو"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
