import 'package:flutter/material.dart';

class HeadingMedium extends StatefulWidget {
  const HeadingMedium({
    super.key,
    required this.titleText,
    this.textColor = Colors.white,
  });

  final String titleText;
  final Color textColor;

  @override
  State<HeadingMedium> createState() => _HeadingMediumState();
}

class _HeadingMediumState extends State<HeadingMedium> {
  @override
  Widget build(BuildContext context) {
    return  Text(
      widget.titleText,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        fontFamily: 'Fredoka',
        color: widget.textColor,
      ),
    );
  }
}