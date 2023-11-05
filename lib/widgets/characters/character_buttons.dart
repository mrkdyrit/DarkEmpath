import 'package:darkempath/utils/custom_colors.dart';
import 'package:darkempath/widgets/typography/small_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CharacterButton extends StatefulWidget {
  const CharacterButton({
    super.key,
    required this.onTap,
    required this.characterGenderText,
    required this.characterAssetPath,
  });

  final Function onTap;
  final String characterGenderText;
  final String characterAssetPath;

  @override
  State<CharacterButton> createState() => CharacterButtonState();
}

class CharacterButtonState extends State<CharacterButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap.call();
      },
      child: SizedBox(
        height: 240,
        width: 150,
        child: Container(
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              smoothness: 0.6,
            ),
            color: DarkEmpathColors.buttonColor
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Wrap(
              children: [
                SmallText(text: widget.characterGenderText),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Image.asset(widget.characterAssetPath),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}