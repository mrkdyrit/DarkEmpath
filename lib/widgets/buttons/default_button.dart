import 'package:darkempath/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class DefaultButton extends StatefulWidget {
  const DefaultButton({
    super.key,
    required this.buttonText,
    required this.buttonAction,
  });

  final String buttonText;
  final Function buttonAction;

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.buttonAction.call();
      },
      child: SizedBox(
        height: 50,
        child: Stack(
          children: [
            Container(
              decoration: ShapeDecoration(
                shape: SmoothRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  smoothness: 0.6,
                ),
                color: DarkEmpathColors.buttonShadeColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: SizedBox(
                height: 43,
                child: Container(
                  decoration: ShapeDecoration(
                    shape: SmoothRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                      smoothness: 0.6,
                    ),
                    color: DarkEmpathColors.buttonColor,
                  ),
                  child: Center(
                    child: Text(
                      widget.buttonText,
                      style: const TextStyle(
                        color: DarkEmpathColors.buttonTextColor,
                        fontFamily: 'Heebo',
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}