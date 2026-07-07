import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_app_clonecoding/components/video_model.dart';
import 'comment_model.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoModel video;
  final List<VideoModel> allVideos;

  const VideoPlayerScreen({
    super.key,
    required this.video,
    required this.allVideos,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _commentController;
  final FocusNode _searchFocusNode = FocusNode();
  bool isLiked = false;
  bool isDisliked = false;
  bool isCommentOpen = false;
  bool isToggleComment = true;
  List<CommentModel> dummyComments = [
    CommentModel(
      commentId: "플러터마스터",
      commentContext: "와, 유튜브 클론코딩 퀄리티 장난 아니네요! 영상 잘 보고 있습니다.",
      afterMinute: 5,
    ),
    CommentModel(
      commentId: "개발하는고양이",
      commentContext: "IconButton 패딩 줄이는 법 찾고 있었는데 덕분에 해결했어요 😂 감사합니다!",
      afterMinute: 12,
    ),
    CommentModel(
      commentId: "코딩초보_A",
      commentContext: "혹시 소스 코드 깃허브 주소도 공유해 주실 수 있나요?",
      afterMinute: 20,
    ),
    CommentModel(
      commentId: "유튜브클론",
      commentContext: "UI가 진짜 공식 유튜브 앱이랑 똑같네요. 다음 강의도 기대됩니다.",
      afterMinute: 37,
    ),
    CommentModel(
      commentId: "DartLover",
      commentContext: "중간에 나오는 InkWell이랑 Material 설명 아주 유익했습니다!!",
      afterMinute: 45,
    ),
    CommentModel(
      commentId: "데브쿠마",
      commentContext: "디자인 색감이 되게 깔끔하네요. 어두운 테마(0xFF0F0F0F)가 딱 유튜브 느낌 납니다.",
      afterMinute: 58,
    ),
    CommentModel(
      commentId: "앱개발자지망생",
      commentContext: "매일 퇴근하고 이 영상 보면서 따라 하고 있어요. 완강까지 달립니다!",
      afterMinute: 72,
    ),
    CommentModel(
      commentId: "WidgetKing",
      commentContext: "알림 아이콘 배지 다는 법도 응용해서 구현해 봐야겠어요.",
      afterMinute: 90,
    ),
    CommentModel(
      commentId: "스택오버플로우",
      commentContext: "깔끔하고 가독성 좋은 코드네요. 구조가 보기 편합니다.",
      afterMinute: 105,
    ),
    CommentModel(
      commentId: "Flutter_Newbie",
      commentContext: "구독과 좋아요 누르고 갑니다! 앞으로도 좋은 영상 많이 올려주세요 👍",
      afterMinute: 120,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.video.youtubeId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _commentController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int commentNumber = dummyComments.length;
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F0F),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          widget.video.category,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.video.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '@${widget.video.channelName}',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const CircleAvatar(radius: 18),
                      const SizedBox(width: 10),
                      Ink(
                        width: 60,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: onDislike,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.white,
                                size: 24,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: onLike,
                        icon: Icon(
                          isLiked
                              ? Icons.thumb_up_alt
                              : Icons.thumb_up_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: onDislike,
                        icon: Icon(
                          isDisliked
                              ? Icons.thumb_down_alt
                              : Icons.thumb_down_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: onDislike,
                        icon: const Icon(
                          Icons.reply_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: onDislike,
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: onDislike,
                        icon: const Icon(Icons.more_horiz, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Ink(
                    height: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white12,
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: const Color(0xFF1F1F1F),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setModalState) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '댓글',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Ink(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: isToggleComment
                                                  ? Colors.white
                                                  : Colors.white12,
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              onTap: () {
                                                setModalState(() {
                                                  isToggleComment = true;
                                                });
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6,
                                                    ),
                                                child: Text(
                                                  '인기순',
                                                  style: TextStyle(
                                                    color: isToggleComment
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Ink(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: isToggleComment
                                                  ? Colors.white12
                                                  : Colors.white,
                                            ),
                                            child: InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              onTap: () {
                                                setModalState(() {
                                                  isToggleComment = false;
                                                });
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 6,
                                                    ),
                                                child: Text(
                                                  '최신순',
                                                  style: TextStyle(
                                                    color: isToggleComment
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(color: Colors.white10),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: dummyComments.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              leading: const CircleAvatar(
                                                radius: 13,
                                              ),
                                              title:
                                                  dummyComments[index]
                                                          .afterMinute >
                                                      60
                                                  ? Text(
                                                      '@${dummyComments[index].commentId} • ${dummyComments[index].afterMinute ~/ 60}시간 전',
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  : Text(
                                                      '@${dummyComments[index].commentId} • ${dummyComments[index].afterMinute}분 전',
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    dummyComments[index]
                                                        .commentContext,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          setModalState(() {
                                                            if (dummyComments[index]
                                                                .isDisliked) {
                                                              dummyComments[index]
                                                                      .isDisliked =
                                                                  false;
                                                              dummyComments[index]
                                                                      .isLiked =
                                                                  true;
                                                            } else if (dummyComments[index]
                                                                .isLiked) {
                                                              dummyComments[index]
                                                                      .isLiked =
                                                                  false;
                                                            } else {
                                                              dummyComments[index]
                                                                      .isLiked =
                                                                  true;
                                                            }
                                                          });
                                                        },
                                                        icon:
                                                            dummyComments[index]
                                                                .isLiked
                                                            ? Icon(
                                                                Icons
                                                                    .thumb_up_alt,
                                                                color: Colors
                                                                    .white,
                                                                size: 17,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .thumb_up_alt_outlined,
                                                                color: Colors
                                                                    .white,
                                                                size: 17,
                                                              ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          setModalState(() {
                                                            if (dummyComments[index]
                                                                .isLiked) {
                                                              dummyComments[index]
                                                                      .isLiked =
                                                                  false;
                                                              dummyComments[index]
                                                                      .isDisliked =
                                                                  true;
                                                            } else if (dummyComments[index]
                                                                .isDisliked) {
                                                              dummyComments[index]
                                                                      .isDisliked =
                                                                  false;
                                                            } else {
                                                              dummyComments[index]
                                                                      .isDisliked =
                                                                  true;
                                                            }
                                                          });
                                                        },
                                                        icon:
                                                            dummyComments[index]
                                                                .isDisliked
                                                            ? Icon(
                                                                Icons
                                                                    .thumb_down_alt,
                                                                color: Colors
                                                                    .white,
                                                                size: 17,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .thumb_down_alt_outlined,
                                                                color: Colors
                                                                    .white,
                                                                size: 17,
                                                              ),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          setModalState(() {
                                                            _searchFocusNode
                                                                .requestFocus();
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          Icons.comment,
                                                          color: Colors.white,
                                                          size: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const Divider(color: Colors.white10),
                                      Container(
                                        width: MediaQuery.of(
                                          context,
                                        ).size.width,
                                        height: 35,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: SearchBar(
                                                focusNode: _searchFocusNode,
                                                controller: _commentController,
                                                onSubmitted: (value) {
                                                  if (value.trim().isEmpty)
                                                    return;
                                                  setModalState(() {
                                                    dummyComments.insert(
                                                      0,
                                                      CommentModel(
                                                        commentId: "ifari1588",
                                                        commentContext: value,
                                                        afterMinute: 0,
                                                      ),
                                                    );
                                                    _commentController.clear();
                                                  });
                                                },
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                      Colors.white10,
                                                    ),
                                                hintText: '댓글 올리기...',
                                                hintStyle:
                                                    WidgetStatePropertyAll(
                                                      TextStyle(
                                                        color: Colors.white54,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                textStyle:
                                                    WidgetStatePropertyAll(
                                                      TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Padding(
                                              padding: EdgeInsets.zero,
                                              child: IconButton(
                                                style: IconButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.white10,
                                                ),
                                                onPressed: onDislike,
                                                icon: Icon(
                                                  Icons.attach_money,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  '댓글',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '$commentNumber',
                                  style: const TextStyle(color: Colors.white38),
                                ),
                                const Spacer(),
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: Colors.white38,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: const CircleAvatar(radius: 13),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        dummyComments[0].commentContext,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: widget.allVideos.length,
                    itemBuilder: (context, index) {
                      final recommendedVideo = widget.allVideos[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPlayerScreen(
                                video: recommendedVideo,
                                allVideos: widget.allVideos,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              color: Color(0xFF1F1F1F),
                              child: Image.network(
                                'https://img.youtube.com/vi/${recommendedVideo.youtubeId}/maxresdefault.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(radius: 18),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          recommendedVideo.title,
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
                                          '${recommendedVideo.channelName} • ${recommendedVideo.category}',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onLike() {
    setState(() {
      if (isDisliked) {
        isDisliked = !isDisliked;
        isLiked = true;
      } else if (isLiked) {
        isLiked = !isLiked;
      } else {
        isLiked = true;
      }
    });
  }

  void onDislike() {
    setState(() {
      if (isLiked) {
        isLiked = !isLiked;
        isDisliked = true;
      } else if (isDisliked) {
        isDisliked = !isDisliked;
      } else {
        isDisliked = true;
      }
    });
  }
}
