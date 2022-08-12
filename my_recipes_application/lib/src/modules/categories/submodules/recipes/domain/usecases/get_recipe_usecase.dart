import 'package:core_module/core_module.dart';
import 'package:dartz/dartz.dart';

import 'package:my_recipes_application/src/modules/categories/submodules/recipes/datasource/get_recipe_datasource_interface.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/domain/models/recipe_model.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/domain/usecases/get_recipe_usecase_interface.dart';

class GetRecipeUsecase implements GetRecipeUsecaseInterface {
  final GetRecipeDatasourceInterface datasource;
  GetRecipeUsecase({
    required this.datasource,
  });
  @override
  Future<Either<ApplicationError, List<RecipeModel>>> call(String category) async {
    final result = await datasource(category);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}
