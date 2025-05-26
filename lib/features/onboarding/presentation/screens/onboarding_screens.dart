import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/themes/font_weight_helper.dart';
import '../widgets/skip_next_button_onboarding.dart';
import '../widgets/wrap_expanded_widget.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  // Track selected interests
  final List<bool> _selectedInterests = List.filled(10, false);
  final List<String> interests = const [
    'Comedy',
    'Music',
    'Sports',
    'Entertainment Culture',
    'Food & Drink',
    'Vlogs',
    'Science & Education',
    'Beauty & Style',
    'Fitness & Health',
    'Family',
  ];
  int get _selectedCount =>
      _selectedInterests.where((isSelected) => isSelected).length;
  void _toggleInterest(int index) {
    setState(() {
      _selectedInterests[index] = !_selectedInterests[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              const Text(
                'Choose what you like',
                style: AppFonts.head,
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Your feed will be personalized based on what you like.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              InterestsWrapWidget(
                interests: interests,
                selectedInterests: _selectedInterests,
                onInterestToggle: _toggleInterest,
              ),
              SkipNextButtonOnBoardingWidget(selectedCount: _selectedCount),
            ],
          ),
        ),
      ),
    );
  }
}
