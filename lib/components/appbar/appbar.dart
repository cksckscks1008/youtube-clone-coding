import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/components/appbar/components/categorie_button.dart';

class Youtubepppbar extends StatefulWidget {
  final Function(int) onCategorieSelected;
  const Youtubepppbar({
    super.key,
    required this.onCategorieSelected
  });

  @override
  State<Youtubepppbar> createState() => _YoutubepppbarState();
}

class _YoutubepppbarState extends State<Youtubepppbar> {
  final List<String> categories = ['전체', '게임', '음악', '라이브', '믹스', '마인크래프트', '액션 어드벤처 게임', '에니메이션', '랩', '반려동물', '수학', '축구', '최근에 업로드된 동영상', '게시물', '새로운 맞춤 동영상'];
  int selectedIndex = 0;
  bool onHovered = false;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      leadingWidth: 150,
      backgroundColor: const Color(0xFF0F0F0F),

      leading: Padding(
        padding: EdgeInsets.only(),
        child: Image.asset(
          'assets/youtube_logo.jpg',
          scale: 0.4,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          splashColor: Colors.white,
          splashRadius: 10,
          highlightColor: Colors.white24,
          icon: const Icon(
            Icons.notifications_none_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
        SizedBox(width: 20),
        IconButton(onPressed: () {},
          splashColor: Colors.white,
          splashRadius: 10,
          highlightColor: Colors.white24,
          icon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),),
        SizedBox(width: 15),
      ],

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: Container(
          color: const Color(0xFF0F0F0F),
          height: 48.0,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    child: CategorieButton(isSelected: selectedIndex == index, onTap: () => onTap(index), text: categories[index],),
                  );
            },
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onCategorieSelected(index);
  }
}