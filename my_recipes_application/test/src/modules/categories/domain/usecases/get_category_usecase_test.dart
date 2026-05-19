import 'package:core_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_recipes_application/src/modules/categories/domain/models/category_model.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase_interface.dart';
import 'package:my_recipes_application/src/modules/categories/external/datasource/get_category_datasource_interface.dart';

class DatasourceMock extends Mock implements GetCategoryDatasourceInterface {}

void main() {
  late GetCategoryDatasourceInterface datasource;
  late GetCategoryUsecaseInterface usecase;
  final categoryMock = CategoryModel(
    idCategory: '01',
    strCategory: 'Seafood',
    strCategoryThumb: 'strCategoryThumb',
    strCategoryDescription: 'Description recipe...',
  );

  setUpAll(() {
    datasource = DatasourceMock();
    usecase = GetCategoryUsecase(datasource);
  });

  group('[Usecase] - Success => ', () {
    test('Should return a list of CategoryModel', () async {
      when(() => datasource()).thenAnswer(
        (_) async => Right(
          <CategoryModel>[categoryMock],
        ),
      );

      final result = await usecase();

      expect(
        result.fold((l) => l, (r) => r.first.idCategory),
        '01',
      );
    });
  });

  group(
    '[Usecase] - Error => ',
    () {
      test(
        'Should return Error',
        () async {
          when(() => datasource()).thenAnswer(
            (_) async => Left(
              ApplicationError(
                message: 'Error causad by test Usecase',
                stackTrace: StackTrace.current,
              ),
            ),
          );

          final result = await usecase();

          expect(
            result.fold((l) => l.message, (r) => r),
            'Error causad by test Usecase',
          );
        },
      );
    },
  );
}
