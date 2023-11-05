import 'package:flutter/material.dart';

class HeadingLarge extends StatefulWidget {
  const HeadingLarge({
    super.key,
    required this.titleText,
    this.textColor = Colors.white,
  });

  final String titleText;
  final Color textColor;

  @override
  State<HeadingLarge> createState() => _HeadingLargeState();
}

class _HeadingLargeState extends State<HeadingLarge> {
  @override
  Widget build(BuildContext context) {
    return  Text(
      widget.titleText,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.bold,
        fontFamily: 'Fredoka',
        color: widget.textColor,
      ),
    );
  }
}