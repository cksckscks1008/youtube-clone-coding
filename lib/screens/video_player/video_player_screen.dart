import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_app_clonecoding/constants/textstyle.dart';
import 'package:youtube_app_clonecoding/screens/video_player/widgets/bookmark/bookmark_button.dart';
import 'package:youtube_app_clonecoding/screens/video_player/widgets/more/more_button.dart';
import 'package:youtube_app_clonecoding/screens/video_player/widgets/share/share_button.dart';
import 'package:youtube_app_clonecoding/screens/video_player/widgets/share/share_profile.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_app_clonecoding/models/video_model.dart';
import '../../models/comment_model.dart';
import 'package:youtube_app_clonecoding/constants/colors.dart';

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
  void didUpdateWidget(covariant VideoPlayerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.video.youtubeId != widget.video.youtubeId) {
      _controller.load(widget.video.youtubeId);

      setState(() {
        isLiked = false;
        isDisliked = false;
        isCommentOpen = false;
      });
    }
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
        leading: IconButton(
          onPressed: () {
            context.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          widget.video.category,
          style: AppTextStyle.body.copyWith(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              width: MediaQuery.of(context).size.width,
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
                    style: AppTextStyle.body.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '@${widget.video.channelName}',
                    style: AppTextStyle.caption.copyWith(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
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
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: const Color(0xFF1F1F1F),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (context) {
                            return SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.6 + 6,
                              child: SafeArea(
                                child: StatefulBuilder(
                                  builder: (context, setModalState) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 30.0,
                                        horizontal: 15,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        spacing: 3,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '공유',
                                                style: TextStyle(
                                                  color: AppColors.textPrimary,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              spacing: 35,
                                              children: [
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuU7rn5zfAx41Iz31TmTr9vZhYQ_59kwwa4YjNbQ5sZg&s=10',
                                                  text: 'Discord',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDAg2IYnAdytH10MKmi6wsnn-UPwxjORKPyCsJ1ONzpQ&s=10',
                                                  text: '카카오톡',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYEZ_0LALrIL8db_KijQzOYy1P1R8giCCoPzHwbIZPvw&s=10',
                                                  text: 'Gmail',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVFUU3ODmvyN-YrzcVkKOXzOADxGBmH6wkytW492PuNQ&s=10',
                                                  text: '메세지',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSybrzjkQnrhiJVfghI01pbHUTamxNd1lWVoYTvC8ZLsA&s=10',
                                                  text: '블루투스',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfhE_LQ0CFkyLcTHaM-uVKYNGNCS7p1jy93T8AOPcyng&s=10',
                                                  text: '뉴스 피드',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVXcyFjShNsQEK5nZpYmsakm-02-fGQ8Q1J0zvPjSh0Q&s=10',
                                                  text: 'Facebook\nMessenger',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://thumbs.dreamstime.com/b/twitter-new-logo-app-icon-logo-social-media-platform-logo-icon-new-twitter-logo-twitter-new-logo-app-icon-logo-social-305511820.jpg',
                                                  text: 'X',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB1L7Q2Kn2ud09g3zrELZArA5v8c5_g2Q_j_amnYWRuA&s=10',
                                                  text: 'Reddit',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ02jF6x-5teRlV3m0HFh0zGJjFQnBQtbxkBxH11CTYg&s=10',
                                                  text: 'Meet\nactivity',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaLhQeNw9hdwpqKX8flBtBgmCbimHvgopfXvcETS8UVQ&s=10',
                                                  text: '메시지',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-jhWwsVtXMUbAjpG9rs2m5d8fuGrKhbPlWla_lB50EA&s=10',
                                                  text: 'Samsung\nNotes',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_cqqE_RI7CWFVIzpiUJshquyELZJ8XvHdfF4O1uBBOg&s=10',
                                                  text: '내 그룹',
                                                ),
                                                const ShareProfile(
                                                  image:
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeuJJohB8_4ZiGtkHuVKzES76WM1Zq6-TPVs5-bKhpXw&s=10',
                                                  text: '더보기',
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(indent: 0, endIndent: 0),
                                          ShareButton(
                                            icon: Icons.copy_rounded,
                                            text: '링크 복사',
                                          ),
                                          ShareButton(
                                            icon: Icons.sync_alt,
                                            text: 'Quick Share',
                                          ),
                                          ShareButton(
                                            icon: Icons.add_comment_outlined,
                                            text: '게시물 작성',
                                          ),
                                          ShareButton(
                                            icon: Icons.sync,
                                            text: '리믹스',
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        icon: const Icon(
                          Icons.reply_outlined,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: const Color(0xFF1F1F1F),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (context) {
                            return SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.6 + 6,
                              child: SafeArea(
                                child: StatefulBuilder(
                                  builder: (context, setModalState) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 30,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        spacing: 20,
                                        children: [
                                          Text(
                                            '저장 위치',
                                            style: TextStyle(
                                              color: AppColors.textPrimary,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: Column(
                                                spacing: 14,
                                                children: [
                                                  BookmarkButton(
                                                    image:
                                                    'https://img.youtube.com/vi/WVgJzNtJh-w/maxresdefault.jpg',
                                                    title: '수학 공부',
                                                  ),
                                                  BookmarkButton(
                                                    image:
                                                    'https://img.youtube.com/vi/WVgJzNtJh-w/maxresdefault.jpg',
                                                    title: '수학 공부',
                                                  ),
                                                  BookmarkButton(
                                                    image:
                                                    'https://img.youtube.com/vi/WVgJzNtJh-w/maxresdefault.jpg',
                                                    title: '수학 공부',
                                                  ),
                                                  BookmarkButton(
                                                    image:
                                                    'https://img.youtube.com/vi/WVgJzNtJh-w/maxresdefault.jpg',
                                                    title: '수학 공부',
                                                  ),
                                                  BookmarkButton(
                                                    image:
                                                    'https://img.youtube.com/vi/WVgJzNtJh-w/maxresdefault.jpg',
                                                    title: '수학 공부',
                                                  ),
                                                  BookmarkButton(
                                                    image:
                                                    'https://img.youtube.com/vi/WVgJzNtJh-w/maxresdefault.jpg',
                                                    title: '수학 공부',
                                                  ),
                                                  BookmarkButton(
                                                    image:
                                                    'https://img.youtube.com/vi/WVgJzNtJh-w/maxresdefault.jpg',
                                                    title: '수학 공부',
                                                  ),
                                                  BookmarkButton(
                                                    image:
                                                    'https://img.youtube.com/vi/WVgJzNtJh-w/maxresdefault.jpg',
                                                    title: '수학 공부',
                                                  ),
                                                  BookmarkButton(
                                                    image:
                                                    'https://img.youtube.com/vi/WVgJzNtJh-w/maxresdefault.jpg',
                                                    title: '수학 공부',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 30,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                              child: Ink(
                                                width: double.infinity,
                                                height: 32,
                                                decoration: BoxDecoration(
                                                  color: Colors.white12,
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                child: InkWell(
                                                  onTap: () {},
                                                  borderRadius: BorderRadius.circular(15),
                                                  child: const Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(Icons.add, color: Colors.white),
                                                      SizedBox(width: 6),
                                                      Text(
                                                        '새 재생목록',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: const Color(0xFF1F1F1F),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (context) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height * 0.17 + 10,
                                child: SafeArea(
                                    child: StatefulBuilder(
                                        builder: (context, setModalState) {
                                          return Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                spacing: 10,
                                                children: [
                                                  MoreButton(icon: Icons.arrow_downward, text: '오프라인 저장'),
                                                  MoreButton(icon: Icons.flag_outlined, text: '신고')
                                                ],
                                              ),
                                          );
                                        }
                                    )
                                ),
                              );
                            }
                        ),
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
                                      Text(
                                        '댓글',
                                        style: AppTextStyle.body.copyWith(
                                          fontSize: 18,
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
                                                  style: AppTextStyle.body
                                                      .copyWith(
                                                        color: isToggleComment
                                                            ? Colors.black
                                                            : Colors.white,
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
                                                  style: AppTextStyle.body
                                                      .copyWith(
                                                        color: isToggleComment
                                                            ? Colors.white
                                                            : Colors.black,
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
                                                      style: AppTextStyle
                                                          .caption
                                                          .copyWith(
                                                            color: Colors.grey,
                                                            fontSize: 12,
                                                          ),
                                                    )
                                                  : Text(
                                                      '@${dummyComments[index].commentId} • ${dummyComments[index].afterMinute}분 전',
                                                      style: AppTextStyle
                                                          .caption
                                                          .copyWith(
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
                                                    style: AppTextStyle.body,
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
                                                      AppTextStyle.body
                                                          .copyWith(
                                                            color:
                                                                Colors.white54,
                                                          ),
                                                    ),
                                                textStyle:
                                                    WidgetStatePropertyAll(
                                                      AppTextStyle.body,
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
                                Text('댓글', style: AppTextStyle.body),
                                const SizedBox(width: 6),
                                Text(
                                  '$commentNumber',
                                  style: AppTextStyle.body.copyWith(
                                    color: Colors.white38,
                                  ),
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
                                        style: AppTextStyle.body.copyWith(
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
                          context.pushReplacement(
                            '/video',
                            extra: {
                              'video': widget.allVideos[index],
                              'allVideos': widget.allVideos,
                            },
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
                                          style: AppTextStyle.body,
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          '${recommendedVideo.channelName} • ${recommendedVideo.category}',
                                          style: AppTextStyle.caption,
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
