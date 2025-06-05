
import 'package:flutter/material.dart';

import '../../../../core/themes/app_sizes.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(
          icon: Icon(
            Icons.grid_on,
            size: AppSizes.iconSizeSmall(context),
          ),
        ),
        Tab(
          icon: Icon(
            Icons.lock_outline,
            size: AppSizes.iconSizeSmall(context),
          ),
        ),
        Tab(
          icon: Icon(
            Icons.bookmark_border,
            size: AppSizes.iconSizeSmall(context),
          ),
        ),
        Tab(
          icon: Icon(
            Icons.favorite_border,
            size: AppSizes.iconSizeSmall(context),
          ),
        ),
      ],
    );
  }
}
