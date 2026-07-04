import 'package:flutter/material.dart';

class SearchAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Function(String) onSearchSubmitted;

  const SearchAppbar({super.key, required this.onSearchSubmitted});

  @override
  State<SearchAppbar> createState() => _SearchAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(37);
}

class _SearchAppbarState extends State<SearchAppbar> {
  final TextEditingController _controller = TextEditingController();
  bool _isEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isEmpty = _controller.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void back(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0F0F0F),
      leading: IconButton(
        onPressed: () => back(context),
        icon: Icon(Icons.arrow_back, color: Colors.white),
      ),
      leadingWidth: 48,
      title: Row(
        children: [
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                textSelectionTheme: const TextSelectionThemeData(
                  cursorColor: Colors.white,
                ),
              ),
              child: SearchBar(
                onSubmitted: (value) {
                  if (value.trim().isEmpty) return;
                  widget.onSearchSubmitted(value);
                  _controller.clear();
                },
                shape: WidgetStatePropertyAll(StadiumBorder()),
                constraints: BoxConstraints(minHeight: 36.0, maxHeight: 36.0),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.white12),
                controller: _controller,
                textStyle: WidgetStatePropertyAll(
                  TextStyle(color: Colors.white),
                ),
                hintText: 'YouTube 검색',
                hintStyle: WidgetStatePropertyAll(
                  TextStyle(color: Colors.white60, fontWeight: FontWeight.w500),
                ),
                trailing: _isEmpty
                    ? null
                    : [
                        IconButton(
                          onPressed: () {
                            _controller.clear();
                          },
                          icon: Icon(Icons.close, color: Colors.white),
                        ),
                      ],
              ),
            ),
          ),
        ],
      ),
      actions: _isEmpty
          ? [
              IconButton(
                onPressed: () {},
                iconSize: 20,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white12),
                ),
                icon: const Icon(Icons.mic, color: Colors.white),
              ),
            ]
          : [],
    );
  }
}
