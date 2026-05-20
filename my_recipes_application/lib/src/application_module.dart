import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/modules/categories/categories_module.dart';
import 'package:my_recipes_application/src/modules/recipes/recipes_module.dart';

class ApplicationModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: CategoriesModule());
    r.module('/', module: RecipesModule());
  }
}
