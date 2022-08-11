import 'dart:convert';

class RecipeModel {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;
  RecipeModel({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  RecipeModel copyWith({
    String? strMeal,
    String? strMealThumb,
    String? idMeal,
  }) {
    return RecipeModel(
      strMeal: strMeal ?? this.strMeal,
      strMealThumb: strMealThumb ?? this.strMealThumb,
      idMeal: idMeal ?? this.idMeal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'strMeal': strMeal,
      'strMealThumb': strMealThumb,
      'idMeal': idMeal,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      strMeal: map['strMeal'] ?? '',
      strMealThumb: map['strMealThumb'] ?? '',
      idMeal: map['idMeal'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) => RecipeModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'RecipeModel(strMeal: $strMeal, strMealThumb: $strMealThumb, idMeal: $idMeal)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecipeModel &&
        other.strMeal == strMeal &&
        other.strMealThumb == strMealThumb &&
        other.idMeal == idMeal;
  }

  @override
  int get hashCode => strMeal.hashCode ^ strMealThumb.hashCode ^ idMeal.hashCode;
}
