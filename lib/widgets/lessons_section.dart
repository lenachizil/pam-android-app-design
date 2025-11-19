import 'package:flutter/material.dart';
import '../models/course.dart';

class LessonsSection extends StatelessWidget {
  final List<Lesson> lessons;

  const LessonsSection({required this.lessons});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lessons',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00707E),
            fontFamily: 'PlusJakartaSans',
          ),
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFFDEDEDE)),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: lessons.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Color(0xFFDEDEDE),
            ),
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9EFF2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      lesson.isPreview ? Icons.play_circle_outline : Icons.lock_outline,
                      color: Color(0xFF00707E),
                      size: 20,
                    ),
                  ),
                ),
                title: Text(
                  lesson.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF00434C),
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (lesson.isPreview)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFF00707E),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'PREVIEW',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                      ),
                    SizedBox(width: 8),
                    Text(
                      lesson.duration,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6C6C6C),
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

