import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/Theme/colors.dart';
import 'package:youtube_app_clonecoding/Theme/textstyle.dart';

class CategorieButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String text;

  const CategorieButton({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isSelected ? AppColors.surfaceSelected : AppColors.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              text,
              style: AppTextStyle.body.copyWith(
                color: isSelected ? Colors.black : AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}