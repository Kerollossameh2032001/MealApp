import 'package:flutter/material.dart';
import 'package:section6mealapp_1/screens/categories_screen.dart';
import 'package:section6mealapp_1/screens/favorites_screen.dart';
import 'package:section6mealapp_1/widgets/main_drawer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class TabsScreen extends StatefulWidget {
  final List FavoriteMeal;

  TabsScreen(this.FavoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedIndexPage = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Category',
      },
      {
        'page': FavoritesScreen(widget.FavoriteMeal),
        'title': 'Favorites',
      }
    ];
    super.initState();
  }

  void _selectpage(int value) {
    setState(() {
      _selectedIndexPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Shimmer.fromColors(
          highlightColor: Colors.black,
          //color.withOpacity(0.4),
          baseColor: Colors.white,
          direction: ShimmerDirection.ltr,
          enabled: true,
          period: Duration(seconds: 3),
          child: Text(_pages[_selectedIndexPage]['title']),
        ),
      ),
      body: _pages[_selectedIndexPage]['page'],
      bottomNavigationBar: ConvexAppBar /*BottomNavigationBar*/ (
        onTap: _selectpage,
        elevation: 4,
        backgroundColor: Theme.of(context).primaryColor,
        //selectedItemColor: Theme.of(context).accentColor,
        activeColor: Theme.of(context).accentColor,

        //unselectedItemColor: Colors.white,
        color: Colors.white,

        //currentIndex: _selectedIndexPage,
        initialActiveIndex: _selectedIndexPage,

        //curveSize: 10.0,
        top: -10,
        items: [
          TabItem(
            icon: Icon(
              Icons.category,
              size: 25,
            ),
            title: 'Category',
          ),
          TabItem(
            icon: Icon(Icons.star, size: 25),
            title: 'Favorites',
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
