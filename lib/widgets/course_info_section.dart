import 'package:flutter/material.dart';

class CourseInfoSection extends StatelessWidget {
  final String? lectures;
  final String? learningTime;
  final String? certification;

  const CourseInfoSection({
    this.lectures,
    this.learningTime,
    this.certification,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          if (lectures != null) _buildInfoRow(Icons.book, 'Lectures', lectures!),
          if (learningTime != null) ...[
            SizedBox(height: 13),
            _buildInfoRow(Icons.access_time, 'Learning Time', learningTime!),
          ],
          if (certification != null) ...[
            SizedBox(height: 13),
            _buildInfoRow(Icons.military_tech, 'Certification', certification!),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Color(0xFF00707E)),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00434C),
              fontFamily: 'PlusJakartaSans',
            ),
          ),
        ),
        SizedBox(width: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 120,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6C6C6C),
                fontFamily: 'PlusJakartaSans',
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}

