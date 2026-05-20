import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/infra_interfaces/recipe_repository_interface.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/types/recipes_types.dart';
import 'package:my_recipes_application/src/modules/recipes/infra/external_interfaces/get_recipe_datasource_interface.dart';

base class RecipeRepositoryImpl implements RecipeRepositoryInterface {
  final GetRecipeDatasourceInterface datasource;
  const RecipeRepositoryImpl(this.datasource);

  @override
  Future<ListRecipesResponse> list(String category) async {
    try {
      final result = await datasource.list(category);
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(
        ApplicationError(
          message: 'Unhandled error fetching recipes: $e',
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
