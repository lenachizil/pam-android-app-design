import 'package:equatable/equatable.dart';
import 'course_entity.dart';

class HomeDataEntity extends Equatable {
  final String userName;
  final int notifications;
  final List<CourseEntity> continueWatching;
  final List<String> categories;
  final List<CourseEntity> suggestions;
  final List<CourseEntity> topCourses;

  const HomeDataEntity({
    required this.userName,
    required this.notifications,
    required this.continueWatching,
    required this.categories,
    required this.suggestions,
    required this.topCourses,
  });

  @override
  List<Object?> get props => [userName, notifications, continueWatching, categories, suggestions, topCourses];
}

