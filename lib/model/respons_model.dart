import 'dart:convert';
import 'package:themeal/model/ingredients.dart';

class ResponsModel {
  List<Ingredients> ingredients;

  ResponsModel({this.ingredients});

  factory ResponsModel.fromJson(Map<String, dynamic> json) {
    return ResponsModel(
      ingredients: List<Ingredients>.from(
        json["meals"].map((meal) {
          return Ingredients.fromJson(meal);
        }),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "meals": List<Ingredients>.from(
        ingredients.map((meal) {
          return meal.toJson();
        }),
      )
    };
  }

  @override
  String toString() {
    return 'Food{meals: $ingredients}';
  }
}

ResponsModel foodFromJson(String str) {
  final data = json.decode(str);
  return ResponsModel.fromJson(data);
}

String foodToJson(ResponsModel food) {
  final dyn = food.toJson();
  return json.encode(dyn);
}