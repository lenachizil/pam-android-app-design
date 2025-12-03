import 'package:equatable/equatable.dart';

class InstructorEntity extends Equatable {
  final String name;
  final String title;
  final String bio;
  final String image;

  const InstructorEntity({
    required this.name,
    required this.title,
    required this.bio,
    required this.image,
  });

  @override
  List<Object?> get props => [name, title, bio, image];
}

