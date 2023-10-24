import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';


void main() {
  runApp(OnboardingScreen());
}

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
        padding: EdgeInsets.only(bottom: 100.0), // Adjust the padding
        child: DotsIndicator(
          dotsCount: onboardingPages.length,
          position: _currentIndex.toInt(),
          decorator: DotsDecorator(
            color: Color(0xFFD9D9D9), // Background color
            activeColor: Color(0xFF848484), // Active color
            size: const Size(50.0, 13.0), // Width and height
            activeSize: const Size(50.0, 13.0), // Width and height for active dot
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.0)),
          ),
        ),
      ),
    ],
  ),
);
  }
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;

  OnboardingPageWidget(this.page);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          page.imageUrl,
          width: 300,
        ),
        SizedBox(height: 20),
        Text(
          page.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          page.description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
