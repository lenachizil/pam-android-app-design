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

  bool _isNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          _isNetworkImage(imagePath)
              ? Image.network(
                  imagePath,
                  width: width ?? double.infinity,
                  height: height ?? double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: width ?? double.infinity,
                      height: height ?? double.infinity,
                      color: Colors.grey[300],
                      child: Icon(Icons.image_not_supported, color: Colors.grey[600]),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: width ?? double.infinity,
                      height: height ?? double.infinity,
                      color: Colors.grey[200],
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                )
              : Image.asset(
                  imagePath,
                  width: width ?? double.infinity,
                  height: height ?? double.infinity,
                  fit: BoxFit.cover,
                ),
          if (overlayColor != null && overlayOpacity > 0)
            Container(
              width: width ?? double.infinity,
              height: height ?? double.infinity,
              color: overlayColor!.withValues(alpha: overlayOpacity),
            ),
        ],
      ),
    );
  }
}
