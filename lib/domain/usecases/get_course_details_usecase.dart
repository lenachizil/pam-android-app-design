import '../entities/course_details_entity.dart';
import '../repositories/course_repository.dart';

class GetCourseDetailsUseCase {
  final CourseRepository repository;

  GetCourseDetailsUseCase(this.repository);

  Future<CourseDetailsEntity> call() async {
    return await repository.getCourseDetails();
  }
}

