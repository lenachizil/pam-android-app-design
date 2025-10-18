class Course {
  final String id;
  final String title;
  final String subtitle;
  final String imagePath;
  final double rating;
  final double? progress;
  final String? price;
  final String? description;
  final String? lectures;
  final String? learningTime;
  final String? certification;
  final List<String>? skills;
  final String? studentsEnrolled;

  Course({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.rating,
    this.progress,
    this.price,
    this.description,
    this.lectures,
    this.learningTime,
    this.certification,
    this.skills,
    this.studentsEnrolled,
  });
}
