import 'package:core_module/core_module.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:my_recipes_application/src/modules/categories/domain/models/category_model.dart';

abstract class GetCategoryUsecaseInterface {
  Future<Either<ApplicationError, List<CategoryModel>>> call();
}
