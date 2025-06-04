import 'package:flutter/material.dart';
import 'package:tiktok_clone/core/themes/font_weight_helper.dart';
import '../../../../core/themes/app_sizes.dart';
import '../widgets/skip_next_button_onboarding.dart';
import '../widgets/wrap_expanded_widget.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
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
          padding: EdgeInsets.all(AppSizes.paddingLarge),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Choose what you like',
                style: AppFonts.head(context),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSizes.paddingSmall),
                child: const Text(
                  'Your feed will be personalized based on what you like.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: AppSizes.paddingLarge),
              InterestsWrapWidget(
                interests: interests,
                selectedInterests: _selectedInterests,
                onInterestToggle: _toggleInterest,
              ),
              const Spacer(),
              SkipNextButtonOnBoardingWidget(selectedCount: _selectedCount),
            ],
          ),
        ),
      ),
    );
  }
}
