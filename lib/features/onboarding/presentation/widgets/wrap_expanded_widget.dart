import 'package:flutter/material.dart';

import '../../../../core/themes/app_sizes.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/font_weight_helper.dart';
class InterestsWrapWidget extends StatelessWidget {
  final List<String> interests;
  final List<bool> selectedInterests;
  final void Function(int index) onInterestToggle;
  const InterestsWrapWidget({
    super.key,
    required this.interests,
    required this.selectedInterests,
    required this.onInterestToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSizes.paddingSmall,
      runSpacing: AppSizes.paddingSmall,
      alignment: WrapAlignment.center,
      children: List.generate(interests.length, (index) {
        return SizedBox(
          child: OutlinedButton(
            onPressed: () => onInterestToggle(index),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.grey),
              backgroundColor: selectedInterests[index]
                  ? AppColors.buttonColor
                  : AppColors.backgroundLightGray,
              foregroundColor:
                  selectedInterests[index] ? Colors.white : Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMedium,
                vertical: AppSizes.paddingSmall,
              ),
            ),
            child: Text(
              '${interests[index]} +',
              style: AppFonts.semiBold(context),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }),
    );
  }
}