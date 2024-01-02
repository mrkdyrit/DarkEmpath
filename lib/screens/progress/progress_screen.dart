import 'package:darkempath/widgets/profiles/progress_tile.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';
import 'package:darkempath/data/chat/progress_data.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final ProgressData progressData = ProgressData();

  @override
  Widget build(BuildContext context) {
    int midpoint = (progressData.characters.length / 2).ceil();
  
    return Scaffold(
      backgroundColor: const Color(0xFF221B27),
      body: Padding(
        padding: const EdgeInsets.only(top: 16,left: 32, right: 32),
        child: ListView(
          children: [
            Center(
              child: Wrap(
                spacing: 16.0,
                children: [
                  Column(
                    children: progressData.characters.take(midpoint).map((character) {
                      return ProgressTile(
                        displayName: character['displayName']!,
                        characterAssetPath: character['characterAssetPath']!,
                        moralData: character,
                        influenceData: character,
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Column(
                      children: progressData.characters.skip(midpoint).map((character) {
                        return ProgressTile(
                          displayName: character['displayName']!,
                          characterAssetPath: character['characterAssetPath']!,
                          moralData: character,
                          influenceData: character,
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}