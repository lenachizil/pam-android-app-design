import 'package:flutter/material.dart';
import '../models/course.dart';
import 'suggestion_card.dart';

class RelatedCoursesSection extends StatelessWidget {
  final List<Course> relatedCourses;

  const RelatedCoursesSection({required this.relatedCourses});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Related Courses',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00707E),
            fontFamily: 'PlusJakartaSans',
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 185,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: relatedCourses.length,
            itemBuilder: (context, index) {
              final course = relatedCourses[index];
              return Padding(
                padding: EdgeInsets.only(right: 8),
                child: SuggestionCard(
                  title: course.title,
                  subtitle: course.institute,
                  imagePath: course.image,
                  rating: course.rating,
                  bookmarked: false,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
