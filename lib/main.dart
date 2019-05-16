import 'package:flutter/material.dart';
import 'package:themeal/view/list.dart';

void main() => runApp(new MyApp());

// App root class
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'The Ingredients',
        home: new IngredientsPage()
    );
  }
}