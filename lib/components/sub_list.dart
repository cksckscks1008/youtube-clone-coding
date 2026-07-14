import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/components/channel_model.dart';
import 'package:youtube_app_clonecoding/components/default_appbar.dart';
import 'package:youtube_app_clonecoding/components/sub_list_tile.dart';
import 'package:youtube_app_clonecoding/components/sub_modal_button.dart';

enum SortStatus {
  nears,
  news,
  abcs
}

class SubList extends StatelessWidget {

  const SubList({super.key});



  @override
  Widget build(BuildContext context) {

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



    return Scaffold(
      appBar: DefaultAppbar(text: '전체'),
      body: Material(
          color: Colors.black,
          child: SafeArea(child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, bottom: 20, top: 20),
                  child: Ink(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
                      color: Colors.white24,),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(

                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  height: 240,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black87
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 30,),
                                      SubModalButton(
                                          text: '관련성순', isSelected: true, icon: Icons.check,
                                      ),
                                      const SizedBox(height: 10,),
                                      SubModalButton(
                                          text: '새 활동순', isSelected: true, icon: Icons.check,
                                      ),
                                      const SizedBox(height: 10,),
                                      SubModalButton(
                                          text: '가나다', isSelected: true, icon: Icons.check,
                                      ),
                                      const SizedBox(height: 10,),
                                      Divider(),
                                      const SizedBox(height: 1,),
                                      SubModalButton(
                                          text: '취소', isSelected: true, icon: Icons.cancel_outlined
                                      ),
                                    ],
                                  )
                              );
                            }
                        );
                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('관련성순', style: TextStyle(color: Colors.white, fontSize: 12),),
                          Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white, size: 15,)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 5),
                  child: const Text('구독중', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: channels.length,
                  itemBuilder: (context, index) {
                    return SubListTile(id: channels[index].channelId, profile: channels[index].channelProfile, underId: '@${channels[index].channelId}',);
                  },
                ),
              ],
            ),
          )
          )
      ),
    );
  }
}
