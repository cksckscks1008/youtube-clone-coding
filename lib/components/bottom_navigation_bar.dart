import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/Theme/colors.dart';

class BottomNavigationbar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
        child: BottomNavigationBar(
          currentIndex: widget.currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            widget.onTap(index);
          },
          backgroundColor: AppColors.bottomNavBackground,
          selectedItemColor: AppColors.textPrimary,
          unselectedItemColor: AppColors.textSecondary,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.offline_bolt_outlined),
              activeIcon: Icon(Icons.offline_bolt),
              label: 'Shorts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              activeIcon: Icon(Icons.video_library),
              label: '구독'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: '나',
            ),
          ],
        ),
      );
  }
}
