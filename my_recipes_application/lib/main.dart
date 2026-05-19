import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:my_recipes_application/src/application_module.dart';
import 'package:my_recipes_application/src/application_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: ApplicationModule(),
      child: const ApplicationWidget(),
    ),
  );
}
