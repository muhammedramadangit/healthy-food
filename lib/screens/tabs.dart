import 'package:flutter/material.dart';
import 'package:new_meal_app/models/meals.dart';
import 'package:new_meal_app/screens/categoryScreen.dart';
import 'package:new_meal_app/screens/favourite.dart';
import 'package:new_meal_app/widgets/mainDrawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;

  TabsScreen(this.favouriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(widget.favouriteMeal),
        'title': 'My Favourite',
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;
  void _selectedpage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedpage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourite'),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
