import 'package:flutter/material.dart';
import 'common_widgets.dart';

// Image Card - displays an image with optional overlays
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

// Course Card
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

// Suggestion Card
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
                    child: Image.asset(
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

// Horizontal Course List
class HorizontalCourseList extends StatelessWidget {
  final List<dynamic> courses;
  final double height;
  final Function(String courseId) onCourseTap;

  const HorizontalCourseList({
    required this.courses,
    required this.height,
    required this.onCourseTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => onCourseTap(course.id),
              child: SuggestionCard(
                title: course.title,
                subtitle: course.subtitle,
                imagePath: course.imagePath,
                rating: course.rating,
                bookmarked: index == 0,
              ),
            ),
          );
        },
      ),
    );
  }
}
