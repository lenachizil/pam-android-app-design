import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final String id;
  final String title;
  final String institute;
  final String image;
  final double rating;
  final double? progress;
  final int? price;

  const CourseEntity({
    required this.id,
    required this.title,
    required this.institute,
    required this.image,
    required this.rating,
    this.progress,
    this.price,
  });

  @override
  List<Object?> get props => [id, title, institute, image, rating, progress, price];
}

