import 'package:my_recipes_application/src/modules/recipes/domain/entities/recipe_entity.dart';

abstract final class RecipeMapper {
  const RecipeMapper._();

  static RecipeEntity fromJson(Map data) {
    return RecipeEntity(
      idMeal: data['idMeal'] as String,
      strMeal: data['strMeal'] as String,
      strMealThumb: data['strMealThumb'] as String,
    );
  }
}
