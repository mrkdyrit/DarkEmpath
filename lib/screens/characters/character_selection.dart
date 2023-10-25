import 'package:darkempath/screens/characters/character_info.dart';
import 'package:darkempath/utils/custom_colors.dart';
import 'package:darkempath/widgets/characters/character_buttons.dart';
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
            Text(
              'Choose',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: Text(
                'Character',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Center(
              child: Wrap(
                runSpacing: 8.0,
                spacing: 8.0,
                alignment: WrapAlignment.start,
                children: [
                  characterButton(context: context, charInfo: const CharacterInformation()),
                  characterButton(context: context, charInfo: const CharacterInformation()),
                  characterButton(context: context, charInfo: const CharacterInformation()),
                  characterButton(context: context, charInfo: const CharacterInformation()),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}