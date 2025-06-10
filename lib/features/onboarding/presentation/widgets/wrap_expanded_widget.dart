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
      spacing: AppSizes.paddingSmall(context),
      runSpacing: AppSizes.paddingSmall(context),
      alignment: WrapAlignment.center,
      children: List.generate(interests.length, (index) {
        return SizedBox(
          child: OutlinedButton(
            onPressed: () => onInterestToggle(index),
            style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStateProperty.all(
                    selectedInterests[index]
                        ? AppColors.getButtonBackgroundColor(context)
                        : AppColors.getModalBackgroundColor(context),
                  ),
                  foregroundColor: WidgetStateProperty.all(
                    selectedInterests[index]
                        ? AppColors.getButtonTextColor(context)
                        : AppColors.getTextPrimary(context),
                  ),
                  side: WidgetStateProperty.all(
                    BorderSide(
                        color: AppColors.getOutlinedButtonBorderColor(context)),
                  ),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingMedium(context),
                      vertical: AppSizes.paddingSmall(context),
                    ),
                  ),
                ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '${interests[index]} +',
                style: AppFonts.semiBold(context),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }),
    );
  }
}
