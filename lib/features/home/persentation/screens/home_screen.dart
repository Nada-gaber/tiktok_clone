import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Center(
          child: Column(
            children: [
              Text(
                'Following | For You',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
