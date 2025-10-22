import 'package:flutter/material.dart';

class WelcomeHeader extends StatelessWidget {
  final String userName;
  final VoidCallback? onNotificationPressed;

  const WelcomeHeader({
    required this.userName,
    this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Welcome ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
              TextSpan(
                text: userName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00434C),
                  fontFamily: 'PlusJakartaSans',
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onNotificationPressed ?? () {},
          icon: Icon(Icons.notifications, color: Color(0xFF00707E)),
        ),
      ],
    );
  }
}

