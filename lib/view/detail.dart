import 'package:flutter/material.dart';
import 'package:themeal/model/ingredients.dart';

class IngredientsDetailPage extends StatelessWidget {

  final Ingredients ingredients;

  IngredientsDetailPage({Key key, @required this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Ingredients"),
        ),
        body: getBody()
    );
  }

  getBody(){
    return ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            "${ingredients.strIngredient}",
            softWrap: true,
          ),
        )
      ],
    );
  }

}