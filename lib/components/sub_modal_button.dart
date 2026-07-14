import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/Theme/colors.dart';

class SubModalButton extends StatelessWidget {
  final IconData icon;
  final String text;
  bool isSelected;

  SubModalButton({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},

      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20,),
            isSelected ? Icon(icon, color: Colors.white,) : Placeholder(),
            const SizedBox(width: 20,),
            Text(text, style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}
