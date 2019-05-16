import 'package:flutter/material.dart';
import 'package:themeal/model/ingredients.dart';
import 'package:themeal/model/food.dart';
import 'package:themeal/api/food_api_service.dart';
import 'package:themeal/view/detail.dart';
import 'package:http/http.dart' as http;

class IngredientsPage extends StatefulWidget {
  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  final List<Food> _foods = List();

  Future<Food> futureFood;
  IngredientsService _ingredientsService = IngredientsService();

  @override
  void initState() {
    futureFood = _ingredientsService.getIngredients(http.Client());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("The Ingredients"),
        ),
        body: getBody());
  }

  getBody() {
    return SafeArea(
      child: FutureBuilder(
        initialData: _foods,
        future: futureFood,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(snapshot.error.toString()),
              ),
            );
            return Center(
              child: Text("Something wrong"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            Food food = snapshot.data as Food;
            return ListView.builder(
                itemCount: food.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  Ingredients ingredient = food.ingredients[index];
                  return GestureDetector(
                      child: new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new Text(ingredient.strIngredient)
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IngredientsDetailPage(ingredients: ingredient)
                            )
                        );
                      }
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}