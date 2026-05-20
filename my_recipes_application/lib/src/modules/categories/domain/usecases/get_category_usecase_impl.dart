import 'package:my_recipes_application/src/modules/categories/domain/infra_interfaces/categories_repository_interface.dart';
import 'package:my_recipes_application/src/modules/categories/domain/types/categories_types.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase_interface.dart';

final class GetCategoryUsecaseImpl implements GetCategoryUsecaseInterface {
  const GetCategoryUsecaseImpl(this.repository);
  final CategoriesRepositoryInterface repository;

  @override
  Future<ListCategoriesResponse> list() async {
    final result = await repository.list();
    return result;
  }
}
