import 'package:flutter/material.dart';

import '../../../../core/themes/app_sizes.dart';
import 'profile_insights_details_row.dart';

class StaticProfileDetails extends StatelessWidget {
  const StaticProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: AppSizes.paddingMedium(context)),
        const ProfileInsightsDetailsRow(
          digits: '100',
          title: 'following',
        ),
       const ProfileInsightsDetailsRow(
          digits: '300',
          title: 'likes',
        ),  const ProfileInsightsDetailsRow(
          digits: '200',
          title: 'followers',
        ),
       
        SizedBox(width: AppSizes.paddingMedium(context)),
      ],
    );
  }
}
