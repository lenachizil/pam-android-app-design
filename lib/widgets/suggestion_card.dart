import 'package:flutter/material.dart';
import 'bookmark_button.dart';

class SuggestionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final double? rating;
  final bool bookmarked;

  const SuggestionCard({
    required this.title,
    this.subtitle = '',
    this.imagePath = 'assets/course_header.jpg',
    this.rating,
    this.bookmarked = false,
  });

  bool _isNetworkImage(String path) {
    return path.startsWith('http://') || path.startsWith('https://');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: _isNetworkImage(imagePath)
                        ? Image.network(
                            imagePath,
                            width: 118,
                            height: 92,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 118,
                                height: 92,
                                color: Colors.grey[300],
                                child: Icon(Icons.image_not_supported, color: Colors.grey[600]),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                width: 118,
                                height: 92,
                                color: Colors.grey[200],
                                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                              );
                            },
                          )
                        : Image.asset(
                            imagePath,
                            width: 118,
                            height: 92,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: BookmarkButton(initialBookmarked: bookmarked),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF00434C),
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              SizedBox(height: 2),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 8,
                  color: Color(0xFF6C6C6C),
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              if (rating != null) ...[
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Color(0xFF00434C), size: 12),
                    SizedBox(width: 4),
                    Text(
                      rating!.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 6,
                        color: Color(0xFF6C6C6C),
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
