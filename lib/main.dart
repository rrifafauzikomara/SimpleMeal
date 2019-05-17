import 'package:flutter/material.dart';
import 'package:themeal/view/list_ingredients.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'The Ingredients',
        home: IngredientsPage()
    );
  }
}