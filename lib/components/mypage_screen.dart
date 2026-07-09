import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/Theme/colors.dart';
import 'package:youtube_app_clonecoding/Theme/textstyle.dart';
import 'video_model.dart';
import 'mypage_button.dart';

class MypageScreen extends StatefulWidget {
  final List<VideoModel> allVideos;

  const MypageScreen({super.key, required this.allVideos});

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.background,
            title: Padding(
              padding: const EdgeInsets.all(0),
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(30),
                ),
                width: 100,
                height: 49,
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '계정',
                        style: AppTextStyle.titleMedium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 27,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: set,
                icon: Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: 33,
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: set,
                icon: Icon(Icons.search_outlined, color: Colors.white, size: 33),
              ),
              const SizedBox(width: 5),
              IconButton(
                onPressed: set,
                icon: Icon(Icons.settings_outlined, color: Colors.white, size: 33),
              ),
            ],
          ),
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),

                // CircleAvatar 및 사용자명 Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 17),
                    CircleAvatar(radius: 40),
                    const SizedBox(width: 17),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'ifari1588',
                              style: AppTextStyle.titleLarge.copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '@ifari1588  •  ',
                              style: AppTextStyle.titleMedium.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '채널 보기 >',
                              style: AppTextStyle.titleMedium.copyWith(
                                color: Colors.white54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                //기록 위젯
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          '기록',
                          style: AppTextStyle.titleLarge.copyWith(
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.allVideos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              top: 3,
                              left: 10,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 90,
                                  width: 150,
                                  color: const Color(0xFF1F1F1F),
                                  child: Image.network(
                                    'https://img.youtube.com/vi/${widget.allVideos[index].youtubeId}/maxresdefault.jpg',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 150,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.allVideos[index].title}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.titleMedium.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '${widget.allVideos[index].channelName}',
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
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          '재생목록',
                          style: AppTextStyle.titleLarge.copyWith(
                            fontSize: 19,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                        const SizedBox(width: 220,),
                        Icon(Icons.add, color: Colors.white, size: 36,)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.allVideos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              top: 3,
                              left: 10,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 90,
                                  width: 150,
                                  color: const Color(0xFF1F1F1F),
                                  child: Image.network(
                                    'https://img.youtube.com/vi/${widget.allVideos[index].youtubeId}/maxresdefault.jpg',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 150,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${widget.allVideos[index].title}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.titleMedium.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '${widget.allVideos[index].channelName}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.caption.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
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
                    MypageButton(icon: Icons.smart_display_outlined, text: '내 동영상'),
                    const SizedBox(height: 30,),
                    MypageButton(icon: Icons.movie_creation_outlined, text: '영화'),
                    const SizedBox(height: 30,),
                    MypageButton(icon: Icons.star_purple500_sharp, text: '배지'),
                    const SizedBox(height: 12,),
                    const Divider(color: Colors.white38,),
                    const SizedBox(height: 12,),
                    MypageButton(icon: Icons.workspace_premium, text: 'YouTube Premium 가입'),
                    const SizedBox(height: 20,)
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

  void set() {
    setState(() {});
  }
}
