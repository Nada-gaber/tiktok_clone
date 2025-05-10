import 'package:flutter/material.dart';
import '../../../../core/themes/colors.dart';

class CustomUploadButton extends StatelessWidget {
  const CustomUploadButton({super.key});
void _pickAndEditVideo(BuildContext context) async {
  // final result = await FilePicker.platform.pickFiles(type: FileType.video);

  // if (result != null && result.files.single.path != null) {
  //   final videoPath = result.files.single.path!;
    
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => VideoEditorScreen(videoPath: videoPath),
    //   ),
    // );
//   }
 }
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => _pickAndEditVideo(context),
      color: AppColors.buttonColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          'Upload',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
