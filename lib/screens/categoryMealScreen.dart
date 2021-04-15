import 'package:flutter/material.dart';
import 'package:new_meal_app/models/meals.dart';
import 'package:new_meal_app/widgets/mealItem.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meal';

  final List<Meal> aviliableMeal;

  CategoryMealsScreen(this.aviliableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String _categoryTitle;
  List <Meal> displayMeals;

  @override
  void didChangeDependencies() {
    final _routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final _categoryId = _routeArg['id'];
    _categoryTitle = _routeArg['title'];
    displayMeals = widget.aviliableMeal.where((meal) {
      return meal.categories.contains(_categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeMeal(String mealId){
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageURL: displayMeals[index].imageUrl,
            duration: displayMeals[index].duration,
            affordability: displayMeals[index].affordability,
            complexity: displayMeals[index].complexity,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
