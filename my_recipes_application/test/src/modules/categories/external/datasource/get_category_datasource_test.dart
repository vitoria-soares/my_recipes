import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_recipes_application/src/modules/categories/external/datasource/get_category_datasource.dart';
import 'package:my_recipes_application/src/modules/categories/external/error/datasource_error.dart';

import '../../../../../utils/category_json.dart';

class DioServiceMock extends Mock implements DioServiceInterface {}

void main() {
  final _dio = DioServiceMock();
  final _datasource = GetCategoryDatasource(dio: _dio);

  group(
    '[Datasource] - Success => ',
    () {
      test(
        'Should return a list of CategoryModel',
        () async {
          //arange
          when(() => _dio.get(any())).thenAnswer(
            (_) async => ServiceInformation(data: jsonDecode(categoryJsonMock), statusCode: 200),
          );

          //action
          final result = await _datasource();

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
            (_) async => ServiceInformation(data: jsonDecode(categoryJsonMock), statusCode: 400),
          );

          //action
          final result = _datasource();

          //expect
          expect(result, throwsA(isA<DatasourceError>()));
        },
      );
    },
  );
}
