import 'package:flutter/material.dart';
import 'package:section6mealapp_1/screens/category_Meal_Screen.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Shimmer.fromColors(
          highlightColor: Colors.white,//color.withOpacity(0.4),
          baseColor: Colors.black,
          direction: ShimmerDirection.ltr,
          enabled: true,
          period: Duration(seconds: 5),
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
