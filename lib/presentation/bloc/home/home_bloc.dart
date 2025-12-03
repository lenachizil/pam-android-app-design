import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_home_data_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;

  HomeBloc({required this.getHomeDataUseCase}) : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final homeData = await getHomeDataUseCase();
      emit(HomeLoaded(homeData));
    } catch (e) {
      emit(HomeError('Failed to load home data: ${e.toString()}'));
    }
  }
}

