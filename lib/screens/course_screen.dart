import 'package:flutter/material.dart';
import '../models/course_data.dart';
import '../models/course.dart';
import '../widgets/course_widgets.dart';
import '../widgets/common_widgets.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen();

  @override
  Widget build(BuildContext context) {
    final String? courseId = ModalRoute.of(context)?.settings.arguments as String?;
    final Course course = courseId != null
        ? CourseData.getCourseById(courseId) ?? CourseData.allCourses.first
        : CourseData.allCourses.first;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CourseHeader(
              imagePath: course.imagePath,
              onPlayPressed: () {},
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CourseTitleSection(
                        title: course.title,
                        subtitle: course.subtitle,
                        studentsEnrolled: course.studentsEnrolled,
                        price: course.price,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Course Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00707E),
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                      SizedBox(height: 10),
                      ExpandableDescription(
                        description: course.description ?? 'No description available.',
                      ),
                      SizedBox(height: 28),
                      CourseInfoSection(
                        lectures: course.lectures,
                        learningTime: course.learningTime,
                        certification: course.certification,
                      ),
                      if (course.skills?.isNotEmpty ?? false) ...[
                        SizedBox(height: 24),
                        Text(
                          'Skills',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00707E),
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: course.skills!.map((skill) => SkillChip(label: skill)).toList(),
                        ),
                      ],
                      SizedBox(height: 35),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF00707E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Text(
                            'ENROLL NOW',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFD9EFF2),
                              fontFamily: 'PlusJakartaSans',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Start your 7-day free Trial',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF6C6C6C),
                            fontSize: 12,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
