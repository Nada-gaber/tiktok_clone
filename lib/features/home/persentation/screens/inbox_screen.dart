import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/themes/app_sizes.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: AppSizes.height(context, MediaQuery.of(context).size.height),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Inbox is empty',
            ),
          ),
        ),
      ),
    );
  }
}
