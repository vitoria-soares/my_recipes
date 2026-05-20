import 'package:my_recipes_application/src/modules/recipes/domain/entities/recipe_entity.dart';

final class RecipeModel extends RecipeEntity {
  const RecipeModel({
    required super.strMeal,
    required super.strMealThumb,
    required super.idMeal,
  });

  factory RecipeModel.fromEntity(RecipeEntity entity) {
    return RecipeModel(
      strMeal: entity.strMeal,
      strMealThumb: entity.strMealThumb,
      idMeal: entity.idMeal,
    );
  }
}
