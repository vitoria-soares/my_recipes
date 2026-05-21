import 'package:core_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_recipes_application/src/modules/categories/domain/entities/category_entity.dart';
import 'package:my_recipes_application/src/modules/categories/domain/infra_interfaces/categories_repository_interface.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase_impl.dart';
import 'package:my_recipes_application/src/modules/categories/domain/usecases/get_category_usecase_interface.dart';

class RepositoryMock extends Mock implements CategoriesRepositoryInterface {}

void main() {
  late CategoriesRepositoryInterface repository;
  late GetCategoryUsecaseInterface usecase;

  const categoryMock = CategoryEntity(
    idCategory: '1',
    strCategory: 'Beef',
    strCategoryThumb: 'https://www.themealdb.com/images/category/beef.png',
    strCategoryDescription: 'Description',
  );

  setUp(() {
    repository = RepositoryMock();
    usecase = GetCategoryUsecaseImpl(repository);
  });

  group('[Usecase] - Success => ', () {
    test('Should return a list of CategoryEntity', () async {
      //Arrange
      when(() => repository.list()).thenAnswer(
        (_) async => const Right(<CategoryEntity>[
          categoryMock
        ]),
      );

      //Act
      final result = await usecase.list();

      //Assert/Expect
      expect(
        result.fold((l) => l, (r) => r.first.idCategory),
        '1',
      );
    });
  });

  group(
    '[Usecase] - Error => ',
    () {
      test(
        'Should return Error',
        () async {
          //Arrange
          when(() => repository.list()).thenAnswer(
            (_) async => Left(
              ApplicationError(
                message: 'Error caused by test Usecase',
                stackTrace: StackTrace.current,
              ),
            ),
          );

          //Act
          final result = await usecase.list();

          //Assert/Expect
          expect(
            result.fold((l) => l.message, (r) => r),
            'Error caused by test Usecase',
          );
        },
      );
    },
  );
}
