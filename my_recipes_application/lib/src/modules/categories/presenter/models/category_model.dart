import 'package:my_recipes_application/src/modules/categories/domain/entities/category_entity.dart';

final class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.idCategory,
    required super.strCategory,
    required super.strCategoryThumb,
    required super.strCategoryDescription,
  });

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      idCategory: entity.idCategory,
      strCategory: entity.strCategory,
      strCategoryThumb: entity.strCategoryThumb,
      strCategoryDescription: entity.strCategoryDescription,
    );
  }
}
