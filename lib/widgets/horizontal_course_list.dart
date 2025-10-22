import 'package:flutter/material.dart';
import 'suggestion_card.dart';

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

