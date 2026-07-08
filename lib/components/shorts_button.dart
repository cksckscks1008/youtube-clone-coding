import 'package:flutter/material.dart';

class ShortsButton extends StatelessWidget {
  final IconData icon;
  final dynamic text;
  final VoidCallback onCilck;

  const ShortsButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onCilck,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: onCilck,
        child: Container(
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 28,
                shadows: [
                  Shadow(
                    color: Colors.black38,
                    offset: Offset(1.0, 1.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black38,
                      offset: Offset(1.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
