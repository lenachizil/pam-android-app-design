import 'package:flutter/material.dart';
import 'image_card.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;
  final String imagePath;
  final double? rating;
  final bool showPercentage;

  const CourseCard({
    required this.title,
    this.subtitle = '',
    this.progress = 0.0,
    this.imagePath = 'assets/course_header.jpg',
    this.rating,
    this.showPercentage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.only(left:10, right:10, top:10, bottom:5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCard(
            imagePath: imagePath,
            width: 87,
            height: 58,
            borderRadius: BorderRadius.circular(5),
            overlayColor: Color(0xFF00707E),
            overlayOpacity: 0.35,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00434C),
                    fontFamily: 'PlusJakartaSans',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 7,
                    color: Color(0xFF6C6C6C),
                    fontFamily: 'PlusJakartaSans',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (rating != null) ...[
                  SizedBox(height: 2),
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
                  SizedBox(height: 4),
                ],
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: Colors.grey[200],
                    color: Color(0xFF00434C),
                  ),
                ),
                if (showPercentage)
                  Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${(progress * 100).toStringAsFixed(0)}% Completed',
                        style: TextStyle(
                          fontSize: 6,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6C6C6C),
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

