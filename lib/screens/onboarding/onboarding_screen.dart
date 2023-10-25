import 'package:darkempath/screens/characters/character_selection.dart';
import 'package:darkempath/screens/inbox/inbox.dart';
import 'package:darkempath/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:smooth_corner/smooth_corner.dart';

final List<OnboardingPage> onboardingPages = [
  OnboardingPage(
    title: 'Welcome',
    description: 'Lorem ipsum dolor sit amet consectetur. Est tortor semper nisi magnis sed. Vulputate blandit nunc vestibulum consequat.',
    imageUrl: 'assets/Character.png',
  ),
  OnboardingPage(
    title: 'Experience The Dark',
    description: 'Lorem ipsum dolor sit amet consectetur. Est tortor semper nisi magnis sed. Vulputate blandit nunc vestibulum consequat.',
    imageUrl: 'assets/Character.png',
  ),
  OnboardingPage(
    title: 'Enjoy The Game',
    description: 'Lorem ipsum dolor sit amet consectetur. Est tortor semper nisi magnis sed. Vulputate blandit nunc vestibulum consequat.',
    imageUrl: 'assets/Character.png',
  ),
];

class OnboardingPage {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingPage({required this.title, required this.description, required this.imageUrl});
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              itemBuilder: (context, index) {
                return OnboardingPageWidget(onboardingPages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Column(
              children: [
                if (_currentIndex == (onboardingPages.length - 1)) ...[
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const InboxScreen()), (route) => false);
                    }, 
                    child: const Text('Tap here to start game')
                  )
                ] else ...[
                  DotsIndicator(
                    dotsCount: onboardingPages.length,
                    position: _currentIndex.toInt(),
                    decorator: DotsDecorator(
                      color: const Color(0xFFD9D9D9), // Background color
                      activeColor: const Color(0xFF848484), // Active color
                      size: const Size(50.0, 13.0), // Width and height
                      activeSize: const Size(50.0, 13.0), // Width and height for active dot
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.0)),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;

  const OnboardingPageWidget(this.page, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          page.imageUrl,
          width: 300,
        ),
        const SizedBox(height: 20),
        Text(
          page.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          page.description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
