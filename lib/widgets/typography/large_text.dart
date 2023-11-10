import 'package:flutter/material.dart';

class LargeText extends StatefulWidget {
  const LargeText({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.fontFamily = 'Heebo',
    this.fontWeight = FontWeight.normal,
    this.textOverflow = TextOverflow.visible
  });

  final String text;
  final Color textColor;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;

  @override
  State<LargeText> createState() => _LargeTextState();
}

class _LargeTextState extends State<LargeText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        fontFamily: widget.fontFamily,
        color: widget.textColor,
        overflow: widget.textOverflow,
        fontWeight: widget.fontWeight,
      ),
    );
  }
}