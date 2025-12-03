import 'package:flutter/material.dart';
import 'bookmark_button.dart';

class CourseHeader extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onPlayPressed;

  const CourseHeader({
    required this.imagePath,
    this.onPlayPressed,
  });

  bool _isNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: _isNetworkImage(imagePath)
                    ? NetworkImage(imagePath) as ImageProvider
                    : AssetImage(imagePath) as ImageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF018697).withValues(alpha: 0.6),
                    Color(0xFF00434C).withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 8,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Icon(Icons.arrow_back, color: Colors.white, size: 20),
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: BookmarkButton(),
          ),
          Center(
            child: GestureDetector(
              onTap: onPlayPressed,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Color(0xFF00707E),
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
