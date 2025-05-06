
import 'package:flutter/widgets.dart';

import '../../../../core/themes/font_weight_helper.dart';

class ProfileInsightsDetailsRow extends StatelessWidget {
  const ProfileInsightsDetailsRow({
    super.key,
    required this.digits,
    required this.title,
  });
  final String digits;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      
      children: [
        Text(
          digits,
          style: AppFonts.bold,
        ),
        Text(title),
      ],
    );
  }
}
