import 'package:darkempath/screens/characters/character_info.dart';
import 'package:darkempath/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

Widget characterButton({
  required BuildContext context,
  required CharacterInformation charInfo
}) {
  return GestureDetector(
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => charInfo,)
      );
    },
    child: SizedBox(
      height: 240,
      width: 150,
      child: Container(
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(40),
            smoothness: 0.6,
          ),
          color: DarkEmpathColors.buttonColor
        ),
      ),
    ),
  );
}