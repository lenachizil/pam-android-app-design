import 'package:flutter/material.dart';
import '../../domain/entities/instructor_entity.dart';

class InstructorSection extends StatelessWidget {
  final InstructorEntity instructor;

  const InstructorSection({required this.instructor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instructor',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00707E),
            fontFamily: 'PlusJakartaSans',
          ),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFFDEDEDE)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  instructor.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 60,
                      height: 60,
                      color: Color(0xFFDEDEDE),
                      child: Icon(Icons.person, color: Color(0xFF6C6C6C)),
                    );
                  },
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      instructor.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00434C),
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      instructor.title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF00707E),
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      instructor.bio,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6C6C6C),
                        fontFamily: 'PlusJakartaSans',
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

