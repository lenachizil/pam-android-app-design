import 'package:flutter/material.dart';
import '../../domain/entities/course_entity.dart';
import 'related_course_card.dart';

class RelatedCoursesSection extends StatelessWidget {
  final List<CourseEntity> relatedCourses;

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
                child: RelatedCourseCard(
                  title: course.title,
                  subtitle: course.institute,
                  imagePath: course.image,
                  rating: course.rating,
                  price: course.price,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

