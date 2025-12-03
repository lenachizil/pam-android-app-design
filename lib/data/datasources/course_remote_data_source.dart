import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/course_details_model.dart';
import '../models/home_data_model.dart';
import 'course_data_source.dart';

class CourseRemoteDataSource implements CourseDataSource {
  static const String baseUrl = 'https://test-api-jlbn.onrender.com/v1';
  final http.Client client;

  CourseRemoteDataSource({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<HomeDataModel> getHomeData() async {
    final response = await client.get(
      Uri.parse('$baseUrl/feed'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return HomeDataModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load home data: ${response.statusCode}');
    }
  }

  @override
  Future<CourseDetailsModel> getCourseDetails() async {
    final response = await client.get(
      Uri.parse('$baseUrl/feed/details'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return CourseDetailsModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load course details: ${response.statusCode}');
    }
  }
}

