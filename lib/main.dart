import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //json
import 'package:themeal/model/ingredients.dart';
import 'package:themeal/view/detail.dart';

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

class IngredientsPage extends StatefulWidget {

  IngredientsPage({Key key}) : super(key: key);

  @override
  _IngredientsPageState createState() => new _IngredientsPageState();
}

// Home page state class
class _IngredientsPageState extends State<IngredientsPage> {

  List<Ingredients> ingredients = [];

  @override
  void initState() {
    super.initState();
    // loadData();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("The Ingredients"),
        ),
        body: getBody());
  }

  getBody() {
    if (ingredients.length == 0) {
      return new Center(child: new CircularProgressIndicator());
    } else {
      return getListView();
    }
  }

  ListView getListView() => new ListView.builder(
    itemCount: ingredients.length,
    itemBuilder: (BuildContext context, int position) {
      return getRow(position);
  });

  Widget getRow(int i) {
    return new GestureDetector(
        child: new Padding(
            padding: new EdgeInsets.all(10.0),
            child: new Text("${ingredients[i].strIngredient}")
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IngredientsDetailPage(ingredients: ingredients[i])
              )
          );
        }
    );
  }

  // loadData() async {
  //   String dataURL = "https://www.themealdb.com/api/json/v1/1/list.php?i=list";
  //   http.Response response = await http.get(dataURL);
  //   var responseJson = json.decode(response.body);
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       ingredients =  (responseJson['meals'] as List).map((p) => Ingredients.fromJson(p)).toList();
  //     });
  //   } else {
  //     throw Exception('Gagal mendapatkan ingredients');
  //   }
  // }

  Future<Ingredients> fetchPost() async {
    final response = await http.get('https://www.themealdb.com/api/json/v1/1/list.php?i=list');
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        ingredients =  (responseJson['meals'] as List).map((p) => Ingredients.fromJson(p)).toList();
      });
    } else {
      throw Exception('Gagal mendapatkan ingredients');
    }
  }

}