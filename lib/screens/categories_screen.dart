import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/category_item.dart';
import 'package:mealsapp/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyMeals"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (categoryData) => CategoryItem(
                categoryData.color,
                categoryData.title,
                categoryData.id,
              ),
            )
            .toList(),
      ),
    );
  }
}
