import 'package:my_recipes_application/src/modules/categories/domain/entities/category_entity.dart';

abstract class GetCategoryDatasourceInterface {
  Future<List<CategoryEntity>> list();
}
