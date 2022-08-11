import 'package:dependencies_module/dependencies_module.dart';

import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/store/event/category_event.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/store/state/category_state.dart';

class CategoryBloc extends Bloc<CategoryEventInterface, CategoryStateInterface> {
  final GetCategoryUsecase usecase;
  CategoryBloc(
    this.usecase,
  ) : super(CategoryInitState()) {
    on<GetCategoryEvent>(_onGetCategory);
  }

  Future<void> _onGetCategory(
    CategoryEventInterface event,
    Emitter<CategoryStateInterface> emitter,
  ) async {
    emitter(CategoryLoadingState());
    var result = await usecase();
    result.fold(
      (l) => emitter(
        CategoryErrorState(message: l.message),
      ),
      (r) => emitter(
        CategorySuccessState(categoryList: r),
      ),
    );
  }
}
