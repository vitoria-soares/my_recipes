import 'package:dependencies_module/dependencies_module.dart';
import 'package:flutter/material.dart';
import 'package:my_recipes_application/src/application_module.dart';
import 'package:my_recipes_application/src/application_widget.dart';

void main() async {
  runApp(
    ModularApp(
      module: ApplicationModule(),
      child: const ApplicationWidget(),
    ),
  );
}
