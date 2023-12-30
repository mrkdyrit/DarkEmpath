import 'package:flutter/material.dart';

class SmallText extends StatefulWidget {
  const SmallText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<SmallText> createState() => _SmallTextState();
}

class _SmallTextState extends State<SmallText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontFamily: 'Fredoka',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}