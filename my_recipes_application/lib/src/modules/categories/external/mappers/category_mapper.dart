import 'package:my_recipes_application/src/modules/categories/domain/entities/category_entity.dart';

abstract final class CategoryMapper {
  const CategoryMapper._();

  static CategoryEntity fromJson(Map data) {
    return CategoryEntity(
      idCategory: data['idCategory'] as String,
      strCategory: data['strCategory'] as String,
      strCategoryThumb: data['strCategoryThumb'] as String,
      strCategoryDescription: data['strCategoryDescription'] as String,
    );
  }
}
