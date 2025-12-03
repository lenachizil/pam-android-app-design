import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/course_screen.dart';
import 'presentation/bloc/home/home_bloc.dart';
import 'presentation/bloc/course/course_bloc.dart';
import 'domain/usecases/get_home_data_usecase.dart';
import 'domain/usecases/get_course_details_usecase.dart';
import 'domain/repositories/course_repository.dart';
import 'data/repositories/course_repository_impl.dart';
import 'data/datasources/course_data_source.dart';
import 'data/datasources/course_remote_data_source.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data Layer - Remote API Data Source
    final CourseDataSource dataSource = CourseRemoteDataSource();

    // Domain Layer
    final CourseRepository repository = CourseRepositoryImpl(
      dataSource: dataSource,
    );

    // Use Cases
    final GetHomeDataUseCase getHomeDataUseCase = GetHomeDataUseCase(repository);
    final GetCourseDetailsUseCase getCourseDetailsUseCase = GetCourseDetailsUseCase(repository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(getHomeDataUseCase: getHomeDataUseCase),
        ),
        BlocProvider(
          create: (context) => CourseBloc(getCourseDetailsUseCase: getCourseDetailsUseCase),
        ),
      ],
      child: MaterialApp(
        title: 'Course UI Demo',
        theme: ThemeData(
          primaryColor: Color(0xFF00434C),
          scaffoldBackgroundColor: Color(0xFFF8FAFC),
          fontFamily: 'PlusJakartaSans',
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => HomeScreen(),
          '/course': (_) => CourseScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
