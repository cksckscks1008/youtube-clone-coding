import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/widgets/category/category_bar.dart';
import 'package:youtube_app_clonecoding/screens/search/search_page.dart';
import 'package:youtube_app_clonecoding/screens/subscription/sub_list.dart';
import 'package:youtube_app_clonecoding/screens/subscription/widgets/sub_profile.dart';
import 'package:youtube_app_clonecoding/models/channel_model.dart';
import 'package:go_router/go_router.dart';

class SubAppbar extends StatefulWidget {
  final Function(int)? onCategorieSelected;
  final bool showCategory;
  final List<ChannelModel> channels = [
    ChannelModel(
      channelId: '쯔양',
      channelProfile:
          'https://i.namu.wiki/i/6gsfydAS3LmvbRM--KOqpWlrVRA5MlPvUvcq6LRPedjxCjpKAqkAEUbvVB947IjfVBcdSDB5R2BmGowUsMrh_8S8vTM5JsUMYQ2UlhAB2zQF3niQ4ywym0_HGDnnifX1fluI_WbtwniDu2ve-vz56g.webp',
    ),
    ChannelModel(
      channelId: '곽튜브',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/e/e0/Kwak_Tube_in_October_2023.jpg',
    ),
    ChannelModel(
      channelId: '빠니보틀',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/e/ea/Pani_Bottle_in_October_2023.jpg',
    ),
    ChannelModel(
      channelId: '백종원',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/3/30/Paik_Jong-won_in_November_2017.jpg',
    ),
    ChannelModel(
      channelId: '침착맨',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/4/4c/ChimChakMan_in_October_2023.jpg',
    ),
    ChannelModel(
      channelId: '김프로',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/6/62/Kimpro_Profile_Image.jpg',
    ),
    ChannelModel(
      channelId: '보겸TV',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/f/fa/Bokyem_Profile_2023.jpg',
    ),
    ChannelModel(
      channelId: '영지문화사(이영지)',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/c/cc/Lee_Young-ji_in_May_2023.jpg',
    ),
    ChannelModel(
      channelId: '덱스101',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/6/6b/Dex_Kim_Jin-young_in_August_2023.jpg',
    ),
    ChannelModel(
      channelId: '숏박스',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/7/75/Shortbox_Profile_Comedy.jpg',
    ),
    ChannelModel(
      channelId: '너덜트',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/3/3a/Nerdult_Official_Image.jpg',
    ),
    ChannelModel(
      channelId: '피식대학',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/2/22/Psick_University_Cast.jpg',
    ),
    ChannelModel(
      channelId: '사나고',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/a/ab/Sanago_3D_Pen_Creator.jpg',
    ),
    ChannelModel(
      channelId: '슈카월드',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/c/cb/Syuka_World_Economic_Broadcaster.jpg',
    ),
    ChannelModel(
      channelId: '침착맨 플러스',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/1/1d/ChimChakMan_Sub_Channel.jpg',
    ),
    ChannelModel(
      channelId: '햄지 Hamzy',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/e/ee/Hamzy_Mukbang_Creator.jpg',
    ),
    ChannelModel(
      channelId: '히밥',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/5/52/Hebop_Eating_Show.jpg',
    ),
    ChannelModel(
      channelId: '오킹TV',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/8/87/Oking_Talk_Show.jpg',
    ),
    ChannelModel(
      channelId: '랄랄',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/2/29/RalRal_Creator_Image.jpg',
    ),
    ChannelModel(
      channelId: 'MrBeast',
      channelProfile:
          'https://upload.wikimedia.org/wikipedia/commons/5/5a/MrBeast_2023_cropped.jpg',
    ),
  ];

  SubAppbar({super.key, this.onCategorieSelected, this.showCategory = true});

  @override
  State<SubAppbar> createState() => _SubAppbarState();
}

class _SubAppbarState extends State<SubAppbar> {
  final List<String> categories = [
    '전체',
    '멤버십',
    '오늘',
    '동영상',
    'Shorts',
    '라이브',
    '팟캐스트',
    '게시물',
    '이어서 시청하기',
    '시청하지 않음',
  ];
  List<String> history = [];
  int selectedIndex = 0;
  bool onHovered = false;

  @override
  Widget build(BuildContext context) {
    final double bottomHeight = widget.showCategory ? 150.0 : 90.0;

    return Theme(
      data: ThemeData(splashColor: Colors.transparent),
      child: SliverAppBar(
        pinned: false,
        floating: true,
        leadingWidth: 150,
        backgroundColor: const Color(0xFF0F0F0F),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset('assets/youtube_logo_main.jpg', scale: 0.2),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(Icons.notifications_none_rounded, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 20,),
          IconButton(
            onPressed: () {
              context.go('/search', extra: {
                'history': history
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.search, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 15),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(bottomHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.channels.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: SubProfile(
                            profile: widget.channels[index].channelProfile,
                            userName: widget.channels[index].channelId,
                          ),
                        );
                      },
                    ),

                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () => context.go('/sublist'),
                        child: Container(
                          width: 35,
                          height: 100,
                          decoration: BoxDecoration(color: Colors.black),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              const SizedBox(width: 8),
                              Text(
                                '전체',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.showCategory)
                CategoryBar(
                  categories: categories,
                  selectedIndex: selectedIndex,
                  onHand: (index) {
                    onTap(index);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (widget.onCategorieSelected != null) {
      widget.onCategorieSelected!(index);
    }
  }
}
