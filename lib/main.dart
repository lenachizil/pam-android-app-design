import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/course_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
