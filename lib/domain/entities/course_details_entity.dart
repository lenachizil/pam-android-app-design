import 'package:equatable/equatable.dart';
import 'course_entity.dart';
import 'instructor_entity.dart';
import 'lesson_entity.dart';

class CourseDetailsEntity extends Equatable {
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
  final String? previewVideo;
  final String description;
  final List<String> skills;
  final InstructorEntity? instructor;
  final List<LessonEntity> lessons;
  final List<CourseEntity> relatedCourses;

  const CourseDetailsEntity({
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
    this.previewVideo,
    required this.description,
    required this.skills,
    this.instructor,
    this.lessons = const [],
    this.relatedCourses = const [],
  });

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
        previewVideo,
        description,
        skills,
        instructor,
        lessons,
        relatedCourses,
      ];
}
