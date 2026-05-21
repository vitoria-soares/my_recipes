import 'package:core_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/entities/recipe_entity.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/infra_interfaces/recipe_repository_interface.dart';
import 'package:my_recipes_application/src/modules/recipes/infra/external_interfaces/get_recipe_datasource_interface.dart';
import 'package:my_recipes_application/src/modules/recipes/infra/repositories/recipe_repository_impl.dart';

class DatasourceMock extends Mock implements GetRecipeDatasourceInterface {}

void main() {
  late GetRecipeDatasourceInterface datasource;
  late RecipeRepositoryInterface repository;

  const recipeMock = RecipeEntity(
    strMeal: 'Baked salmon with fennel & tomatoes',
    strMealThumb: 'https://www.themealdb.com/images/media/meals/1548772327.jpg',
    idMeal: '52959',
  );
  const category = 'Seafood';

  setUp(() {
    datasource = DatasourceMock();
    repository = RecipeRepositoryImpl(datasource);
  });

  group(
    '[Repository] - Success => ',
    () {
      test(
        'Should return Right with a list of RecipeEntity',
        () async {
          //Arrange
          when(() => datasource.list(category)).thenAnswer(
            (_) async => const <RecipeEntity>[
              recipeMock
            ],
          );

          //Act
          final result = await repository.list(category);

          //Assert/Expect
          expect(result.isRight(), true);
          expect(
            result.fold((l) => l, (r) => r.first.idMeal),
            '52959',
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
          // Arrange
          when(() => datasource.list(category)).thenThrow(
            ApplicationError(
              message: 'Datasource ApplicationError',
              stackTrace: StackTrace.current,
            ),
          );

          // Act
          final result = await repository.list(category);

          // Assert/Expect
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
          // Arrange
          when(() => datasource.list(category)).thenThrow(
            Exception('Unexpected error'),
          );

          // Act
          final result = await repository.list(category);

          // Assert/Expect
          expect(result.isLeft(), true);
          expect(
            result.fold((l) => l.message, (r) => r),
            contains('Unhandled error fetching recipes'),
          );
        },
      );
    },
  );
}
