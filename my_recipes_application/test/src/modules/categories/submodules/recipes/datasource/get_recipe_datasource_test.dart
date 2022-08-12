import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/datasource/get_recipe_datasource.dart';
import 'package:my_recipes_application/src/modules/error/datasource_error.dart';

import '../../../../../../utils/recipe_json.dart';

class DioServiceMock extends Mock implements DioServiceInterface {}

void main() {
  final _dio = DioServiceMock();
  final _datasource = GetRecipeDatasource(dio: _dio);
  const String _category = 'Seafood';

  group(
    '[Datasource] - Success => ',
    () {
      test(
        'Should return a list of RecipeModel',
        () async {
          //arange
          when(() => _dio.get(any())).thenAnswer(
            (_) async => ServiceInformation(data: jsonDecode(recipeJsonMock), statusCode: 200),
          );

          //action
          final result = await _datasource(_category);

          //expect
          expect(result.isRight(), true);
        },
      );
    },
  );

  group(
    '[Datasource] - Error => ',
    () {
      test(
        'Should return Error 400',
        () async {
          //arange
          when(() => _dio.get(any())).thenAnswer(
            (_) async => ServiceInformation(data: jsonDecode(recipeJsonMock), statusCode: 400),
          );

          //action
          final result = _datasource(_category);

          //expect
          expect(result, throwsA(isA<DatasourceError>()));
        },
      );
    },
  );
}
