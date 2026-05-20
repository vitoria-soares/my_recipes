import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/entities/recipe_entity.dart';

typedef ListRecipesResponse = Either<ApplicationError, List<RecipeEntity>>;
