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
                    Container(
                      decoration: BoxDecoration(color: Color(0xFF212121)),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                          children: [
                            const TextSpan(
                              text:
                                  "© 2022 Google LLC, Sundar Pichai, 1600 Amphitheatre\nParkway, Mountain View CA 94043, USA, 0807-882-594 (무료),\nyt-support-solutions-kr@google.com, 호스팅: Google LLC,\n",
                            ),
                            const TextSpan(
                              text: "사업자정보, 불법촬영물 신고",
                              style: TextStyle(color: Colors.blue),
                            ),
                            const TextSpan(
                              text:
                                  "\n크리에이터들이 유튜브 상에 게시, 태그 또는 추천한 상품들은 판매자들의 약관에 따라 판매됩니다. 유튜브는 이러한 제품들을 판매하지 않으며, 그에 대한 책임을 지지 않습니다.",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "개인정보처리방침 • 서비스 약관",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
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
