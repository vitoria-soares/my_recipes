import 'package:core_module/core_module.dart';
import 'package:dartz/dartz.dart';

import 'package:my_recipes_application/src/modules/categories/submodules/recipes/datasource/get_recipe_datasource_interface.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/domain/models/recipe_model.dart';

import '../../../../error/datasource_error.dart';

class GetRecipeDatasource implements GetRecipeDatasourceInterface {
  final DioServiceInterface dio;
  GetRecipeDatasource({
    required this.dio,
  });
  @override
  Future<Either<ApplicationError, List<RecipeModel>>> call(String category) async {
    final String url = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category';
    ServiceInformation result = await dio.get(url);
    if (result.statusCode == 400) {
      throw DatasourceError(
        message: 'Client error conection',
        stackTrace: StackTrace.current,
      );
    }
    if (result.statusCode == 500) {
      throw DatasourceError(
        message: 'Server error conection',
        stackTrace: StackTrace.current,
      );
    }
    var resultFinal = result.data;
    return Right(
      resultFinal["meals"].map<RecipeModel>((e) => RecipeModel.fromMap(e)).toList(),
    );
  }
}
