
import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/themes/colors.dart';

class VideoTypeTabBar extends StatelessWidget {
  final List<String> videoTypes;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const VideoTypeTabBar({
    super.key,
    required this.videoTypes,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: videoTypes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    videoTypes[index],
                    style: TextStyle(
                      fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (selectedIndex == index)
                    Container(
                      margin: const EdgeInsets.only(top: 4.0),
                      height: 2,
                      width: 20,
                      color: AppColors.getTextPrimary(context),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
