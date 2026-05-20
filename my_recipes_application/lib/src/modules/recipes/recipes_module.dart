import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/core/contants/routes.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/infra_interfaces/recipe_repository_interface.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/usecases/get_recipe_usecase_impl.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/usecases/get_recipe_usecase_interface.dart';
import 'package:my_recipes_application/src/modules/recipes/external/datasource/get_recipe_datasource_impl.dart';
import 'package:my_recipes_application/src/modules/recipes/infra/external_interfaces/get_recipe_datasource_interface.dart';
import 'package:my_recipes_application/src/modules/recipes/infra/repositories/recipe_repository_impl.dart';
import 'package:my_recipes_application/src/modules/recipes/presenter/pages/recipes_page.dart';
import 'package:my_recipes_application/src/modules/recipes/presenter/store/recipe_list_store.dart';
import 'package:my_recipes_application/src/shared_module.dart';

final class RecipesModule extends Module {
  @override
  List<Module> get imports {
    return [
      SharedModule(),
    ];
  }

  @override
  void binds(Injector i) {
    i.add<GetRecipeDatasourceInterface>(GetRecipeDatasourceImpl.new);
    i.add<RecipeRepositoryInterface>(RecipeRepositoryImpl.new);
    i.add<GetRecipeUsecaseInterface>(GetRecipeUsecaseImpl.new);
    i.add<RecipeListStore>(RecipeListStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.recipesList,
      child: (context) {
        final data = r.args.data as Map;
        return RecipesPage(
          categoryId: data['categoryId'] as String,
          store: Modular.get<RecipeListStore>(),
        );
      },
      transition: TransitionType.rightToLeft,
    );
  }
}
