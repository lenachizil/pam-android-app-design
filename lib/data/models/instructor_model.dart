import '../../domain/entities/instructor_entity.dart';

class InstructorModel extends InstructorEntity {
  const InstructorModel({
    required super.name,
    required super.title,
    required super.bio,
    required super.image,
  });

  factory InstructorModel.fromJson(Map<String, dynamic> json) {
    return InstructorModel(
      name: json['name'] as String,
      title: json['title'] as String,
      bio: json['bio'] as String,
      image: json['image'] as String,
    );
  }
}

