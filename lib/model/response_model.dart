import 'dart:convert';
import 'package:themeal/model/ingredients.dart';

class ResponseModel {
  
  List<Ingredients> ingredients;

  ResponseModel({this.ingredients});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(ingredients: List<Ingredients>.from(
        json["meals"].map((meal) {
          return Ingredients.fromJson(meal);
        }),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "meals": List<Ingredients>.from(ingredients.map((meal) {
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

ResponseModel foodFromJson(String str) {
  final data = json.decode(str);
  return ResponseModel.fromJson(data);
}

String foodToJson(ResponseModel food) {
  final dyn = food.toJson();
  return json.encode(dyn);
}