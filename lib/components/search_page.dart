import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/components/home_screen.dart';
import 'package:youtube_app_clonecoding/components/search_appbar.dart';

class SearchPage extends StatefulWidget {
  List<String> history;

  SearchPage({
    super.key,
    required this.history
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: SearchAppbar(
        onSearchSubmitted: (value) {
          setState(() {
            widget.history.insert(0, value);
            Navigator.pop(context);
          });
        },
      ),
      body: widget.history.isEmpty
          ? Center(
        child: Text(
          '최근 검색 기록이 없습니다.',
          style: TextStyle(color: Colors.white54),
        ),
      )
          : ListView.builder(
        itemCount: widget.history.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.history, color: Colors.white70),
            title: Text(
              widget.history[index],
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            trailing: IconButton(
              icon: Icon(Icons.close, color: Colors.white54, size: 20),
              onPressed: () {
                setState(() {
                  widget.history.removeAt(index);
                });
              },
            ),
            onTap: () {
            },
          );
        },
      ),
    );
  }
}