import 'dart:convert';

import 'package:core_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_recipes_application/src/modules/categories/domain/entities/category_entity.dart';
import 'package:my_recipes_application/src/modules/categories/external/datasource/get_category_datasource_impl.dart';

import '../../../../../utils/category_json.dart';

class DioServiceMock extends Mock implements HttpServiceInterface {}

void main() {
  late HttpServiceInterface dio;
  late GetCategoryDatasourceImpl datasource;

  setUp(() {
    dio = DioServiceMock();
    datasource = GetCategoryDatasourceImpl(dio: dio);
  });

  group(
    '[Datasource] - Success => ',
    () {
      test(
        'Should return a list of CategoryEntity',
        () async {
          when(() => dio.request(any())).thenAnswer(
            (_) async => ServiceInformation(
              data: jsonDecode(categoryJsonMock),
              statusCode: 200,
            ),
          );

          final result = await datasource.list();

          expect(result, isA<List<CategoryEntity>>());
          expect(result.isNotEmpty, true);
          expect(result.first.idCategory, '1');
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
          when(() => dio.request(any())).thenThrow(
            DatasourceError(
              message: 'Request failed',
              stackTrace: StackTrace.current,
            ),
          );

          expect(
            () => datasource.list(),
            throwsA(isA<DatasourceError>()),
          );
        },
      );
    },
  );
}
