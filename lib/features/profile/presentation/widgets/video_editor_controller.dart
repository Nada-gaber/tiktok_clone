// import 'dart:io';
// import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
// import 'package:path_provider/path_provider.dart'; // Ensure this import is present
// import 'package:path/path.dart' as path;
// import 'package:video_editor_2/domain/bloc/controller.dart';

// // Assuming the VideoEditorController class is part of this package
// extension VideoEditorControllerExtension on VideoEditorController {
//   // Define the trimmedStart and trimmedEnd getters
//   Duration get trimmedStart => Duration.zero; // Replace with actual logic
//   Duration get trimmedEnd => const Duration(seconds: 10); // Replace with actual logic
// }

// Future<File?> exportTrimmedVideo(VideoEditorController controller) async {
//   final start = controller.trimmedStart;
//   final end = controller.trimmedEnd;
//   final duration = end - start;

//   final inputPath = controller.file.path;
//   final directory = await getTemporaryDirectory();
//   final outputPath = path.join(directory.path, 'trimmed_video.mp4');

//   final command = '-ss $start -i "$inputPath" -t $duration -c copy "$outputPath"';

//   final session = await FFmpegKit.execute(command);
//   final returnCode = await session.getReturnCode();

//   if (returnCode?.isValueSuccess() ?? false) {
//     return File(outputPath);
//   } else {
//     return null;
//   }
// }
