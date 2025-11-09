import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/course_repository.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository repository;

  CourseBloc({required this.repository}) : super(CourseInitial()) {
    on<LoadCourseDetails>(_onLoadCourseDetails);
  }

  Future<void> _onLoadCourseDetails(LoadCourseDetails event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      final courseDetails = await repository.loadCourseDetails();
      emit(CourseLoaded(courseDetails));
    } catch (e) {
      emit(CourseError('Failed to load course details: ${e.toString()}'));
    }
  }
}

