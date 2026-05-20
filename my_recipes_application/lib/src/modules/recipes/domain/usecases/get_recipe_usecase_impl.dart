import 'package:my_recipes_application/src/modules/recipes/domain/infra_interfaces/recipe_repository_interface.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/types/recipes_types.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/usecases/get_recipe_usecase_interface.dart';

class GetRecipeUsecaseImpl implements GetRecipeUsecaseInterface {
  final RecipeRepositoryInterface repository;
  GetRecipeUsecaseImpl({
    required this.repository,
  });
  @override
  Future<ListRecipesResponse> list(String category) async {
    final result = await repository.list(category);
    return result;
  }
}
