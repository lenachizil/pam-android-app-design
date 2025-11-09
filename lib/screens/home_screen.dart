import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_event.dart';
import '../bloc/home/home_state.dart';
import '../widgets/course_card.dart';
import '../widgets/horizontal_course_list.dart';
import '../widgets/welcome_header.dart';
import '../widgets/search_field.dart';
import '../widgets/section_header.dart';
import '../widgets/category_chip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(LoadHomeData());

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is HomeError) {
                return Center(child: Text('Error: ${state.message}'));
              } else if (state is HomeLoaded) {
                final homeData = state.homeData;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WelcomeHeader(userName: homeData.userName),
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
                          itemCount: homeData.continueWatching.length,
                          itemBuilder: (context, index) {
                            final course = homeData.continueWatching[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10.0),
                              child: GestureDetector(
                                onTap: () => Navigator.pushNamed(context, '/course', arguments: course.id),
                                child: CourseCard(
                                  title: course.title,
                                  subtitle: course.institute,
                                  progress: course.progress ?? 0.0,
                                  imagePath: course.image,
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
                            itemCount: homeData.categories.length,
                            separatorBuilder: (_, __) => SizedBox(width: 4),
                            itemBuilder: (context, index) => CategoryChip(label: homeData.categories[index]),
                          ),
                        ),
                        SizedBox(height: 2),
                        SectionHeader(title: 'Suggestions for You'),
                        SizedBox(height: 2),
                        HorizontalCourseList(
                          courses: homeData.suggestions,
                          height: 185,
                          onCourseTap: (courseId) => Navigator.pushNamed(context, '/course', arguments: courseId),
                        ),
                        SizedBox(height: 2),
                        SectionHeader(title: 'Top Courses'),
                        SizedBox(height: 2),
                        HorizontalCourseList(
                          courses: homeData.topCourses,
                          height: 185,
                          onCourseTap: (courseId) => Navigator.pushNamed(context, '/course', arguments: courseId),
                        ),
                        SizedBox(height: 14),
                      ],
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
