import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/constants/colors.dart';

class NotificationListTile extends StatelessWidget {
  final String channelName;
  final String videoName;

  const NotificationListTile({super.key, required this.channelName, required this.videoName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.background),
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 20,
              ),
            ],
          ),
          Container(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(channelName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900), maxLines: 1, overflow: TextOverflow.ellipsis,),
                Text(videoName, style: TextStyle(color: Colors.white, fontSize: 13.5),),
                Text('3일 전', style: TextStyle(color: Colors.white38),)
              ],
            ),
          ),
          Container(
            height: 80,
            width: 157,
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                'https://img.youtube.com/vi/t6idvtC9x2o/maxresdefault.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.more_vert, color: Colors.white,)
            ],
          )
        ],
      ),
    );
  }
}
