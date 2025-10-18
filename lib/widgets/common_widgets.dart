import 'package:flutter/material.dart';

// Bookmark Button - clickable bookmark icon with white background
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

// Category Chip - for categories section with border
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

// Skill Chip - for skills section with light border
class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFFDEDEDE)),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF00434C),
          fontFamily: 'PlusJakartaSans',
        ),
      ),
    );
  }
}

// Section Header - title with "See All" button
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

// Search Field
class SearchField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;

  const SearchField({
    this.hintText = 'Search',
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.2),
        ),
      ),
    );
  }
}

// Welcome Header
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
          icon: Icon(Icons.notifications_none, color: Color(0xFF00707E)),
        ),
      ],
    );
  }
}
