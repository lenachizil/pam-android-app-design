import '../entities/home_data_entity.dart';
import '../repositories/course_repository.dart';

class GetHomeDataUseCase {
  final CourseRepository repository;

  GetHomeDataUseCase(this.repository);

  Future<HomeDataEntity> call() async {
    return await repository.getHomeData();
  }
}

