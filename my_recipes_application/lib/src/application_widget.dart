import 'package:dependencies_module/dependencies_module.dart';
import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: CookieColors.yellow,
      ),
    );
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    Modular.setObservers;
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      title: 'My recipes',
      debugShowCheckedModeBanner: false,
      theme: CookieThemes.theme,
    );
  }
}
