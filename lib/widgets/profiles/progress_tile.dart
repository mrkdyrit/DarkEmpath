import 'package:darkempath/widgets/profiles/progress_indicator_influence.dart';
import 'package:darkempath/widgets/profiles/progress_indicator_morale.dart';
import 'package:darkempath/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';


class ProgressTile extends StatefulWidget {
  const ProgressTile({
    Key? key,
    required this.displayName,
    required this.characterAssetPath,
    required this.moralData,
    required this.influenceData,
    
  }) : super(key: key);

  final String displayName;
  final String characterAssetPath;
  final Map<String, String> moralData;
  final Map<String, String> influenceData;


  @override
  State<ProgressTile> createState() => _ProgressTileState();
}

class _ProgressTileState extends State<ProgressTile> {
  @override
  Widget build(BuildContext context) {
    // Extract morale value from character data
    double moraleValue = double.parse(widget.moralData['morale']!);
    double influenceValue = double.parse(widget.influenceData['influence']!);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: 163,
        height: 300,
        child: Container(
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              smoothness: 0.6,
            ),
            color: const Color(0xFFB1A8BB),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TitleLarge(
                      text: widget.displayName,
                      fontWeight: FontWeight.bold,
                      textColor: const Color(0xFF5A4472),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(widget.characterAssetPath),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 55,
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: SmoothRectangleBorder(
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                          smoothness: 0.6,
                        ),
                        color: const Color(0xFF5A4472),
                      ),
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        children: [
                          InfluenceProgressIndicator(influenceValue: influenceValue),
                          MoraleProgressIndicator(moraleValue: moraleValue),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
