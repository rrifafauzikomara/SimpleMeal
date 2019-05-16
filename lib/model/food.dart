import 'dart:convert';
import 'package:themeal/model/ingredients.dart';

class Food {
  List<Ingredients> ingredients;

  Food({this.ingredients});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
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

Food foodFromJson(String str) {
  final data = json.decode(str);
  return Food.fromJson(data);
}

String foodToJson(Food food) {
  final dyn = food.toJson();
  return json.encode(dyn);
}