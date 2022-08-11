import 'package:core_module/core_module.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_recipes_application/src/modules/categories/domain/models/category_model.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase_interface.dart';
import 'package:my_recipes_application/src/modules/categories/external/datasource/get_category_datasource_interface.dart';

class DatasouceMock extends Mock implements GetCategoryDatasourceInterface {}

void main() {
  late GetCategoryDatasourceInterface _datasource;
  late GetCategoryUsecaseInterface _usecase;
  final _categoryMock = CategoryModel(
      idCategory: '01',
      strCategory: 'Seafood',
      strCategoryThumb: 'strCategoryThumb',
      strCategoryDescription: 'Description recipe...');

  setUpAll(() {
    _datasource = DatasouceMock();
    _usecase = GetCategoryUsecase(_datasource);
  });

  group('[Usecase] - Success => ', () {
    test('Should return a list of CategoryModel', () async {
      //arange

      when(() => _datasource()).thenAnswer(
        (_) async => Right(
          <CategoryModel>[_categoryMock],
        ),
      );

      //action
      final result = await _usecase();

      //expected
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
          //arange

          when(() => _datasource()).thenAnswer(
            (_) async => Left(ApplicationError(
              message: 'Error causad by test Usecase',
              stackTrace: StackTrace.current,
            )),
          );

          //action
          final result = await _usecase();

          //expected
          expect(
            result.fold((l) => l.message, (r) => r),
            'Error causad by test Usecase',
          );
        },
      );
    },
  );
}
