import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class InfluenceProgressIndicator extends StatefulWidget {
const InfluenceProgressIndicator({Key? key, required this.influenceValue}) : super(key: key);

  final double influenceValue;
  @override
  State<InfluenceProgressIndicator> createState() => InfluenceProgressIndicatorState();
}

class InfluenceProgressIndicatorState extends State<InfluenceProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(Icons.groups, color: Colors.white),
        ),
        SizedBox(
          width: 100,
          height: 20,
          child: SmoothClipRRect(
            borderRadius: BorderRadius.circular(20),
            smoothness: 0.6,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9)
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: SmoothClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  smoothness: 0.6,
                  child: LinearProgressIndicator(
                    value: widget.influenceValue,
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF3F3F)),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              )
            )
          ),
        )
      ],
    );
  }
}