import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/course.dart';

class CourseRepository {
  Future<HomeData> loadHomeData() async {
    final String jsonString = await rootBundle.loadString('assets/data/data.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return HomeData.fromJson(jsonData);
  }

  Future<CourseDetails> loadCourseDetails() async {
    final String jsonString = await rootBundle.loadString('assets/data/data.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    final courseJson = jsonData['details']['course'] as Map<String, dynamic>;
    return CourseDetails.fromJson(courseJson);
  }
}

