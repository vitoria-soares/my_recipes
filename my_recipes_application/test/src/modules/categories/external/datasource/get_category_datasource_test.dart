import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_recipes_application/src/modules/categories/external/datasource/get_category_datasource.dart';
import 'package:my_recipes_application/src/modules/error/datasource_error.dart';

import '../../../../../utils/category_json.dart';

class DioServiceMock extends Mock implements DioServiceInterface {}

void main() {
  final dio = DioServiceMock();
  final datasource = GetCategoryDatasource(dio: dio);

  group(
    '[Datasource] - Success => ',
    () {
      test(
        'Should return a list of CategoryModel',
        () async {
          when(() => dio.get(any())).thenAnswer(
            (_) async => ServiceInformation(
              data: jsonDecode(categoryJsonMock),
              statusCode: 200,
            ),
          );

          final result = await datasource();

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
              data: jsonDecode(categoryJsonMock),
              statusCode: 400,
            ),
          );

          final result = datasource();

          expect(result, throwsA(isA<DatasourceError>()));
        },
      );
    },
  );
}
