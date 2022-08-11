import 'package:dependencies_module/dependencies_module.dart';
import 'package:my_recipes_application/src/modules/home/home_module.dart';

class ApplicationModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [ModuleRoute('/home', module: HomeModule())];
}
