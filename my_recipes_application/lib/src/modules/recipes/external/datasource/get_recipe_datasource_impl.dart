import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/entities/recipe_entity.dart';
import 'package:my_recipes_application/src/modules/recipes/external/mappers/recipe_mapper.dart';
import 'package:my_recipes_application/src/modules/recipes/infra/external_interfaces/get_recipe_datasource_interface.dart';

class GetRecipeDatasourceImpl implements GetRecipeDatasourceInterface {
  final HttpServiceInterface dio;

  GetRecipeDatasourceImpl({
    required this.dio,
  });

  @override
  Future<List<RecipeEntity>> list(String category) async {
    ServiceInformation result = await dio.request(
      '/filter.php',
      queryParameters: {
        'c': category,
      },
    );

    final data = result.data['meals'] as List;
    return data.map((itemLoop) {
      return RecipeMapper.fromJson(itemLoop as Map<String, dynamic>);
    }).toList();
  }
}
