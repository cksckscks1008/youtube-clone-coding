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
            builder: (context) => VideoPlayerScreen(video: video),
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
                'https://img.youtube.com/vi/${video.youtubeId}/0.jpg',
                fit: BoxFit.cover,
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
