import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/components/bottom_navigation_bar.dart';
import 'package:youtube_app_clonecoding/components/home_screen.dart';
import 'package:youtube_app_clonecoding/components/mypage_screen.dart';
import 'package:youtube_app_clonecoding/components/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
// 김성민 다녀감 :>
class _MyAppState extends State<MyApp> {
  int _currentBottomIndex = 0;

  final List<Widget> _mainPages = [
    const HomeScreen(),
    const SearchScreen(),
    const MypageScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xFF0F0F0F),
          body: _mainPages[_currentBottomIndex],
          bottomNavigationBar: BottomNavigationbar(
            currentIndex: _currentBottomIndex,
            onTap: (index) {
              setState(() {
                _currentBottomIndex = index;
              });
            }
          ),
        )
    );
  }
}
