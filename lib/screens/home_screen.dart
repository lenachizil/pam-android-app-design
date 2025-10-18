import 'package:flutter/material.dart';
import '../models/course_data.dart';
import '../models/course.dart';
import '../widgets/cards.dart';
import '../widgets/common_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    final List<Course> continueWatching = CourseData.getContinueWatching();
    final List<Course> suggestions = CourseData.getSuggestions().take(4).toList();
    final List<Course> topCourses = CourseData.getTopCourses();

    final List<String> categories = [
      'Graphic Design',
      'User Interface',
      'User Experience',
      'Animation',
      'Branding',
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeHeader(userName: 'Sidra'),
                  SizedBox(height: 12),
                  SearchField(),
                  SizedBox(height: 18),
                  Text(
                    'Continue Watching',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00434C),
                      fontFamily: 'PlusJakartaSans',
                    ),
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: continueWatching.length,
                    itemBuilder: (context, index) {
                      final course = continueWatching[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10.0),
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/course', arguments: course.id),
                          child: CourseCard(
                            title: course.title,
                            subtitle: course.subtitle,
                            progress: course.progress ?? 0.0,
                            imagePath: course.imagePath,
                            rating: course.rating,
                            showPercentage: true,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 2),
                  SectionHeader(title: 'Categories'),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (_, __) => SizedBox(width: 4),
                      itemBuilder: (context, index) => CategoryChip(label: categories[index]),
                    ),
                  ),
                  SizedBox(height: 2),
                  SectionHeader(title: 'Suggestions for You'),
                  SizedBox(height: 2),
                  HorizontalCourseList(
                    courses: suggestions,
                    height: 185,
                    onCourseTap: (courseId) => Navigator.pushNamed(context, '/course', arguments: courseId),
                  ),
                  SizedBox(height: 2),
                  SectionHeader(title: 'Top Courses'),
                  SizedBox(height: 2),
                  HorizontalCourseList(
                    courses: topCourses,
                    height: 185,
                    onCourseTap: (courseId) => Navigator.pushNamed(context, '/course', arguments: courseId),
                  ),
                  SizedBox(height: 14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
