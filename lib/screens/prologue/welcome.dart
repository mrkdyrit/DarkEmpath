import 'package:darkempath/screens/characters/character_selection.dart';
import 'package:darkempath/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double buttonsMarginBottom = 8;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: ((context, constraints) => Container(
            margin: const EdgeInsets.all(8),
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Center(
                    child: Text(
                      'DARK EMPATH',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: buttonsMarginBottom),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CharacterSelectionScreen())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DarkEmpathColors.buttonColor,
                      minimumSize: const Size.fromHeight(50),
                      shape: SmoothRectangleBorder(
                        smoothness: 0.6,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'New Game',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: buttonsMarginBottom),
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DarkEmpathColors.buttonColor,
                      minimumSize: const Size.fromHeight(50),
                      shape: SmoothRectangleBorder(
                        smoothness: 0.6,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: buttonsMarginBottom),
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DarkEmpathColors.buttonColor,
                      minimumSize: const Size.fromHeight(50),
                      shape: SmoothRectangleBorder(
                        smoothness: 0.6,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'Settings',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      )
    );
  }
}