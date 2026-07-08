import 'package:flutter/material.dart';
import 'shorts_button.dart';
import 'shorts_model.dart';
import 'shorts_profile.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShortsTile extends StatefulWidget {
  final ShortsModel shortsData;

  const ShortsTile({super.key, required this.shortsData});

  @override
  State<ShortsTile> createState() => _ShortsTileState();
}

class _ShortsTileState extends State<ShortsTile> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.shortsData.youtubeId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false, loop: true, ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: YoutubePlayer(controller: _controller),
          ),

          Positioned(
            right: 0,
            top: 10,
            child: Row(
              children: [
                IconButton(
                  onPressed: onClick,
                  icon: const Icon(Icons.search, color: Colors.white, size: 32),
                ),
                IconButton(
                  onPressed: onClick,
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: 10,
            bottom: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShortsButton(
                  icon: Icons.thumb_up_alt_outlined,
                  text: '${widget.shortsData.likes}',
                  onCilck: onClick,
                ),
                const SizedBox(height: 20),
                ShortsButton(
                  icon: Icons.comment,
                  text: '${widget.shortsData.comments}',
                  onCilck: onClick,
                ),
                const SizedBox(height: 20),
                ShortsButton(icon: Icons.share, text: '공유', onCilck: onClick),
                const SizedBox(height: 20),
                ShortsButton(
                  icon: Icons.recycling,
                  text: '리믹스',
                  onCilck: onClick,
                ),
                const SizedBox(height: 20),
                const ShortsProfile(),
                const SizedBox(height: 10),
              ],
            ),
          ),

          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(),
                    const SizedBox(width: 7),
                    Text(
                      '@${widget.shortsData.channelName}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                            color: Colors.black38,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: const Text(
                        '가입',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  widget.shortsData.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    shadows: [
                      Shadow(
                        color: Colors.black38,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),
                const Text(
                  '수수료 지급',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black38,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                Container(
                  width: 250,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.music_note_outlined,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Text(
                            widget.shortsData.song,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.5,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onClick() {
    setState(() {});
  }
}
