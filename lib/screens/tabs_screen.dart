import 'package:flutter/material.dart';
import 'package:mealsapp/screens/categories_screen.dart';
import 'package:mealsapp/screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List _pages = [
    {
      "page": const CategoriesScreen(),
      "title": "Categories",
    },
    {
      "page": const FavoriteScreen(),
      "title": "Your Favorites",
    }
  ];
  int _selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]["title"]),
      ),
      drawer: const Drawer(
        child: Text("A Drawer"),
      ),
      body: _pages[_selectedIndex]["pages"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        selectedItemColor: Colors.amber,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.black38,
        unselectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
