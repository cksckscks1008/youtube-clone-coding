import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/components/appbar/appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: CustomScrollView(
        slivers: [
          const Youtubepppbar(
            showCategory: false,
          ),

          SliverToBoxAdapter(
            child: Container(
              height: 500,
              alignment: Alignment.center,
              child: const Text(
                '검색 화면!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}