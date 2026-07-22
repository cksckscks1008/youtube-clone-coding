import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/constants/colors.dart';

class NotificationListTile extends StatelessWidget {
  final String channelName;
  final String videoName;

  const NotificationListTile({
    super.key,
    required this.channelName,
    required this.videoName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: AppColors.background),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 20),
          SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  channelName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  videoName,
                  style: TextStyle(color: Colors.white, fontSize: 13.5),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '3일 전',
                  style: TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),

          SizedBox(
            width: 120,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  'https://img.youtube.com/vi/t6idvtC9x2o/maxresdefault.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.more_vert, color: Colors.white, size: 20),
        ],
      ),
    );
  }
}
