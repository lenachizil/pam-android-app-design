import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/course_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CourseRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final homeData = await repository.loadHomeData();
      emit(HomeLoaded(homeData));
    } catch (e) {
      emit(HomeError('Failed to load home data: ${e.toString()}'));
    }
  }
}

