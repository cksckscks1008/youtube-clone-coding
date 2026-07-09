import 'package:flutter/material.dart';
import 'package:youtube_app_clonecoding/Theme/colors.dart';
import 'package:youtube_app_clonecoding/components/appbar/components/categorie_button.dart';

class CategoryBar extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onHand;
  final Function()? openMenu;

  const CategoryBar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onHand,
    this.openMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 48.0,
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        itemBuilder: (context, index) {

          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white10,
                ),
                child: IconButton(
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(3),
                  onPressed: () => openMenu?.call(),
                  icon: const Icon(Icons.explore, color: Colors.white, size: 20),
                ),
              ),
            );
          }

          int categoryIndex = index - 1;

          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: CategorieButton(
              isSelected: selectedIndex == categoryIndex,
              onTap: () => onHand(categoryIndex),
              text: categories[categoryIndex],
            ),
          );
        },
      ),
    );
  }
}
