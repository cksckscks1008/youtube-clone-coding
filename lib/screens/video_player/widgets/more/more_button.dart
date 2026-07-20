import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const MoreButton({
    super.key,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 30,),
          const SizedBox(width: 13,),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
