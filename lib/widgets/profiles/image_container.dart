import 'package:flutter/material.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ImageContainer extends StatefulWidget {
  const ImageContainer({super.key});

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 133,
      height: 113,
      child: Container(
        decoration: ShapeDecoration(
          shape: SmoothRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            smoothness: 0.6,
          ),
          color: const Color(0xFFD6D6D6),
        ),
      ),
    );
  }
}