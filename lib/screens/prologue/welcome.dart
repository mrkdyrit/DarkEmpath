import 'package:darkempath/screens/characters/character_selection.dart';
import 'package:darkempath/utils/custom_colors.dart';
import 'package:darkempath/widgets/buttons/default_button.dart';
import 'package:darkempath/widgets/typography/heading_1.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: DarkEmpathColors.prologueScreensBackground,
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                    child: HeadingLarge(titleText: 'Dark Empath')
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: buttonsMarginBottom),
                        child: DefaultButton(
                          buttonText: 'New Game', 
                          buttonAction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CharacterSelectionScreen())
                            );
                          }
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: buttonsMarginBottom),
                        child: DefaultButton(
                          buttonAction: () {

                          },
                          buttonText: 'Continue',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: buttonsMarginBottom),
                        child: DefaultButton(
                          buttonAction: () {

                          },
                          buttonText: 'Settings',
                        ),
                      ),
                    ],
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