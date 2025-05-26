
import 'package:flutter/material.dart';

class TermsServicesWidgets extends StatelessWidget {
  const TermsServicesWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 90, right: 20, left: 20, bottom: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: 'By tapping "Agree and continue", you agree to our  ',
          style: TextStyle(color: Colors.grey, fontSize: 12),
          children: <TextSpan>[
            TextSpan(
                text: 'Terms of Service',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey)),
            TextSpan(text: ' and acknowledge that you have read our'),
            TextSpan(
                text: ' Privacy Policy',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey)),
            TextSpan(
              text:
                  ' to learn how we collect, use, and share your data, including access to your media files.',
            ),
          ],
        ),
      ),
    );
  }
}
