import 'package:my_recipes_application/src/modules/recipes/domain/entities/recipe_entity.dart';

abstract class GetRecipeDatasourceInterface {
  Future<List<RecipeEntity>> list(String category);
}
