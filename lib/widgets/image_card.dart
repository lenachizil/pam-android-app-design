import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BorderRadius borderRadius;
  final Color? overlayColor;
  final double overlayOpacity;

  const ImageCard({
    this.imagePath = 'assets/course_header.jpg',
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(5)),
    this.overlayColor,
    this.overlayOpacity = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            width: width ?? double.infinity,
            height: height ?? double.infinity,
            fit: BoxFit.cover,
          ),
          if (overlayColor != null && overlayOpacity > 0)
            Container(
              width: width ?? double.infinity,
              height: height ?? double.infinity,
              color: overlayColor!.withOpacity(overlayOpacity),
            ),
        ],
      ),
    );
  }
}

