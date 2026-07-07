import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/components/bottom_navigation_bar.dart';
import 'package:youtube_app_clonecoding/components/home_screen.dart';
import 'package:youtube_app_clonecoding/components/menu_image_button.dart';
import 'package:youtube_app_clonecoding/components/mypage_screen.dart';
import 'package:youtube_app_clonecoding/components/search_screen.dart';
import 'package:youtube_app_clonecoding/components/menu_button.dart';
import 'package:youtube_app_clonecoding/components/video_model.dart';

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

  final List<VideoModel> allVideos = [
    VideoModel(
      youtubeId: 'H_zCqRqg1F0',
      title: '쉬운 플러터 5강 : Flexible과 숙제 안해오면 때림',
      channelName: '코딩애플',
      category: '공부',
    ),
    VideoModel(
      youtubeId: 'D1TnJn9B-Ks',
      title: '데굴데굴 과일을 합체하고 수박만들기 게임! Fruit Merge Game',
      channelName: '랄라 TV',
      category: '게임',
    ),
    VideoModel(
      youtubeId: '0ylGOPTcZkM',
      title: '𝐩𝐥𝐚𝐲𝐥𝐢𝐬𝐭 | 그 시절의 여름',
      channelName: '윤지지',
      category: '음악',
    ),
    VideoModel(
      youtubeId: 'I23R8TRz8J0',
      title: '한국 최고의 플레이어들에게 복수했습니다',
      channelName: '이닛',
      category: '마인크래프트',
    ),
    VideoModel(
      youtubeId: 'AQnXWX2jvNw',
      title: '미친 신작 애니들이 여름을 날려준다...! 26년 3분기 신작 애니 미리 알아보기!',
      channelName: '덕양소',
      category: '애니메이션',
    ),
    VideoModel(
      youtubeId: 'LvRZlXtCgSE',
      title:
      '【LCK】 T1 5꽉 끝 아쉬운 패배.. / 패자조 1라운드 상대 FUR / BLG 승리, 골든로드 도전 - 롤 이스포츠',
      channelName: 'THIRD[롤 백과사전]',
      category: '게임',
    ),
    VideoModel(
      youtubeId: 'SDgHYLAFcBU',
      title: '[3분 HL] 32강 아르헨티나 VS 카보베르데 | KBS 260704 방송',
      channelName: '올스',
      category: '축구',
    ),
    VideoModel(
      youtubeId: '8Acx4qioj64',
      title: '[ENG] [SMTM10/8회] ♬ 리무진 (Feat. MINO) - 비오 @본선 | Mnet 211119 방송',
      channelName: 'Mnet TV',
      category: '랩',
    ),
    VideoModel(
      youtubeId: 'XNM-m9Bry-E',
      title: '당신의 게임 불감증을 치료해 줄 최고의 RPG TOP 8',
      channelName: '마나물약',
      category: '액션 어드벤처 게임',
    ),
    VideoModel(
      youtubeId: 'spiHw2VYbK4',
      title: '토끼의 뽀뽀를 받고 당황한 강아지',
      channelName: '[THE SOY]루퐁이네',
      category: '반려동물',
    ),
    VideoModel(
      youtubeId: 'MToDABYSEwk',
      title: '나는 태어난 지 10일 된 토끼 새끼다 [애니멀봐 나새끼 10호]ㅣI’m A 10 Days Old Rabbit/ Bunny!',
      channelName: 'SBS TV동물농장x애니멀봐 공식 유튜브 채널입니다!',
      category: '반려동물',
    ),
    VideoModel(
      youtubeId: 'WVgJzNtJh-w',
      title: "수학 강사 정승제 '백지 상태에서 미분 정복' 3시간 특강",
      channelName: '침착맨',
      category: '수학',
    ),
    VideoModel(
      youtubeId: '4eqeQb6iUIE',
      title: '[VIVALDI] 4 Seasons 사계 - Winter 겨울 ㅣStefan Plewniak 스테판 플레브니악 - 베르사유 궁전 왕립 오페라 오케스트라',
      channelName: 'MAGE PD_메이지 프로덕션',
      category: '음악',
    ),
    VideoModel(
      youtubeId: 'oippSXvxUlw',
      title: '당신이 수학을 모르는 이유. (feat. 불완전성의 정리)',
      channelName: 'Veritasium 한국어 - 베리타시움',
      category: '수학',
    ),
    VideoModel(
      youtubeId: 'KoWgusQpS9Q',
      title: '[ENG] SMTM9 [10회] CREDIT (Feat. 염따, 기리보이, Zion.T) - 릴보이 @파이널 2R EP.10 | Mnet 201218 방송',
      channelName: 'Mnet TV',
      category: '랩',
    ),
    VideoModel(
      youtubeId: '07VAY7xut84',
      title: "[현장영상] ‘축구의 신’도 헛웃음 지었다…세계 최강 얼어붙게 만든 카보베르데 / KBS 2026 북중미 월드컵 2026.07.04.",
      channelName: 'KBS News',
      category: '축구',
    ),
    VideoModel(
      youtubeId: 'dz99H8ptIsg',
      title: '🔥25분 삭제!🔥"SSS급" 현대 무기 "곡사포"를 소환해 일대를 초토화 시켜버리는 전직 킬러의 이세계 생활기',
      channelName: '행덕이의 애니리뷰',
      category: '애니메이션',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    final List<Widget> _mainPages = [
      const HomeScreen(),
      const Center(
        child: Text('Shorts 화면!', style: TextStyle(color: Colors.white)),
      ),
      const SearchScreen(),
      MypageScreen(
        allVideos: allVideos,
      ),
    ];
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
