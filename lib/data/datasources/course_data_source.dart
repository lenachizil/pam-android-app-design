import '../models/course_details_model.dart';
import '../models/home_data_model.dart';

abstract class CourseDataSource {
  Future<HomeDataModel> getHomeData();
  Future<CourseDetailsModel> getCourseDetails();
}

