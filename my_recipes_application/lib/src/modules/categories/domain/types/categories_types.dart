import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/modules/categories/domain/entities/category_entity.dart';

typedef ListCategoriesResponse = Either<ApplicationError, List<CategoryEntity>>;
