import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({super.key});

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
    Modular.setInitialRoute('/');
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      title: 'My recipes',
      debugShowCheckedModeBanner: false,
      theme: CookieThemes.theme,
    );
  }
}
