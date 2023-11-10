import 'package:flutter/material.dart';

class TitleSmall extends StatefulWidget {
  const TitleSmall({
    super.key,
    required this.text,
    this.fontFamily = 'Fredoka',
    this.textColor = Colors.white,
  });

  final String text;
  final String fontFamily;
  final Color textColor;

  @override
  State<TitleSmall> createState() => _TitleSmallState();
}

class _TitleSmallState extends State<TitleSmall> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        fontFamily: widget.fontFamily,
        fontWeight: FontWeight.w400,
        color: widget.textColor,
      ),
    );
  }
}