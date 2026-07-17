import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_app_clonecoding/Theme/colors.dart';
import 'package:youtube_app_clonecoding/Theme/textstyle.dart';
import 'package:youtube_app_clonecoding/widgets/app_bars/appbar.dart';
import 'package:youtube_app_clonecoding/widgets/app_bars/sub_appbar.dart';
import 'package:youtube_app_clonecoding/screens/subscription/widgets/sub_profile.dart';
import 'package:youtube_app_clonecoding/widgets/video_card/video_card.dart';
import '../../models/video_model.dart';
import '../video_player/video_player_screen.dart';

class SubscriptionScreen extends StatefulWidget {
  final List<VideoModel> allVideo;

  const SubscriptionScreen({
    super.key,
    required this.allVideo,
  });

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreen();
}

class _SubscriptionScreen extends State<SubscriptionScreen> {
  String selectedCategory = '전체';

  Widget _buildVideoCard(VideoModel video) {
    return VideoCard(
        video: video,
        allVideos: widget.allVideo,
        width: 410,
        height: 220);
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
                  height: 259,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.allVideo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 12, right: 4),
                        child: VideoCard(
                            video: widget.allVideo[index],
                            allVideos: widget.allVideo,
                            width: 310,
                            height: 180,
                        )
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          _getVideoSliverList(selectedCategory),
        ],
      ),
    );
  }
}