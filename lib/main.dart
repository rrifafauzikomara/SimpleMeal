import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:themeal/meals.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(
  home: new MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  ListIngredients createState() => ListIngredients();
}

class ListIngredients extends State<MyApp> {
  List<Meals> list = List();
  var isLoading = false;

  fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
    await http.get("https://www.themealdb.com/api/json/v1/1/list.php?i=list");
    if (response.statusCode == 200) {
      list = (json.decode(response.body) as List)
          .map((data) => new Meals.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fetch Data JSON"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: new Text("Fetch Data"),
            onPressed: fetchData,
          ),
        ),
        body: isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.all(10.0),
                title: new Text(list[index].strIngredient),
              );
            }));
  }
}