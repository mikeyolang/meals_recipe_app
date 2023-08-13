// A screeen that shows the details about a single recipe
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  static const routeName = "/meal-detail";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Details"),
      ),
      body: Center(
        child: Text("Meal - $mealId"),
      ),
    );
  }
}