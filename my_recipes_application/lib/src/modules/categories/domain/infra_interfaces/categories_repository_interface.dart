import 'package:my_recipes_application/src/modules/categories/domain/types/categories_types.dart';

abstract interface class CategoriesRepositoryInterface {
  Future<ListCategoriesResponse> list();
}
