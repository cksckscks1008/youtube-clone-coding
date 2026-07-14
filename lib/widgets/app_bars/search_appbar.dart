import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/Theme/colors.dart';
import 'package:youtube_app_clonecoding/Theme/textstyle.dart';

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
      backgroundColor: AppColors.background,
      leading: IconButton(
        onPressed: () => back(context),
        icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
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
                backgroundColor: WidgetStatePropertyAll(AppColors.surface),
                controller: _controller,
                textStyle: WidgetStatePropertyAll(
                  AppTextStyle.body,
                ),
                hintText: 'YouTube 검색',
                hintStyle: WidgetStatePropertyAll(
                  AppTextStyle.body.copyWith(color: AppColors.textSecondary),
                ),
                trailing: _isEmpty
                    ? null
                    : [
                        IconButton(
                          onPressed: () {
                            _controller.clear();
                          },
                          icon: Icon(Icons.close, color: AppColors.textPrimary),
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
                  backgroundColor: WidgetStatePropertyAll(AppColors.surface),
                ),
                icon: const Icon(Icons.mic, color: AppColors.textPrimary),
              ),
            ]
          : [],
    );
  }
}
