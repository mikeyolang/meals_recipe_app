// ignore_for_file: public_member_api_docs, sort_constructors_first
// Shows us  the meal for a certain category

import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/meal_item.dart';

import '../data/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArguments["title"];
    final categoryId = routeArguments["id"];
    //  The filtered categories of meals
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl);
        }),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
