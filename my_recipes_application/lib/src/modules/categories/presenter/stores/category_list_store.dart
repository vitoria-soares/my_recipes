import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase_interface.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/models/category_model.dart';

class CategoryListStore extends Bloc<CategoryEventInterface, CategoryStateInterface> {
  final GetCategoryUsecaseInterface usecase;

  CategoryListStore(
    this.usecase,
  ) : super(CategoryInitState()) {
    on<GetCategoryEvent>(_onGetCategory);
  }

  Future<void> _onGetCategory(
    CategoryEventInterface event,
    Emitter<CategoryStateInterface> emitter,
  ) async {
    emitter(CategoryLoadingState());

    final result = await usecase.list();

    result.fold(
      (error) => emitter(
        CategoryErrorState(message: error.message),
      ),
      (categorieEntities) => emitter(
        CategorySuccessState(
            categoryList: categorieEntities.map((e) {
          return CategoryModel.fromEntity(e);
        }).toList()),
      ),
    );
  }
}

abstract class CategoryEventInterface {}

class GetCategoryEvent extends CategoryEventInterface {}

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
