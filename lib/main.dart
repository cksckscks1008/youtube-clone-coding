import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/components/bottom_navigation_bar.dart';
import 'package:youtube_app_clonecoding/components/home_screen.dart';
import 'package:youtube_app_clonecoding/components/menu_image_button.dart';
import 'package:youtube_app_clonecoding/components/mypage_screen.dart';
import 'package:youtube_app_clonecoding/components/search_screen.dart';
import 'package:youtube_app_clonecoding/components/menu_button.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<ScaffoldState> ScaffoldKey = GlobalKey<ScaffoldState>();

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
    const Center(
      child: Text('Shorts 화면!', style: TextStyle(color: Colors.white)),
    ),
    const SearchScreen(),
    const MypageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: ScaffoldKey,
        backgroundColor: const Color(0xFF0F0F0F),
        drawer: Drawer(
          backgroundColor: const Color(0xFF212121),
          child: Column(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  dividerTheme: const DividerThemeData(
                    color: Colors.transparent,
                  ),
                ),
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.only(left: 16.0, top: 40.0),
                  // 상태바 고려해서 top 조절
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 180,
                    child: Image.asset('assets/youtube_logo.jpg'),
                  ),
                ),
              ),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    MenuButton(
                      click: shopping,
                      title: "쇼핑",
                      icon: Icons.shopping_bag_outlined,
                    ),
                    const SizedBox(height: 20),
                    MenuButton(
                      click: shopping,
                      title: "음악",
                      icon: Icons.music_note_outlined,
                    ),
                    const SizedBox(height: 20),
                    MenuButton(
                      click: shopping,
                      title: "영화",
                      icon: Icons.movie_creation_outlined,
                    ),
                    const SizedBox(height: 20),
                    MenuButton(
                      click: shopping,
                      title: "Hype",
                      icon: Icons.star_border_outlined,
                    ),
                    const SizedBox(height: 20),
                    MenuButton(
                      click: shopping,
                      title: "라이브",
                      icon: Icons.radar_outlined,
                    ),
                    const SizedBox(height: 20),
                    MenuButton(
                      click: shopping,
                      title: "게임",
                      icon: Icons.videogame_asset_sharp,
                    ),
                    const SizedBox(height: 20),
                    MenuButton(
                      click: shopping,
                      title: "스포츠",
                      icon: Icons.emoji_events_outlined,
                    ),
                    const SizedBox(height: 20),
                    MenuButton(
                      click: shopping,
                      title: "학습 프로그램",
                      icon: Icons.school_outlined,
                    ),
                    const SizedBox(height: 20),
                    MenuButton(
                      click: shopping,
                      title: "팟캐스트",
                      icon: Icons.mic_none_outlined,
                    ),
                    const SizedBox(height: 20),
                    MenuButton(
                      click: shopping,
                      title: "멤버십",
                      icon: Icons.stars_outlined,
                    ),
                    Divider(color: Colors.white10),
                    MenuImageButton(
                      click: shopping,
                      title: "YouTube Premium",
                      imagePath: 'assets/youtube_preminum.jpg',
                    ),
                    const SizedBox(height: 20),
                    MenuImageButton(
                      click: shopping,
                      title: "YouTube 스튜디오",
                      imagePath: 'assets/youtube_studio.jpg',
                    ),
                    const SizedBox(height: 20),
                    MenuImageButton(
                      click: shopping,
                      title: "YouTube Music",
                      imagePath: 'assets/youtube_music.jpg',
                    ),
                    const SizedBox(height: 20),
                    MenuImageButton(
                      click: shopping,
                      title: "YouTube Kids",
                      imagePath: 'assets/youtube_kids.jpg',
                    ),
                    const SizedBox(height: 20),
                    MenuImageButton(
                      click: shopping,
                      title: "YouTube Create",
                      imagePath: 'assets/youtube_create.jpg',
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Column(children: []),
              ),
            ],
          ),
        ),
        body: _mainPages[_currentBottomIndex],
        bottomNavigationBar: BottomNavigationbar(
          currentIndex: _currentBottomIndex,
          onTap: (index) {
            setState(() {
              _currentBottomIndex = index;
            });
          },
        ),
      ),
    );
  }

  void shopping() {
    setState(() {});
  }
}
