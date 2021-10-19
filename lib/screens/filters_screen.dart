import 'package:flutter/material.dart';
import 'package:section6mealapp_1/widgets/main_drawer.dart';
import 'package:shimmer/shimmer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter';

  final Function savefilters;
  final Map<String, bool> currentfilters;

  FiltersScreen(this.savefilters, this.currentfilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget BuiltSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
     _glutenFree = widget.currentfilters['gluten'];
     _vegan = widget.currentfilters['vegan'];
     _vegetarian = widget.currentfilters['vegetarian'];
     _lactoseFree = widget.currentfilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.savefilters(selectedFilter);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              baseColor: Colors.black,
              loop: 1,
              period: Duration(seconds: 3),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                BuiltSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten_Free meals',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                BuiltSwitchListTile(
                  'Lactose-Free',
                  'Only include Lactose-Free meals',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                BuiltSwitchListTile(
                  'Vegan',
                  'Only include Vegan meals',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                BuiltSwitchListTile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
