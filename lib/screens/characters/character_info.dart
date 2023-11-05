import 'package:darkempath/screens/onboarding/onboarding_screen.dart';
import 'package:darkempath/widgets/buttons/default_button.dart';
import 'package:darkempath/widgets/typography/heading_medium.dart';
import 'package:darkempath/widgets/typography/large_text.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

class CharacterInformation extends StatefulWidget {
  const CharacterInformation({
    super.key,
    required this.characterName,
    required this.characterDescription,
    this.characterAssetPath = 'assets/object_img.png',
  });

  final String characterName;
  final String characterDescription;
  final String characterAssetPath;

  @override
  State<CharacterInformation> createState() => _CharacterInformationState();
}

class _CharacterInformationState extends State<CharacterInformation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  Color _buttonColor = Colors.white; // Initial button color

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onButtonPressed() {
    // Change the button color to 0xFF492A60 on press
    setState(() {
      _buttonColor = const Color(0xFF492A60);
    });

    // Play the button press animation
    _animationController
      ..reset()
      ..forward().whenComplete(() {
        // Reset the button color to the original color
        setState(() {
          _buttonColor = Colors.white;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: Alignment.bottomCenter,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Blur(
              blur: 70,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF9436DA),
                    shape: BoxShape.circle,
                  ),
                ),
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: Image.asset(widget.characterAssetPath),
              ),
            ),
            Positioned(
              bottom: 0,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  width: screenWidth,
                  height: 350,
                  decoration: const BoxDecoration(
                    color: Color(0xFF492A60),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      HeadingMedium(titleText: widget.characterName),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: LargeText(text: widget.characterDescription)
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 200,
                        child: DefaultButton(
                          buttonText: 'Start your Job', 
                          buttonAction: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => OnboardingScreen(
                                imageUrl: widget.characterAssetPath,
                              ))
                            );
                          }
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
