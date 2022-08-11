import 'package:dependencies_module/dependencies_module.dart';

import 'modules/home/presenter/pages/home_page.dart';

class ApplicationModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
      ];
}
