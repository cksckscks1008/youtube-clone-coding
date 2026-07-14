import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/Theme/colors.dart';
import 'search_page.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {

  final String text;

  const DefaultAppbar({super.key, required this.text});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    List<String> history = [];
    return AppBar(
      backgroundColor: AppColors.background,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back, color: Colors.white),
      ),
      title: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchPage(history: history),
              ),
            );
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.search, color: Colors.white, size: 30),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: Colors.white,)),
      ],
    );
  }
}
