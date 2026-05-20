import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/entities/recipe_entity.dart';
import 'package:my_recipes_application/src/modules/recipes/external/datasource/get_recipe_datasource_impl.dart';

import '../../../../../utils/recipe_json.dart';

class DioServiceMock extends Mock implements HttpServiceInterface {}

void main() {
  late HttpServiceInterface dio;
  late GetRecipeDatasourceImpl datasource;
  const category = 'Seafood';

  setUp(() {
    dio = DioServiceMock();
    datasource = GetRecipeDatasourceImpl(dio: dio);
  });

  group(
    '[Datasource] - Success => ',
    () {
      test(
        'Should return a list of RecipeEntity',
        () async {
          when(
            () => dio.request(
              any(),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).thenAnswer(
            (_) async => ServiceInformation(
              data: jsonDecode(recipeJsonMock),
              statusCode: 200,
            ),
          );

          final result = await datasource.list(category);

          expect(result, isA<List<RecipeEntity>>());
          expect(result.isNotEmpty, true);
          expect(result.first.idMeal, '52959');
        },
      );
    },
  );

  group(
    '[Datasource] - Error => ',
    () {
      test(
        'Should throw DatasourceError when request fails',
        () async {
          when(
            () => dio.request(
              any(),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).thenThrow(
            DatasourceError(
              message: 'Request failed',
              stackTrace: StackTrace.current,
            ),
          );

          expect(
            () => datasource.list(category),
            throwsA(isA<DatasourceError>()),
          );
        },
      );
    },
  );
}
