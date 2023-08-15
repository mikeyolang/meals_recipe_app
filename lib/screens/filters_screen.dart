import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(
      {super.key, required this.saveFilters, required this.currentFilters});
  static const routeName = "/filters";
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gluteenFree = false;
  bool _vegan = false;
  bool _vegeterian = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _gluteenFree = widget.currentFilters["gluteen"]!;
    _lactoseFree = widget.currentFilters["lactose"]!;
    _vegan = widget.currentFilters["vegan"]!;
    _vegeterian = widget.currentFilters["vegeterian"]!;

    super.initState();
  }

// Builder method for the Filtering list view
  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: updateValue(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                "gluteen": _gluteenFree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegeterian": _vegeterian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  "Gluteen- Free",
                  "Only gluteen free meals",
                  _gluteenFree,
                  (newValue) {
                    setState(
                      () {
                        _gluteenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  "Lactose - Free",
                  "Only lactose free meals",
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  "Vegan",
                  "Only vegan meals",
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  "Vegeterian",
                  "Only vegeterian meals",
                  _vegeterian,
                  (newValue) {
                    setState(
                      () {
                        _vegeterian = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
