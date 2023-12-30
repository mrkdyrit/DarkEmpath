import 'package:darkempath/screens/characters/character_info.dart';
import 'package:darkempath/utils/custom_colors.dart';
import 'package:darkempath/widgets/characters/character_buttons.dart';
import 'package:darkempath/widgets/typography/heading_1.dart';
import 'package:flutter/material.dart';

class CharacterSelectionScreen extends StatefulWidget {
  const CharacterSelectionScreen({super.key});

  @override
  State<CharacterSelectionScreen> createState() => _CharacterSelectionScreenState();
}

class _CharacterSelectionScreenState extends State<CharacterSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkEmpathColors.prologueScreensBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: DarkEmpathColors.buttonColor,),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeadingLarge(titleText: 'Choose'),
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: const HeadingLarge(titleText: 'Character'),
            ),
            Center(
              child: Wrap(
                runSpacing: 16.0,
                spacing: 16.0,
                alignment: WrapAlignment.start,
                children: [
                  CharacterButton(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const CharacterInformation(
                          characterName: 'Juan Dela Cruz',
                          characterDescription: 'Lorem ipsum dolor sit amet, sarantosi consectetur adipiscing elit Curabisati condimentum magna a leomalesuada, eu vehicula arcu dapibus.',
                          characterAssetPath: 'assets/images/character_info/male.png',
                        ))
                      );
                    },
                    characterGenderText: 'Male',
                    characterAssetPath: 'assets/images/character_buttons/male.png',
                  ),
                  CharacterButton(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const CharacterInformation(
                          characterName: 'Ollie Montefalcon',
                          characterDescription: 'Lorem ipsum dolor sit amet, sarantosi consectetur adipiscing elit Curabisati condimentum magna a leomalesuada, eu vehicula arcu dapibus.',
                          characterAssetPath: 'assets/images/character_info/female.png',
                        ))
                      );
                    },
                    characterGenderText: 'Female',
                    characterAssetPath: 'assets/images/character_buttons/female.png',
                  ),
                  CharacterButton(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const CharacterInformation(
                          characterName: 'Franchesca Dizon',
                          characterDescription: 'Lorem ipsum dolor sit amet, sarantosi consectetur adipiscing elit Curabisati condimentum magna a leomalesuada, eu vehicula arcu dapibus.',
                          characterAssetPath: 'assets/images/character_info/lesbian.png',
                        ))
                      );
                    },
                    characterGenderText: 'Lesbian',
                    characterAssetPath: 'assets/images/character_buttons/lesbian.png',
                  ),
                  CharacterButton(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const CharacterInformation(
                          characterName: 'Matthew De Castro',
                          characterDescription: 'Lorem ipsum dolor sit amet, sarantosi consectetur adipiscing elit Curabisati condimentum magna a leomalesuada, eu vehicula arcu dapibus.',
                          characterAssetPath: 'assets/images/character_info/male.png',
                        ))
                      );
                    },
                    characterGenderText: 'Gay',
                    characterAssetPath: 'assets/images/character_buttons/male.png',
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}