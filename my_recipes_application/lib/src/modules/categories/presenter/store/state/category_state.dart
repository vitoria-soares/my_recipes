import 'package:my_recipes_application/src/modules/categories/domain/models/category_model.dart';

abstract class CategoryStateInterface {}

class CategoryInitState extends CategoryStateInterface {}

class CategoryLoadingState extends CategoryStateInterface {}

class CategorySuccessState extends CategoryStateInterface {
  final List<CategoryModel> categoryList;
  CategorySuccessState({
    required this.categoryList,
  });
}

class CategoryErrorState extends CategoryStateInterface {
  final String message;
  CategoryErrorState({
    required this.message,
  });
}
