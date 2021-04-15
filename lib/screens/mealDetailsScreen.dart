import 'package:flutter/material.dart';
import 'package:new_meal_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'meal_details';

  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailsScreen(this.toggleFavourite, this.isFavourite);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.title),
    );
  }

  Widget customContainer({@required child}) {
    return Container(
      height: 160,
      width: 320,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            customContainer(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            customContainer(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {toggleFavourite(mealId);},
        child: Icon(
          isFavourite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }
}
