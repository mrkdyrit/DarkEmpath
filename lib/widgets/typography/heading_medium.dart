import 'package:flutter/material.dart';

class HeadingMedium extends StatefulWidget {
  const HeadingMedium({
    super.key,
    required this.titleText,
    this.textColor = Colors.white,
    this.fontFamily = 'Fredoka',
    this.fontWeight = FontWeight.w600,
    this.softWrap = true,
  });

  final String titleText;
  final Color textColor;
  final String fontFamily;
  final FontWeight fontWeight;
  final bool softWrap;

  @override
  State<HeadingMedium> createState() => _HeadingMediumState();
}

class _HeadingMediumState extends State<HeadingMedium> {
  @override
  Widget build(BuildContext context) {
    return  Text(
      widget.titleText,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: widget.fontWeight,
        fontFamily: widget.fontFamily,
        color: widget.textColor,
      ),
      softWrap: widget.softWrap,
    );
  }
}