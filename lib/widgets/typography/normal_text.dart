import 'package:flutter/material.dart';

class NormalText extends StatefulWidget {
  const NormalText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<NormalText> createState() => NormalTextState();
}

class NormalTextState extends State<NormalText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontFamily: 'Fredoka',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}