import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  const CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.92,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF00707E)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11.35,
            fontWeight: FontWeight.w600,
            color: Color(0xFF00434C),
            fontFamily: 'PlusJakartaSans',
          ),
        ),
      ),
    );
  }
}

