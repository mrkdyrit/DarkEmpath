import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class MoraleProgressIndicator extends StatefulWidget {
  const MoraleProgressIndicator({Key? key, required this.moraleValue}) : super(key: key);

  final double moraleValue;

  @override
  State<MoraleProgressIndicator> createState() => _MoraleProgressIndicatorState();
}

class _MoraleProgressIndicatorState extends State<MoraleProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(Icons.sentiment_satisfied, color: Colors.white),
        ),
        SizedBox(
          width: 100,
          height: 20,
          child: SmoothClipRRect(
            borderRadius: BorderRadius.circular(20),
            smoothness: 0.6,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: SmoothClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  smoothness: 0.6,
                  child: LinearProgressIndicator(
                    value: widget.moraleValue,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF89F065)),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
