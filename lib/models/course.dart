import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String id;
  final String title;
  final String institute;
  final String image;
  final double rating;
  final double? progress;
  final int? price;

  const Course({
    required this.id,
    required this.title,
    required this.institute,
    required this.image,
    required this.rating,
    this.progress,
    this.price,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as String,
      title: json['title'] as String,
      institute: json['institute'] as String,
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
      progress: json['progress'] != null ? (json['progress'] as num).toDouble() / 100.0 : null,
      price: json['price'] as int?,
    );
  }

  @override
  List<Object?> get props => [id, title, institute, image, rating, progress, price];
}

class CourseDetails extends Equatable {
  final String id;
  final String title;
  final String institute;
  final int price;
  final String currency;
  final int enrolledStudents;
  final double rating;
  final int lectures;
  final String duration;
  final String certification;
  final String thumbnail;
  final String description;
  final List<String> skills;

  const CourseDetails({
    required this.id,
    required this.title,
    required this.institute,
    required this.price,
    required this.currency,
    required this.enrolledStudents,
    required this.rating,
    required this.lectures,
    required this.duration,
    required this.certification,
    required this.thumbnail,
    required this.description,
    required this.skills,
  });

  factory CourseDetails.fromJson(Map<String, dynamic> json) {
    return CourseDetails(
      id: json['id'] as String,
      title: json['title'] as String,
      institute: json['institute'] as String,
      price: json['price'] as int,
      currency: json['currency'] as String,
      enrolledStudents: json['enrolledStudents'] as int,
      rating: (json['rating'] as num).toDouble(),
      lectures: json['lectures'] as int,
      duration: json['duration'] as String,
      certification: json['certification'] as String,
      thumbnail: json['thumbnail'] as String,
      description: json['description'] as String,
      skills: (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        institute,
        price,
        currency,
        enrolledStudents,
        rating,
        lectures,
        duration,
        certification,
        thumbnail,
        description,
        skills,
      ];
}

class HomeData extends Equatable {
  final String userName;
  final int notifications;
  final List<Course> continueWatching;
  final List<String> categories;
  final List<Course> suggestions;
  final List<Course> topCourses;

  const HomeData({
    required this.userName,
    required this.notifications,
    required this.continueWatching,
    required this.categories,
    required this.suggestions,
    required this.topCourses,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    final homeJson = json['home'] as Map<String, dynamic>;
    final userJson = homeJson['user'] as Map<String, dynamic>;

    return HomeData(
      userName: userJson['name'] as String,
      notifications: userJson['notifications'] as int,
      continueWatching: (homeJson['continueWatching'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (homeJson['categories'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>)['name'] as String)
          .toList(),
      suggestions: (homeJson['suggestions'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      topCourses: (homeJson['topCourses'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [userName, notifications, continueWatching, categories, suggestions, topCourses];
}
