// ignore_for_file: public_member_api_docs, sort_constructors_first
// Shows us  the meal for a certain category

import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArguments["title"];
    final categoryId = routeArguments["id"];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(itemBuilder: ((context, index) {
        return Text(categoryTitle.toString());
      }), ),
    );
  }
}
