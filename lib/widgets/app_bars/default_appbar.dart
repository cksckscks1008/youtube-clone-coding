import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_app_clonecoding/Theme/colors.dart';
import '../../screens/search/search_page.dart';

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
        onPressed: () => context.pop(context),
        icon: Icon(Icons.arrow_back, color: Colors.white),
      ),
      title: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      actions: [
        IconButton(
          onPressed: () {
            context.go('/search', extra: {
              'history': history
    });
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
