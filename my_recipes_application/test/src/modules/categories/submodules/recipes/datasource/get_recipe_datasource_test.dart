import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/datasource/get_recipe_datasource.dart';
import 'package:my_recipes_application/src/modules/error/datasource_error.dart';

import '../../../../../../utils/recipe_json.dart';

class DioServiceMock extends Mock implements DioServiceInterface {}

void main() {
  final dio = DioServiceMock();
  final datasource = GetRecipeDatasource(dio: dio);
  const category = 'Seafood';

  group(
    '[Datasource] - Success => ',
    () {
      test(
        'Should return a list of RecipeModel',
        () async {
          when(() => dio.get(any())).thenAnswer(
            (_) async => ServiceInformation(
              data: jsonDecode(recipeJsonMock),
              statusCode: 200,
            ),
          );

          final result = await datasource(category);

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
          when(() => dio.get(any())).thenAnswer(
            (_) async => ServiceInformation(
              data: jsonDecode(recipeJsonMock),
              statusCode: 400,
            ),
          );

          final result = datasource(category);

          expect(result, throwsA(isA<DatasourceError>()));
        },
      );
    },
  );
}
