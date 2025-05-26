
import 'package:flutter/material.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/widgets/shared_button.dart';
import '../screens/welcome_screen.dart';

class SkipNextButtonOnBoardingWidget extends StatelessWidget {
  const SkipNextButtonOnBoardingWidget({
    super.key,
    required int selectedCount,
  }) : _selectedCount = selectedCount;

  final int _selectedCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonWidget(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
            },
            textColor: Colors.black,
            buttonColor: AppColors.buttonSecondaryColor,
            minWidth: 160,
            buttonText: 'Skip'),
        CustomButtonWidget(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(),
                ),
              );
            },
            minWidth: 160,
            buttonText:
                'Next ${_selectedCount > 0 ? "($_selectedCount)" : ""}'),
      ],
    );
  }
}
