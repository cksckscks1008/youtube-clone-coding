import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/Theme/textstyle.dart';

class MypageButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const MypageButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            const SizedBox(width: 10),
            Icon(icon, color: Colors.white, size: 33),
            const SizedBox(width: 20),
            Text(
              text,
              style: AppTextStyle.titleMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
