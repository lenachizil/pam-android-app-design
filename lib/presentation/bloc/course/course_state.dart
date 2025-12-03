import 'package:equatable/equatable.dart';
import '../../../domain/entities/course_details_entity.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseLoaded extends CourseState {
  final CourseDetailsEntity courseDetails;

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

