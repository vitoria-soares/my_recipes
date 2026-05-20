import 'package:core_module/core_module.dart';

class RecipeEntity extends Equatable {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;
  const RecipeEntity({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  @override
  List<Object?> get props => [
        strMeal,
        strMealThumb,
        idMeal
      ];

  // @override
  // bool operator ==(covariant RecipeEntity other) {
  //   if (identical(this, other)) return true;

  //   return other.strMeal == strMeal && other.strMealThumb == strMealThumb && other.idMeal == idMeal;
  // }

  // @override
  // int get hashCode => strMeal.hashCode ^ strMealThumb.hashCode ^ idMeal.hashCode;
}
