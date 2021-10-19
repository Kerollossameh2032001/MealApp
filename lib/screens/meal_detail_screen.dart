import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:section6mealapp_1/dummy_data.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail';
  final Function toggleFavorite, isMealFavorite;

  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      bottomNavigationBar: ConvexButton.fab(
        onTap: () => toggleFavorite(mealId),
        icon: isMealFavorite(mealId) ? Icons.star : Icons.star_border,
        top: 40,
        color: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        iconSize: 30,
        thickness: 20,
        sigma: 16,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    selectedMeal.ingredients[index],
                  ),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            )),
            buildSectionTitle(context, 'steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 3,
                    indent: 50,
                    endIndent: 50,
                  )
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.of(context).pop(mealId);},
        elevation: 4,
        child: Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,*/
    );
  }
}
