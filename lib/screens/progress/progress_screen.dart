import 'package:darkempath/widgets/profiles/progress_tile.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF221B27),
      body: Padding(
        padding: const EdgeInsets.only(top: 16,left: 32, right: 32),
        child: ListView(
          children: const [
            Center(
              child: Wrap(
                spacing: 16.0,
                children: [
                  Column(
                    children: [
                      ProgressTile(
                        displayName: 'Dashiell',
                        characterAssetPath: 'assets/images/progress_tile/Image.png',
                      ),
                      ProgressTile(
                          displayName: 'Lucian',
                          characterAssetPath: 'assets/images/progress_tile/char_2.png',
                        ),
                      ProgressTile(
                        displayName: 'Aldrin',
                        characterAssetPath: 'assets/images/progress_tile/char_3.png',
                      ),
                      ProgressTile(
                        displayName: 'Homer',
                        characterAssetPath: 'assets/images/progress_tile/char_4.png',
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Column(
                      children: [
                        ProgressTile(
                          displayName: 'Lian',
                          characterAssetPath: 'assets/images/progress_tile/Image.png',
                        ),
                        ProgressTile(
                          displayName: 'Coline',
                          characterAssetPath: 'assets/images/progress_tile/char_2.png',
                        ),
                        ProgressTile(
                          displayName: 'Samantha',
                          characterAssetPath: 'assets/images/progress_tile/char_3.png',
                        ),
                        ProgressTile(
                          displayName: 'Earl',
                          characterAssetPath: 'assets/images/progress_tile/char_4.png',
                        ),
                      ],
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