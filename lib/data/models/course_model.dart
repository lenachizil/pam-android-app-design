import '../../domain/entities/course_entity.dart';

class CourseModel extends CourseEntity {
  const CourseModel({
    required super.id,
    required super.title,
    required super.institute,
    required super.image,
    required super.rating,
    super.progress,
    super.price,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] as String,
      title: json['title'] as String,
      institute: json['institute'] as String,
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
      progress: json['progress'] != null ? (json['progress'] as num).toDouble() / 100.0 : null,
      price: json['price'] as int?,
    );
  }
}

