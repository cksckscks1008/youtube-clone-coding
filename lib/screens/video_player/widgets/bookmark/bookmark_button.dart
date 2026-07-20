import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/constants/colors.dart';

class BookmarkButton extends StatefulWidget {
  final String image;
  final String title;

  const BookmarkButton({super.key, required this.image, required this.title});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isFilled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        spacing: 5,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            width: 90,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: Image.network(widget.image, fit: BoxFit.cover), 
            )
          ),
          SizedBox(width: 4,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [Text(widget.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),), Text('비공개', style: TextStyle(color: Colors.white38, fontSize: 14, fontWeight: FontWeight.w600),)],
          ),
          Spacer(),
          IconButton(
            onPressed: () => setState(() {
              isFilled = !isFilled;
            }),
            icon: isFilled ? Icon(Icons.bookmark, color: Colors.white, size: 37,) : Icon(Icons.bookmark_border, color: Colors.white, size: 37,),
          ),
        ],
      ),
    );
  }
}
