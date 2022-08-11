import 'package:dependencies_module/dependencies_module.dart';
import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:flutter/material.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setObservers;
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'Minhas Receitas',
      debugShowCheckedModeBanner: false,
      theme: CookieThemes.theme,
    );
  }
}
