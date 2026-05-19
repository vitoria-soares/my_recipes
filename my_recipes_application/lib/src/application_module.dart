import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase.dart';
import 'package:my_recipes_application/src/modules/categories/external/datasource/get_category_datasource.dart';
import 'package:my_recipes_application/src/modules/categories/external/datasource/get_category_datasource_interface.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/store/bloc/category_bloc.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/presenter/pages/recipes_page.dart';

import 'modules/categories/domain/models/category_model.dart';
import 'modules/categories/submodules/recipes/datasource/get_recipe_datasource.dart';
import 'modules/categories/submodules/recipes/datasource/get_recipe_datasource_interface.dart';
import 'modules/categories/submodules/recipes/domain/usecases/get_recipe_usecase.dart';
import 'modules/categories/submodules/recipes/presenter/store/bloc/recipe_bloc.dart';
import 'modules/home/presenter/pages/home_page.dart';

class ApplicationModule extends Module {
  @override
  void binds(Injector i) {
    i.add<DioServiceInterface>(DioService.new);
    i.add<GetCategoryDatasourceInterface>(
      () => GetCategoryDatasource(dio: i.get<DioServiceInterface>()),
    );
    i.add<GetCategoryUsecase>(
      () => GetCategoryUsecase(i.get<GetCategoryDatasourceInterface>()),
    );
    i.add<CategoryBloc>(() => CategoryBloc(i.get<GetCategoryUsecase>()));
    i.add<GetRecipeDatasourceInterface>(
      () => GetRecipeDatasource(dio: i.get<DioServiceInterface>()),
    );
    i.add<GetRecipeUsecase>(
      () => GetRecipeUsecase(datasource: i.get<GetRecipeDatasourceInterface>()),
    );
    i.add<RecipeBloc>(() => RecipeBloc(i.get<GetRecipeUsecase>()));
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomePage(bloc: Modular.get<CategoryBloc>()),
      transition: TransitionType.leftToRight,
      duration: const Duration(milliseconds: 300),
    );
    r.child(
      '/recipePage',
      child: (context) => RecipesPage(
        categoryModel: r.args.data as CategoryModel,
        bloc: Modular.get<RecipeBloc>(),
      ),
      transition: TransitionType.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }
}
