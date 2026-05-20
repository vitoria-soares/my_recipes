import 'package:my_recipes_application/src/modules/recipes/domain/types/recipes_types.dart';

abstract class GetRecipeUsecaseInterface {
  Future<ListRecipesResponse> list(String category);
}
