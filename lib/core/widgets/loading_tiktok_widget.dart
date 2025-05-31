
import 'package:flutter/material.dart';

class LoadingTiktokWidget extends StatelessWidget {
  const LoadingTiktokWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(
      'assets/loading.gif',
      width: 100, // Adjust size as needed
      height: 100,
      fit: BoxFit.contain, // Adjust how the GIF fits
    ),);
  }
}
