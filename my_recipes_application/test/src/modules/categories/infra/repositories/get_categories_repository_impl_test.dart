import 'package:core_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_recipes_application/src/modules/categories/domain/entities/category_entity.dart';
import 'package:my_recipes_application/src/modules/categories/domain/infra_interfaces/categories_repository_interface.dart';
import 'package:my_recipes_application/src/modules/categories/infra/external_interfaces/get_category_datasource_interface.dart';
import 'package:my_recipes_application/src/modules/categories/infra/repositories/categories_repository_impl.dart';

class DatasourceMock extends Mock implements GetCategoryDatasourceInterface {}

void main() {
  late GetCategoryDatasourceInterface datasource;
  late CategoriesRepositoryInterface repository;

  const categoryMock = CategoryEntity(
    idCategory: '1',
    strCategory: 'Beef',
    strCategoryThumb: 'https://www.themealdb.com/images/category/beef.png',
    strCategoryDescription: 'Beef is the culinary name for meat from cattle.',
  );

  setUp(() {
    datasource = DatasourceMock();
    repository = CategoriesRepositoryImpl(datasource);
  });

  group(
    '[Repository] - Success => ',
    () {
      test(
        'Should return Right with a list of CategoryEntity',
        () async {
          when(() => datasource.list()).thenAnswer(
            (_) async => const <CategoryEntity>[
              categoryMock
            ],
          );

          final result = await repository.list();

          expect(result.isRight(), true);
          expect(
            result.fold((l) => l, (r) => r.first.idCategory),
            '1',
          );
        },
      );
    },
  );

  group(
    '[Repository] - ApplicationError => ',
    () {
      test(
        'Should return Left with ApplicationError when datasource throws ApplicationError',
        () async {
          when(() => datasource.list()).thenThrow(
            ApplicationError(
              message: 'Datasource ApplicationError',
              stackTrace: StackTrace.current,
            ),
          );

          final result = await repository.list();

          expect(result.isLeft(), true);
          expect(
            result.fold((l) => l.message, (r) => r),
            'Datasource ApplicationError',
          );
        },
      );
    },
  );

  group(
    '[Repository] - Generic Error => ',
    () {
      test(
        'Should return Left with ApplicationError when datasource throws a generic exception',
        () async {
          when(() => datasource.list()).thenThrow(
            Exception('Unexpected error'),
          );

          final result = await repository.list();

          expect(result.isLeft(), true);
          expect(
            result.fold((l) => l.message, (r) => r),
            contains('Unhandled error fetching categories'),
          );
        },
      );
    },
  );
}
