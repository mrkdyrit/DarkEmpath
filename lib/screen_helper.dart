import 'package:darkempath/screens/inbox/inbox.dart';
import 'package:flutter/material.dart';
import 'package:darkempath/screens/onboarding/onboarding_screen.dart';

class ScreenHelper extends StatefulWidget {
  const ScreenHelper({super.key});

  @override
  State<ScreenHelper> createState() => _ScreenHelperState();
}

class _ScreenHelperState extends State<ScreenHelper> {
  @override
  Widget build(BuildContext context) {

    // List of screens
    final List<Map<String, dynamic>> ScreenList = [
      {
        'name': 'Inbox',
        'details': {
          'icon': Icons.message,
          'screen':  OnboardingScreen(),
        },
      },
    ];

    return  OnboardingScreen();
  }
}