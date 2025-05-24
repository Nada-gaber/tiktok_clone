import 'package:flutter/material.dart';

class ProfileInsightsDetailsRow extends StatelessWidget {
  final String digits;
  final String title;

  const ProfileInsightsDetailsRow({
    super.key,
    required this.digits,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            digits,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}