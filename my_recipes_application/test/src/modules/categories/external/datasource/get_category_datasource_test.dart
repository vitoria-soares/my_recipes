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
          // Arrange
          when(() => dio.request(any())).thenAnswer(
            (_) async => ServiceInformation(
              data: jsonDecode(categoryJsonMock),
              statusCode: 200,
            ),
          );
          // Act
          final result = await datasource.list();

          // Assert/Expect
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
          //Arrange
          when(() => dio.request(any())).thenThrow(
            DatasourceError(
              message: 'Request failed',
              stackTrace: StackTrace.current,
            ),
          );

          //Act
          final result = datasource.list();

          //Assert/Expect
          expect(
            () => result,
            throwsA(isA<DatasourceError>()),
          );
        },
      );
    },
  );
}
