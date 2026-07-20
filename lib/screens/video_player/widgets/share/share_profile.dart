import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/constants/colors.dart';

class ShareProfile extends StatelessWidget {
  final String image;
  final String text;

  const ShareProfile({
    super.key,
    required this.image,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    final bool isNewLine = text.contains('\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 23.5,
            backgroundImage: NetworkImage(image)),
        SizedBox(height: 8,),

        Text(text, textAlign: TextAlign.center,style: TextStyle(color: AppColors.grey, fontSize: 11.5),)
      ],
    );
  }
}
