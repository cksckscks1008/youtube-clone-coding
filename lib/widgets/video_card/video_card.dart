import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/models/video_model.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_app_clonecoding/Theme/textstyle.dart';

class VideoCard extends StatelessWidget {
  final VideoModel video;
  final List<VideoModel> allVideos;
  final double width;
  final double height;

  const VideoCard({
    super.key,
    required this.video,
    required this.allVideos,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/video', extra: {
          'video': video,
          'allVideos': allVideos
        });
      },
      child: SizedBox(
        width: width,
        child: Container(
          margin: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height,
                width: width,
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    'https://img.youtube.com/vi/${video.youtubeId}/maxresdefault.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
          ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 14),
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
      ),
    );
  }
}
