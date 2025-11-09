import 'package:equatable/equatable.dart';
import '../../models/course.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final CourseDetails courseDetails;

  const CourseLoaded(this.courseDetails);

  @override
  List<Object> get props => [courseDetails];
}

class CourseError extends CourseState {
  final String message;

  const CourseError(this.message);

  @override
  List<Object> get props => [message];
}

