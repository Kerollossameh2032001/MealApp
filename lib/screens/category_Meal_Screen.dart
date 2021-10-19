import 'package:flutter/material.dart';
import 'package:section6mealapp_1/models/meal.dart';
import 'package:section6mealapp_1/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'category_meal';

  final List  availableMeal;
  CategoryMealScreen(this.availableMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}


class _CategoryMealScreenState extends State<CategoryMealScreen> {

   String categoryTitle;
   List desplayedMeals;

   @override
  void didChangeDependencies() {
     final routeArg =
     ModalRoute.of(context).settings.arguments as Map<String, String>;
     final categoryId = routeArg['id'];
     categoryTitle = routeArg['title'];
     desplayedMeals = widget.availableMeal.where((meal) {
       return meal.categories.contains(categoryId);
     }).toList();
    super.didChangeDependencies();
  }
   void _removeItem(String mealId){
     setState(() {
       desplayedMeals.removeWhere((meal) => meal.id == mealId);
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: desplayedMeals[index].id,
            imageUrl: desplayedMeals[index].imageUrl,
            title: desplayedMeals[index].title,
            affordability: desplayedMeals[index].affordability,
            complexity: desplayedMeals[index].complexity,
            duration: desplayedMeals[index].duration,
          );
        },
        itemCount: desplayedMeals.length,
      ),
    );
  }
}
