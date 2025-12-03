import '../entities/course_details_entity.dart';
import '../entities/home_data_entity.dart';

abstract class CourseRepository {
  Future<HomeDataEntity> getHomeData();
  Future<CourseDetailsEntity> getCourseDetails();
}

