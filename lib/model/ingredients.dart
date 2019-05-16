class Ingredients {
  final String idIngredient;
  final String strIngredient;

  Ingredients(this.idIngredient, this.strIngredient);

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
        json['idIngredient'],
        json['strIngredient']
    );
  }

  Map<String, dynamic> toJson() {
    return {"strIngredient": strIngredient, "idIngredient": idIngredient};
  }

  @override
  String toString() {
    return 'Ingredients{strIngredient: $strIngredient, idMeal: $idIngredient}';
  }

}