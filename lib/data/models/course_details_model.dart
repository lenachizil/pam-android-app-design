import '../../domain/entities/course_details_entity.dart';
import 'course_model.dart';
import 'instructor_model.dart';
import 'lesson_model.dart';

class CourseDetailsModel extends CourseDetailsEntity {
  const CourseDetailsModel({
    required super.id,
    required super.title,
    required super.institute,
    required super.price,
    required super.currency,
    required super.enrolledStudents,
    required super.rating,
    required super.lectures,
    required super.duration,
    required super.certification,
    required super.thumbnail,
    super.previewVideo,
    required super.description,
    required super.skills,
    super.instructor,
    super.lessons,
    super.relatedCourses,
  });

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> courseJson;
    if (json.containsKey('course')) {
      courseJson = json['course'] as Map<String, dynamic>;
    } else if (json.containsKey('details')) {
      courseJson = (json['details'] as Map<String, dynamic>)['course'] as Map<String, dynamic>;
    } else {
      courseJson = json;
    }

    return CourseDetailsModel(
      id: courseJson['id'] as String,
      title: courseJson['title'] as String,
      institute: courseJson['institute'] as String,
      price: courseJson['price'] as int,
      currency: courseJson['currency'] as String,
      enrolledStudents: courseJson['enrolledStudents'] as int,
      rating: (courseJson['rating'] as num).toDouble(),
      lectures: courseJson['lectures'] as int,
      duration: courseJson['duration'] as String,
      certification: courseJson['certification'] as String,
      thumbnail: courseJson['thumbnail'] as String,
      previewVideo: courseJson['previewVideo'] as String?,
      description: courseJson['description'] as String,
      skills: (courseJson['skills'] as List<dynamic>).map((e) => e as String).toList(),
      instructor: courseJson['instructor'] != null
          ? InstructorModel.fromJson(courseJson['instructor'] as Map<String, dynamic>)
          : null,
      lessons: courseJson['lessons'] != null
          ? (courseJson['lessons'] as List<dynamic>)
              .map((e) => LessonModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      relatedCourses: courseJson['relatedCourses'] != null
          ? (courseJson['relatedCourses'] as List<dynamic>)
              .map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
    );
  }

  CourseDetailsEntity toEntity() => this;
}

