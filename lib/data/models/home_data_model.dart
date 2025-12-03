import '../../domain/entities/home_data_entity.dart';
import 'course_model.dart';

class HomeDataModel extends HomeDataEntity {
  const HomeDataModel({
    required super.userName,
    required super.notifications,
    required super.continueWatching,
    required super.categories,
    required super.suggestions,
    required super.topCourses,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    // Handle both API format (flat) and local JSON format (wrapped in 'home')
    final homeJson = json.containsKey('home')
        ? json['home'] as Map<String, dynamic>
        : json;

    final userJson = homeJson['user'] as Map<String, dynamic>;

    return HomeDataModel(
      userName: userJson['name'] as String,
      notifications: userJson['notifications'] as int,
      continueWatching: (homeJson['continueWatching'] as List<dynamic>)
          .map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (homeJson['categories'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>)['name'] as String)
          .toList(),
      suggestions: (homeJson['suggestions'] as List<dynamic>)
          .map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      topCourses: (homeJson['topCourses'] as List<dynamic>)
          .map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  HomeDataEntity toEntity() => this;
}

