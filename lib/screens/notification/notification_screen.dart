import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/constants/colors.dart';
import 'package:youtube_app_clonecoding/screens/notification/notification_list_tile.dart';
import 'package:youtube_app_clonecoding/widgets/app_bar/default_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: DefaultAppbar(text: '알림'),
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 10,),
                    Text('이번 주', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 14.4),),
                  ],
                ),
                const SizedBox(height: 15,),
                NotificationListTile(channelName: '스환', videoName: '최고의 발푸르기스의밤 캐릭터 티어리스트 표',),
                const SizedBox(height: 35,),
                NotificationListTile(channelName: '스환', videoName: '최고의 발푸르기스의밤 캐릭터 티어리스트 표',),
                const SizedBox(height: 35,),
                NotificationListTile(channelName: '스환', videoName: '최고의 발푸르기스의밤 캐릭터 티어리스트 표',),
                const SizedBox(height: 35,),
                NotificationListTile(channelName: '스환', videoName: '최고의 발푸르기스의밤 캐릭터 티어리스트 표',),
                const SizedBox(height: 35,),
                NotificationListTile(channelName: '스환', videoName: '최고의 발푸르기스의밤 캐릭터 티어리스트 표',),
                const SizedBox(height: 35,),
                NotificationListTile(channelName: '스환', videoName: '최고의 발푸르기스의밤 캐릭터 티어리스트 표',),
                const SizedBox(height: 35,),
                NotificationListTile(channelName: '스환', videoName: '최고의 발푸르기스의밤 캐릭터 티어리스트 표',),
                const SizedBox(height: 35,),
                NotificationListTile(channelName: '스환', videoName: '최고의 발푸르기스의밤 캐릭터 티어리스트 표',),
                const SizedBox(height: 35,),
                NotificationListTile(channelName: '스환', videoName: '최고의 발푸르기스의밤 캐릭터 티어리스트 표',),
                const SizedBox(height: 35,),
              ],
            ),
          ),
        )
    );
  }
}
