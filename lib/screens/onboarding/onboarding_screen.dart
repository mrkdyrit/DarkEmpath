import 'package:darkempath/screens/conversation/conversation.dart';
import 'package:darkempath/widgets/typography/heading_medium.dart';
import 'package:darkempath/widgets/typography/large_text.dart';
import 'package:darkempath/widgets/typography/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

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
  const OnboardingScreen({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
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
      backgroundColor: const Color(0xFF221B27),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardingPages.length,
              itemBuilder: (context, index) {
                return OnboardingPageWidget(onboardingPages[index], widget.imageUrl);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Column(
              children: [
                DotsIndicator(
                  dotsCount: onboardingPages.length,
                  position: _currentIndex.toInt(),
                  decorator: DotsDecorator(
                    color: const Color(0xFFC2C2C2), // Background color
                    activeColor: const Color(0xFF9436DA), // Active color
                    size: const Size(50.0, 13.0), // Width and height
                    activeSize: const Size(50.0, 13.0), // Width and height for active dot
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.0)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.0)),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;

  final String imageUrl;

  const OnboardingPageWidget(this.page, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 235,
          width: 235,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF492A60)
            ),
            child: ClipOval(
              child: Image.asset(imageUrl),
            ),
          ),
        ),
        const SizedBox(height: 20),
        HeadingMedium(titleText: page.title),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: LargeText(
            text: page.description,
            textColor: const Color(0xFF6F6F6F),
          ),
        ),
        TextButton(
          onPressed: () {
            if (page.title == 'Enjoy The Game') {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const ConversationScreen()), (route) => false);
            }
          }, 
          child: LargeText(text: page.title == 'Enjoy The Game' ? 'Tap here to start game' : '', textColor: const Color(0xFF6F6F6F),)
        ),
      ],
    );
  }
}
