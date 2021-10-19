import 'package:flutter/material.dart';
import 'package:section6mealapp_1/screens/filters_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        icon,
        size: 26,
      ),
      onTap: tapHandler,
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
            padding: EdgeInsets.all(40),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Shimmer.fromColors(
              highlightColor: Colors.white,
              //color.withOpacity(0.4),
              baseColor: Colors.black,
              direction: ShimmerDirection.ltr,
              enabled: true,
              period: Duration(seconds: 3),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Cooking Up!',
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor,
                      )),
                ],
                isRepeatingAnimation: false,

                /*child: Text(
                  'Cooking Up!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),*/
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meal', Icons.restaurant_rounded, () {
            Navigator.of(context).pushNamed('/');
          }),
          Divider(
            color: Colors.grey,
            height: 30,
            indent: 20,
            endIndent: 20,
          ),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
