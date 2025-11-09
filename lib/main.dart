import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_screen.dart';
import 'screens/course_screen.dart';
import 'repositories/course_repository.dart';
import 'bloc/home/home_bloc.dart';
import 'bloc/course/course_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final CourseRepository repository = CourseRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(repository: repository),
        ),
        BlocProvider(
          create: (context) => CourseBloc(repository: repository),
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
