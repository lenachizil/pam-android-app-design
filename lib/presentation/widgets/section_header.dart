import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const SectionHeader({required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00434C),
            fontFamily: 'PlusJakartaSans',
          ),
        ),
        TextButton(
          onPressed: onSeeAll ?? () {},
          child: Text(
            'See All',
            style: TextStyle(
              fontSize: 10,
              decoration: TextDecoration.underline,
              color: Color(0xFF6C6C6C),
              fontFamily: 'PlusJakartaSans',
            ),
          ),
        ),
      ],
    );
  }
}

