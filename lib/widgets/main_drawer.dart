// The widget fo rthe main drawer

import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
// Creating the List tile builder
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      onTap: () => tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Colors.amber,
            child: const Text(
              "Cooking Up !",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          buildListTile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushNamed("/");
          }),
          const SizedBox(
            height: 15,
          ),
          buildListTile(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context).pushNamed(FilterScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
