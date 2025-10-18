import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'common_widgets.dart';

// Course Header with image, back button, bookmark, and play button
class CourseHeader extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onPlayPressed;

  const CourseHeader({
    required this.imagePath,
    this.onPlayPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color(0xFF018697).withValues(alpha: 0.6),
                    Color(0xFF00434C).withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 8,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Icon(Icons.arrow_back, color: Colors.white, size: 20),
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: BookmarkButton(),
          ),
          Center(
            child: GestureDetector(
              onTap: onPlayPressed,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: Color(0xFF00707E),
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Course Title Section with title, subtitle, students enrolled, and price
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

// Expandable Description with Read More functionality
class ExpandableDescription extends StatefulWidget {
  final String description;
  final int maxLength;

  const ExpandableDescription({
    required this.description,
    this.maxLength = 150,
  });

  @override
  _ExpandableDescriptionState createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    if (_isExpanded || widget.description.length <= widget.maxLength) {
      return Text(
        widget.description,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: Color(0xFF6C6C6C),
          fontFamily: 'PlusJakartaSans',
        ),
      );
    }

    String truncated = widget.description.substring(0, widget.maxLength);

    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: Color(0xFF6C6C6C),
          fontFamily: 'PlusJakartaSans',
        ),
        children: [
          TextSpan(text: truncated),
          TextSpan(
            text: ' Read More...',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00434C),
              fontFamily: 'PlusJakartaSans',
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => setState(() => _isExpanded = true),
          ),
        ],
      ),
    );
  }
}

// Course Info Section with lectures, learning time, and certification
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
