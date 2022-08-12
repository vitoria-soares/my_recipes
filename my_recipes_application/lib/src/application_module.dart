import 'package:core_module/core_module.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase.dart';
import 'package:my_recipes_application/src/modules/categories/external/datasource/get_category_datasource.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/store/bloc/category_bloc.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/presenter/pages/recipes_page.dart';

import 'modules/categories/submodules/recipes/datasource/get_recipe_datasource.dart';
import 'modules/categories/submodules/recipes/domain/usecases/get_recipe_usecase.dart';
import 'modules/categories/submodules/recipes/presenter/store/bloc/recipe_bloc.dart';
import 'modules/home/presenter/pages/home_page.dart';

class ApplicationModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => GetCategoryUsecase(i())),
        Bind((i) => GetCategoryDatasource(dio: i())),
        Bind((i) => DioService()),
        Bind((i) => CategoryBloc(i())),
        Bind((i) => GetRecipeUsecase(datasource: i())),
        Bind((i) => GetRecipeDatasource(dio: i())),
        Bind((i) => RecipeBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => HomePage(
            bloc: context.read(),
          ),
          transition: TransitionType.leftToRight,
          duration: const Duration(
            milliseconds: 300,
          ),
        ),
        ChildRoute(
          '/recipePage',
          child: (context, args) => RecipesPage(
            categoryModel: args.data,
            bloc: context.read(),
          ),
          transition: TransitionType.rightToLeft,
          duration: const Duration(
            milliseconds: 300,
          ),
        )
      ];
}
