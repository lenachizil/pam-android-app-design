import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  final bool initialBookmarked;
  final Function(bool)? onBookmarkChanged;

  const BookmarkButton({
    this.initialBookmarked = false,
    this.onBookmarkChanged,
  });

  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  late bool isBookmarked;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.initialBookmarked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isBookmarked = !isBookmarked);
        widget.onBookmarkChanged?.call(isBookmarked);
      },
      child: Container(
        width: 18.24,
        height: 21,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Icon(
            isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: Color(0xFF00707E),
            size: 14,
          ),
        ),
      ),
    );
  }
}

