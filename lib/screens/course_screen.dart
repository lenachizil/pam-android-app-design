import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/course/course_bloc.dart';
import '../bloc/course/course_event.dart';
import '../bloc/course/course_state.dart';
import '../widgets/course_header.dart';
import '../widgets/course_title_section.dart';
import '../widgets/expandable_description.dart';
import '../widgets/course_info_section.dart';
import '../widgets/skill_chip.dart';
import '../widgets/instructor_section.dart';
import '../widgets/lessons_section.dart';
import '../widgets/related_courses_section.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen();

  @override
  Widget build(BuildContext context) {
    final String? courseId = ModalRoute.of(context)?.settings.arguments as String?;
    context.read<CourseBloc>().add(LoadCourseDetails());

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CourseError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is CourseLoaded) {
              final course = state.courseDetails;
              return Column(
                children: [
                  CourseHeader(
                    imagePath: course.thumbnail,
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
                              subtitle: course.institute,
                              studentsEnrolled: '${(course.enrolledStudents / 1000).toStringAsFixed(1)}k students already enrolled',
                              price: '\$${course.price}',
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
                              description: course.description,
                            ),
                            SizedBox(height: 28),
                            CourseInfoSection(
                              lectures: '${course.lectures}+ Lectures',
                              learningTime: course.duration,
                              certification: course.certification,
                            ),
                            if (course.skills.isNotEmpty) ...[
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
                                children: course.skills.map((skill) => SkillChip(label: skill)).toList(),
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
                            if (course.instructor != null) ...[
                              InstructorSection(
                                instructor: course.instructor!,
                              ),
                              SizedBox(height: 24),
                            ],
                            if (course.lessons.isNotEmpty) ...[
                              LessonsSection(
                                lessons: course.lessons,
                              ),
                              SizedBox(height: 24),
                            ],
                            if (course.relatedCourses.isNotEmpty) ...[
                              RelatedCoursesSection(
                                relatedCourses: course.relatedCourses,
                              ),
                              SizedBox(height: 24),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
