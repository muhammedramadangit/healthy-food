import 'package:flutter/material.dart';
import 'package:new_meal_app/models/meals.dart';
import 'package:new_meal_app/widgets/mealItem.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;

  FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text('You have no favourite yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favouriteMeal[index].id,
            title: favouriteMeal[index].title,
            imageURL: favouriteMeal[index].imageUrl,
            duration: favouriteMeal[index].duration,
            affordability: favouriteMeal[index].affordability,
            complexity: favouriteMeal[index].complexity,
          );
        },
        itemCount: favouriteMeal.length,
      );
    }
  }
}
