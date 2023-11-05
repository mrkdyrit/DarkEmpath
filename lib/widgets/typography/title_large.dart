import 'package:flutter/material.dart';

class TitleLarge extends StatefulWidget {
  const TitleLarge({
    super.key,
    required this.text,
    this.fontFamily = 'Fredoka',
    this.textColor = Colors.white,
  });

  final String text;
  final String fontFamily;
  final Color textColor;

  @override
  State<TitleLarge> createState() => _TitleLargeState();
}

class _TitleLargeState extends State<TitleLarge> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontFamily: widget.fontFamily,
        fontWeight: FontWeight.w400,
        color: widget.textColor,
      ),
    );
  }
}