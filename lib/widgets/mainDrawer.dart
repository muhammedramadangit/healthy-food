import 'package:flutter/material.dart';
import 'package:new_meal_app/screens/filter.dart';

class MainDrawer extends StatelessWidget {
  Widget customListTile({
    String title,
    IconData icon,
    Function onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 22),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: onTap,
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
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          customListTile(
            title: 'Meal',
            icon: Icons.restaurant,
            onTap: () {Navigator.of(context).pushReplacementNamed('/');},
          ),
          customListTile(
            title: 'Filter',
            icon: Icons.settings,
            onTap: () {Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);},
          ),
        ],
      ),
    );
  }
}
