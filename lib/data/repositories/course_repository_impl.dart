import '../../domain/entities/course_details_entity.dart';
import '../../domain/entities/home_data_entity.dart';
import '../../domain/repositories/course_repository.dart';
import '../datasources/course_data_source.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseDataSource dataSource;

  CourseRepositoryImpl({required this.dataSource});

  @override
  Future<HomeDataEntity> getHomeData() async {
    final homeDataModel = await dataSource.getHomeData();
    return homeDataModel.toEntity();
  }

  @override
  Future<CourseDetailsEntity> getCourseDetails() async {
    final courseDetailsModel = await dataSource.getCourseDetails();
    return courseDetailsModel.toEntity();
  }
}

