import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/modules/categories/domain/infra_interfaces/categories_repository_interface.dart';
import 'package:my_recipes_application/src/modules/categories/domain/types/categories_types.dart';
import 'package:my_recipes_application/src/modules/categories/infra/external_interfaces/get_category_datasource_interface.dart';

final class CategoriesRepositoryImpl implements CategoriesRepositoryInterface {
  final GetCategoryDatasourceInterface datasource;
  const CategoriesRepositoryImpl(this.datasource);

  @override
  Future<ListCategoriesResponse> list() async {
    try {
      final result = await datasource.list();
      return Right(result);
    } on ApplicationError catch (e) {
      return Left(e);
    } catch (e, stackTrace) {
      return Left(
        ApplicationError(
          message: 'Unhandled error fetching categories: $e',
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
