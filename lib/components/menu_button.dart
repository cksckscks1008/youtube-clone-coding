import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  Function click;
  IconData icon;
  String title;

  MenuButton({
    super.key,
    required this.click,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(shadowColor: Colors.transparent),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () => click(),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Icon(icon, color: Colors.white, size: 35),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
