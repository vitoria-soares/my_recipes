import 'package:core_module/core_module.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase.dart';
import 'package:my_recipes_application/src/modules/categories/external/datasource/get_category_datasource.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/store/bloc/category_bloc.dart';

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
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
      ];
}
