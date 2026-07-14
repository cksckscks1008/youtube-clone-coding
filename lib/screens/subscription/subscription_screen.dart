import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/Theme/colors.dart';
import 'package:youtube_app_clonecoding/Theme/textstyle.dart';
import 'package:youtube_app_clonecoding/widgets/app_bars/appbar.dart';
import 'package:youtube_app_clonecoding/widgets/app_bars/sub_appbar.dart';
import 'package:youtube_app_clonecoding/screens/subscription/widgets/sub_profile.dart';
import '../../models/video_model.dart';
import '../video_player/video_player_screen.dart';

class SearchScreen extends StatefulWidget {
  final List<VideoModel> allVideo;

  const SearchScreen({
    super.key,
    required this.allVideo,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = '전체';

  Widget _buildVideoCard(VideoModel video) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(video: video, allVideos: widget.allVideo),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 230,
              width: double.infinity,
              color: const Color(0xFF1F1F1F),
              child: Image.network(
                'https://img.youtube.com/vi/${video.youtubeId}/maxresdefault.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network('https://img.youtube.com/vi/${video.youtubeId}/0.jpg', fit: BoxFit.cover);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      video.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.body
                  ),
                  const SizedBox(height: 6),
                  Text(
                      '${video.channelName} • ${video.category}',
                      style: AppTextStyle.caption
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getVideoSliverList(String category) {
    final filteredVideos = category == '전체'
        ? widget.allVideo
        : widget.allVideo.where((v) => v.category == category).toList();

    if (filteredVideos.isEmpty) {
      return const SliverFillRemaining(
        child: Center(
          child: Text(
            '해당 카테고리의 영상이 없습니다.',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return _buildVideoCard(filteredVideos[index]);
        },
        childCount: filteredVideos.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SubAppbar(),

          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Text(
                        '관련성',
                        style: AppTextStyle.titleLarge.copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.allVideo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 12, right: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 180,
                              width: 320,
                              color: const Color(0xFF1F1F1F),
                              child: Image.network(
                                'https://img.youtube.com/vi/${widget.allVideo[index].youtubeId}/maxresdefault.jpg',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.network('https://img.youtube.com/vi/${widget.allVideo[index].youtubeId}/0.jpg', fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 160,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.allVideo[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.titleMedium.copyWith(fontSize: 13),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.allVideo[index].channelName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.caption.copyWith(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(color: Colors.white12, height: 32, thickness: 1), // 기록과 다음 리스트 구분선
              ],
            ),
          ),
          _getVideoSliverList(selectedCategory),
        ],
      ),
    );
  }
}