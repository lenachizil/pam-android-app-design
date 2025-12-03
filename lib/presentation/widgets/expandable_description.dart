import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

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

