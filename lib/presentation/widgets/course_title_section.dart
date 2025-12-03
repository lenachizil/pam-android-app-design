import 'package:flutter/material.dart';

class CourseTitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? studentsEnrolled;
  final String? price;

  const CourseTitleSection({
    required this.title,
    required this.subtitle,
    this.studentsEnrolled,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00434C),
            fontFamily: 'PlusJakartaSans',
          ),
        ),
        SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF00707E),
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
            ),
            if (price != null)
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  price!,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00434C),
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 5),
        if (studentsEnrolled != null)
          Row(
            children: [
              Icon(Icons.people, color: Color(0xFF00707E), size: 10),
              SizedBox(width: 4),
              Text(
                studentsEnrolled!,
                style: TextStyle(
                  fontSize: 7.64,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF00707E),
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
            ],
          ),
      ],
    );
  }
}

