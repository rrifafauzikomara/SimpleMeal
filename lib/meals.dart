//class Meals {
//  final String title;
//  final String thumbnailUrl;
//
//  Meals._({this.title, this.thumbnailUrl});
//
//  factory Meals.fromJson(Map<String, dynamic> json) {
//    return new Meals._(
//      title: json['title'],
//      thumbnailUrl: json['thumbnailUrl'],
//    );
//  }
//}

class Meals {
  String idIngredient;
  String strIngredient;

  Meals({this.idIngredient, this.strIngredient});

  Meals.fromJson(Map<String, dynamic> json) {
    idIngredient = json['idIngredient'];
    strIngredient = json['strIngredient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idIngredient'] = this.idIngredient;
    data['strIngredient'] = this.strIngredient;
    return data;
  }
}