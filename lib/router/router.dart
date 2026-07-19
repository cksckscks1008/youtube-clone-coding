import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_app_clonecoding/screens/video_player/video_player_screen.dart';
import 'package:youtube_app_clonecoding/screens/search/search_page.dart';
import 'package:youtube_app_clonecoding/screens/subscription/sub_list.dart';
import 'package:youtube_app_clonecoding/screens/main_screen.dart';
import 'package:youtube_app_clonecoding/models/video_model.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreen();
      },
    ),

    GoRoute(
      path: '/video',
      pageBuilder: (BuildContext context, GoRouterState state) {
        final extra = state.extra as Map<String, dynamic>?;

        Widget screen;

        if (extra != null) {
          final video = extra['video'] as VideoModel;
          final allVideos = extra['allVideos'] as List<VideoModel>;

          screen = VideoPlayerScreen(video: video, allVideos: allVideos);
        } else {
          screen = const Scaffold(body: Center(child: Text('영상을 불러올 수 없습니다.')));
        }

        return MaterialPage(key: state.pageKey, child: screen);
      },
    ),

    GoRoute(
      path: '/search',
      pageBuilder: (BuildContext context, GoRouterState state) {
        final extra = state.extra as Map<String, List<String>>?;

        Widget screen;
        if (extra != null) {
          final history = extra['history'] as List<String>;

          screen = SearchPage(history: history);
        } else {
          screen = const Scaffold(body: Center(child: Text('영상을 불러올 수 없습니다.')));
        }

        return MaterialPage(key: state.pageKey, child: screen);
      },
    ),

    GoRoute(
      path: '/sublist',
      builder: (BuildContext context, GoRouterState state) {
        return SubList();
      },
    ),
  ],
);
