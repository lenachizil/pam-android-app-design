import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_course_details_usecase.dart';
import 'course_event.dart';
import 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final GetCourseDetailsUseCase getCourseDetailsUseCase;

  CourseBloc({required this.getCourseDetailsUseCase}) : super(CourseInitial()) {
    on<LoadCourseDetails>(_onLoadCourseDetails);
  }

  Future<void> _onLoadCourseDetails(LoadCourseDetails event, Emitter<CourseState> emit) async {
    emit(CourseLoading());
    try {
      final courseDetails = await getCourseDetailsUseCase();
      emit(CourseLoaded(courseDetails));
    } catch (e) {
      emit(CourseError('Failed to load course details: ${e.toString()}'));
    }
  }
}

