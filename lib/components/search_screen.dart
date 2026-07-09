import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/Theme/colors.dart';
import 'package:youtube_app_clonecoding/Theme/textstyle.dart';
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
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          const Youtubepppbar(
            showCategory: false,
          ),

          SliverToBoxAdapter(
            child: Container(
              height: 500,
              alignment: Alignment.center,
              child: Text(
                '검색 화면!',
                style: AppTextStyle.titleLarge.copyWith(
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