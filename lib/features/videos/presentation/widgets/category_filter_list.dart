
import 'package:flutter/material.dart';

class CategoryFilterList extends StatelessWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;

  const CategoryFilterList({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categories[index]),
          onTap: () => onCategorySelected(categories[index]),
        );
      },
    );
  }
}
