import 'package:equatable/equatable.dart';

class LessonEntity extends Equatable {
  final String id;
  final String title;
  final String duration;
  final bool isPreview;

  const LessonEntity({
    required this.id,
    required this.title,
    required this.duration,
    required this.isPreview,
  });

  @override
  List<Object?> get props => [id, title, duration, isPreview];
}

