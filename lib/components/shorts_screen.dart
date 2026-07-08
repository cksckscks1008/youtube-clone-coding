import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/components/shorts_model.dart';
import 'Shorts_Tile.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  final List<ShortsModel> shortsVideo = [
    ShortsModel(
        youtubeId: 'u1pUlpX-7_0',
        channelName: 'youngbossidea',
        comments: 130,
        likes: 150,
        title: '요즘 미국에서 사탕 팔아서 돈 버는 방법.',
        song: 'BoywithUke - Toxic'
    ),
    ShortsModel(
        youtubeId: 'u1pUlpX-7_0',
        channelName: 'youngbossidea',
        comments: 130,
        likes: 150,
        title: '요즘 미국에서 사탕 팔아서 돈 버는 방법.',
        song: 'BoywithUke - Toxic'
    ),
    ShortsModel(
        youtubeId: 'u1pUlpX-7_0',
        channelName: 'youngbossidea',
        comments: 130,
        likes: 150,
        title: '요즘 미국에서 사탕 팔아서 돈 버는 방법.',
        song: 'BoywithUke - Toxic'
    ),
    ShortsModel(
        youtubeId: 'u1pUlpX-7_0',
        channelName: 'youngbossidea',
        comments: 130,
        likes: 150,
        title: '요즘 미국에서 사탕 팔아서 돈 버는 방법.',
        song: 'BoywithUke - Toxic'
    ),
    ShortsModel(
        youtubeId: 'u1pUlpX-7_0',
        channelName: 'youngbossidea',
        comments: 130,
        likes: 150,
        title: '요즘 미국에서 사탕 팔아서 돈 버는 방법.',
        song: 'BoywithUke - Toxic'
    ),
    ShortsModel(
        youtubeId: 'u1pUlpX-7_0',
        channelName: 'youngbossidea',
        comments: 130,
        likes: 150,
        title: '요즘 미국에서 사탕 팔아서 돈 버는 방법.',
        song: 'BoywithUke - Toxic'
    ),
    ShortsModel(
        youtubeId: 'u1pUlpX-7_0',
        channelName: 'youngbossidea',
        comments: 130,
        likes: 150,
        title: '요즘 미국에서 사탕 팔아서 돈 버는 방법.',
        song: 'BoywithUke - Toxic'
    ),
    ShortsModel(
        youtubeId: 'u1pUlpX-7_0',
        channelName: 'youngbossidea',
        comments: 130,
        likes: 150,
        title: '요즘 미국에서 사탕 팔아서 돈 버는 방법.',
        song: 'BoywithUke - Toxic'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: shortsVideo.length,
        itemBuilder: (context, index) {
          return ShortsTile(shortsData: shortsVideo[index]);
        },
      ),
    );
  }
}
