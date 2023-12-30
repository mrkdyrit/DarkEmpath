import 'package:darkempath/utils/custom_colors.dart';
import 'package:darkempath/widgets/profiles/image_container.dart';
import 'package:darkempath/widgets/profiles/progress_indicator_influence.dart';
import 'package:darkempath/widgets/profiles/progress_indicator_morale.dart';
import 'package:darkempath/widgets/typography/heading_medium.dart';
import 'package:darkempath/widgets/typography/large_text.dart';
import 'package:darkempath/widgets/typography/title_large.dart';
import 'package:darkempath/widgets/typography/title_small.dart';
import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1820),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64),
        child: ListView(
          children: [
            Center(
              child: 
              SizedBox(
                height: 200,
                width: 200,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD9D9D9),
                  ),
                  // child: ClipOval(
                  //   child: Image.asset(chat['image']),
                  // ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: HeadingMedium(
                  titleText: widget.name,
                  fontFamily: 'Heebo',
                  fontWeight: FontWeight.bold,
                  softWrap: false,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfluenceProgressIndicator(),
                  MoraleProgressIndicator()
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: LargeText(
                text: 'Porem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                textOverflow: TextOverflow.visible,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: TitleLarge(
                text: 'Conversation Images',
                fontFamily: 'Heebo',
                fontWeight: FontWeight.bold,
              ),
            ),
            const Wrap(
              runSpacing: 16.0,
              spacing: 16.0,
              children: [
                ImageContainer(),
                ImageContainer(),
                ImageContainer(),
                ImageContainer(),
                ImageContainer(),

              ],
            )
          ],
        ),
      ),
    );
  }
}