import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/modules/categories/domain/entities/category_entity.dart';
import 'package:my_recipes_application/src/modules/categories/external/mappers/category_mapper.dart';
import 'package:my_recipes_application/src/modules/categories/infra/external_interfaces/get_category_datasource_interface.dart';

final class GetCategoryDatasourceImpl implements GetCategoryDatasourceInterface {
  final HttpServiceInterface dio;

  const GetCategoryDatasourceImpl({
    required this.dio,
  });

  @override
  Future<List<CategoryEntity>> list() async {
    final result = await dio.request(
      '/categories.php',
    );
    final data = result.data['categories'] as List;
    return data.map((itemLoop) {
      return CategoryMapper.fromJson(itemLoop as Map<String, dynamic>);
    }).toList();
  }
}
