import 'package:flutter/material.dart';
import 'package:section6mealapp_1/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List FavoriteMeal;

  FavoritesScreen(this.FavoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (FavoriteMeal.isEmpty) {
      return Center(
        child: Text('You have no favorites yet, start adding some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: FavoriteMeal[index].id,
            imageUrl: FavoriteMeal[index].imageUrl,
            title: FavoriteMeal[index].title,
            affordability: FavoriteMeal[index].affordability,
            complexity: FavoriteMeal[index].complexity,
            duration: FavoriteMeal[index].duration,
          );
        },
        itemCount: FavoriteMeal.length,
      );
    }
  }
}
