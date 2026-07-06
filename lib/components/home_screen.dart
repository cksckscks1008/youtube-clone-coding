import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/components/appbar/appbar.dart';
import 'package:youtube_app_clonecoding/main.dart';
import 'package:youtube_app_clonecoding/components/video_model.dart';
import 'video_player_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCategoryIndex = 0;

  final List<VideoModel> _allVideos = [
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

  void openMenu() {
    ScaffoldKey.currentState?.openDrawer();
  }

  Widget _buildVideoCard(VideoModel video) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(video: video, allVideos: _allVideos),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: const Color(0xFF1F1F1F),
              child: Image.network(
                'https://img.youtube.com/vi/${video.youtubeId}/maxresdefault.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${video.channelName} • ${video.category}',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getVideoListView(String category) {
    final filteredVideos = category == '전체'
        ? _allVideos
        : _allVideos.where((v) => v.category == category).toList();

    if (filteredVideos.isEmpty) {
      return const Center(
        child: Text('해당 카테고리의 영상이 없습니다.', style: TextStyle(color: Colors.grey)),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: filteredVideos.length,
      itemBuilder: (context, index) {
        return _buildVideoCard(filteredVideos[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _bodyPages = [
      _getVideoListView('전체'),
      _getVideoListView('게임'),
      _getVideoListView('음악'),
      _getVideoListView('라이브'),
      _getVideoListView('믹스'),
      _getVideoListView('마인크래프트'),
      _getVideoListView('액션 어드벤처 게임'),
      _getVideoListView('애니메이션'),
      _getVideoListView('랩'),
      _getVideoListView('반려동물'),
      _getVideoListView('수학'),
      _getVideoListView('축구'),
      _getVideoListView('최근에 업로드된 동영상'),
      _getVideoListView('게시물'),
      _getVideoListView('새로운 맞춤 동영상'),
    ];

    return Scaffold(
      backgroundColor: Color(0xFF0F0F0F),

      body: CustomScrollView(
        slivers: [
          Youtubepppbar(
            onCategorieSelected: (index) {
              setState(() {
                _currentCategoryIndex = index;
              });
            },
            openMenu: openMenu,
          ),

          SliverToBoxAdapter(
            child: Container(
              height: 800,
              child: _currentCategoryIndex < _bodyPages.length
                  ? _bodyPages[_currentCategoryIndex]
                  : Center(child: Text('카테고리 $_currentCategoryIndex 번 화면')),
            ),
          ),
        ],
      ),
    );
  }
}
