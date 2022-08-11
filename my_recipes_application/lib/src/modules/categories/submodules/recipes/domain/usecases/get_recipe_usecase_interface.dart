import 'package:core_module/core_module.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/domain/models/recipe_model.dart';

abstract class GetRecipeUsecaseInterface {
  Future<Either<ApplicationError, List<RecipeModel>>> call(String category);
}
