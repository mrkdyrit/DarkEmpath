import 'package:darkempath/screens/characters/character_selection.dart';
import 'package:darkempath/utils/custom_colors.dart';
import 'package:darkempath/widgets/buttons/default_button.dart';
import 'package:darkempath/widgets/typography/heading_1.dart';
import 'package:flutter/material.dart';

class EndingScreen extends StatefulWidget {
  const EndingScreen({super.key});

  @override
  State<EndingScreen> createState() => _EndingScreenState();
}

class _EndingScreenState extends State<EndingScreen> {
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
                  // ignore: prefer_const_constructors
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Center(
                        child: HeadingLarge(titleText: 'Lorem Ipsum'),
                      ),
                      const SizedBox(height: 50), // Adjust the height as needed
                      const Text(
                        'Porem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
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