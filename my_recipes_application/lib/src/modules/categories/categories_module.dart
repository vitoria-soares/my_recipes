import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/core/contants/routes.dart';
import 'package:my_recipes_application/src/modules/categories/domain/infra_interfaces/categories_repository_interface.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase_impl.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase_interface.dart';
import 'package:my_recipes_application/src/modules/categories/external/datasource/get_category_datasource_impl.dart';
import 'package:my_recipes_application/src/modules/categories/infra/external_interfaces/get_category_datasource_interface.dart';
import 'package:my_recipes_application/src/modules/categories/infra/repositories/categories_repository_impl.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/pages/category_list_page.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/stores/category_list_store.dart';
import 'package:my_recipes_application/src/shared_module.dart';

final class CategoriesModule extends Module {
  @override
  List<Module> get imports {
    return [
      SharedModule(),
    ];
  }

  @override
  void binds(Injector i) {
    i.add<GetCategoryDatasourceInterface>(GetCategoryDatasourceImpl.new);
    i.add<CategoriesRepositoryInterface>(CategoriesRepositoryImpl.new);
    i.add<GetCategoryUsecaseInterface>(GetCategoryUsecaseImpl.new);
    i.add<CategoryListStore>(CategoryListStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Routes.categoriesList,
      child: (context) {
        final store = Modular.get<CategoryListStore>();
        return CategoriesListPage(store: store);
      },
      transition: TransitionType.rightToLeft,
    );
  }
}
