import 'package:flutter/material.dart';

class TitleLarge extends StatefulWidget {
  const TitleLarge({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<TitleLarge> createState() => _TitleLargeState();
}

class _TitleLargeState extends State<TitleLarge> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontFamily: 'Fredoka',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}