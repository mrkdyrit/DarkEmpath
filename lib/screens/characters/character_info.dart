import 'package:darkempath/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class CharacterInformation extends StatefulWidget {
  const CharacterInformation({Key? key}) : super(key: key);

  @override
  State<CharacterInformation> createState() => _CharacterInformationState();
}

class _CharacterInformationState extends State<CharacterInformation>
    with SingleTickerProviderStateMixin {
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
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            FadeTransition(
              opacity: _fadeAnimation,
              child: SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: Image.asset('assets/object_img.png'),
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
                      const Text(
                        'Character Name',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTapDown: (_) {
                          // Change the button color on tap down
                          setState(() {
                            _buttonColor = const Color(0xFF492A60);
                          });
                        },
                        onTapUp: (_) {
                          // Change the button color back to the original color on tap up
                          setState(() {
                            _buttonColor = Colors.white;
                          });
                        },
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color:
                                  _buttonColor, // Use the dynamic button color
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const OnboardingScreen())
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: const Text(
                                'Start your job',
                                style: TextStyle(color: Color(0xFF492A60)),
                              ),
                            ),
                          ),
                        ),
                      ),
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
