import 'package:core_module/core_module.dart';

import '../domain/models/recipe_model.dart';

abstract class GetRecipeDatasourceInterface {
  Future<Either<ApplicationError, List<RecipeModel>>> call(String category);
}
