import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/constants/textstyle.dart';

class MenuImageButton extends StatelessWidget {
  final Function click;
  final String title;
  final String imagePath;

  const MenuImageButton({
    super.key,
    required this.click,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () => click(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(width: 20),
              Image.asset(
                imagePath,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),

              const SizedBox(width: 24),

              Expanded(
                child: Text(
                  title,
                  style: AppTextStyle.titleLarge
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
