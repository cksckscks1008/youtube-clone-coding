import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/components/appbar/appbar.dart';
import 'package:youtube_app_clonecoding/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCategoryIndex = 0;

  final List<Widget> _bodyPages = [
    const Center(child: Text('전체 영상 리스트', style: TextStyle(color: Colors.white))),
    const Center(child: Text('게임 영상 리스트', style: TextStyle(color: Colors.white))),
    const Center(child: Text('음악 영상 리스트', style: TextStyle(color: Colors.white))),
  ];

  void openMenu() {
    ScaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0F0F0F),

        body: CustomScrollView(
          slivers: [
            Youtubepppbar(
                onCategorieSelected: (index) {
              setState(() {
                _currentCategoryIndex = index;
              });
            },
            openMenu: openMenu,),

            SliverToBoxAdapter(
              child: Container(
                  height: 800,
                  child: _currentCategoryIndex < _bodyPages.length
                      ? _bodyPages[_currentCategoryIndex]
                      : Center(child: Text('카테고리 $_currentCategoryIndex 번 화면'),)
              ),
            )
          ],
        )
    );
  }
}