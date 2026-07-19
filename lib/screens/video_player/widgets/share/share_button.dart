import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const ShareButton({
    super.key,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8),
          child: Row(
            spacing: 10,
            children: [
              IconButton.filled(onPressed: () {}, icon: Icon(icon, size: 27,), style: IconButton.styleFrom(
                backgroundColor: Colors.white12,
              ), ),
              Text(text, style: TextStyle(color: Colors.white, fontSize: 15.5),)
            ],
          ),
        ),
      ),
    );
  }
}
