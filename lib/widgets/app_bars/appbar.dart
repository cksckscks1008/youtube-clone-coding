import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/widgets/category/category_bar.dart';
import 'package:youtube_app_clonecoding/screens/search/search_page.dart';

class Youtubepppbar extends StatefulWidget {
  final Function(int)? onCategorieSelected;
  final bool showCategory;
  final Function()? openMenu;

  const Youtubepppbar({
    super.key,
    this.onCategorieSelected,
    this.showCategory = true,
    this.openMenu,
  });

  @override
  State<Youtubepppbar> createState() => _YoutubepppbarState();
}

class _YoutubepppbarState extends State<Youtubepppbar> {
  final List<String> categories = [
    '전체',
    '게임',
    '음악',
    '라이브',
    '믹스',
    '마인크래프트',
    '액션 어드벤처 게임',
    '에니메이션',
    '랩',
    '반려동물',
    '수학',
    '축구',
    '최근에 업로드된 동영상',
    '게시물',
    '새로운 맞춤 동영상',
  ];
  List<String> history = [];
  int selectedIndex = 0;
  bool onHovered = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(splashColor: Colors.transparent),
      child: SliverAppBar(
        pinned: true,
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
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(history: history),
                ),
              );
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.search, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 15),
        ],
        bottom: widget.showCategory
            ? PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: CategoryBar(
            categories: categories,
            selectedIndex: selectedIndex,
            onHand: (index) {
              onTap(index);
            },
            openMenu: widget.openMenu,
          ),
        )
            : null,
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
