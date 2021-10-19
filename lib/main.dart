import 'package:flutter/material.dart';
import 'package:section6mealapp_1/dummy_data.dart';
import 'package:section6mealapp_1/screens/categories_screen.dart';
import 'package:section6mealapp_1/screens/category_Meal_Screen.dart';
import 'package:section6mealapp_1/screens/favorites_screen.dart';
import 'package:section6mealapp_1/screens/filters_screen.dart';
import 'package:section6mealapp_1/screens/meal_detail_screen.dart';
import 'package:section6mealapp_1/screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import 'package:shimmer/shimmer.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List _availableMeal = DUMMY_MEALS;

  void _Setfilter(Map<String, bool> filtersData) {
    setState(() {
      _filters = filtersData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  List _FavoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _FavoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _FavoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _FavoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(mealId) {
    return _FavoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //appBarColor
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        //appBackgroudColor
        canvasColor: Color.fromRGBO(255, 254, 229, 1),

        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              subtitle1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
      ),
      //home: Home(),
      home: TabsScreen(_FavoriteMeals),
      routes: {
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_Setfilter, _filters),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
