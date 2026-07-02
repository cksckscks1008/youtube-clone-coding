import 'package:flutter/material.dart';
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
      color: const Color(0xFF0F0F0F),
      height: 48.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white10,
              ),
              child: IconButton(
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.all(6),
                onPressed: () => openMenu?.call(),
                icon: const Icon(Icons.explore, color: Colors.white, size: 20),
              ),
            ),
          ),
          const SizedBox(width: 8),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 4,
                  ),
                  child: CategorieButton(
                    isSelected: selectedIndex == index,
                    onTap: () => onHand(index),
                    text: categories[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
