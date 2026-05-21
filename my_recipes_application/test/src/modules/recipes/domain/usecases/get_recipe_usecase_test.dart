import 'package:core_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/entities/recipe_entity.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/infra_interfaces/recipe_repository_interface.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/usecases/get_recipe_usecase_impl.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/usecases/get_recipe_usecase_interface.dart';

class RepositoryMock extends Mock implements RecipeRepositoryInterface {}

void main() {
  late RecipeRepositoryInterface repository;
  late GetRecipeUsecaseInterface usecase;

  const recipeMock = RecipeEntity(
    strMeal: 'Baked salmon with fennel & tomatoes',
    strMealThumb: 'https://www.themealdb.com/images/media/meals/1548772327.jpg',
    idMeal: '52959',
  );
  const category = 'Seafood';

  setUp(() {
    repository = RepositoryMock();
    usecase = GetRecipeUsecaseImpl(repository: repository);
  });

  group(
    '[Usecase] - Success => ',
    () {
      test(
        'Should return a list of RecipeEntity',
        () async {
          //Arrange
          when(() => repository.list(category)).thenAnswer(
            (_) async => const Right(<RecipeEntity>[
              recipeMock
            ]),
          );

          //Act
          final result = await usecase.list(category);

          //Assert/Expect
          expect(
            result.fold((l) => l, (r) => r.first.idMeal),
            '52959',
          );
        },
      );
    },
  );

  group(
    '[Usecase] - Error => ',
    () {
      test(
        'Should return ApplicationError',
        () async {
          //Arrange
          when(() => repository.list(category)).thenAnswer(
            (_) async => Left(
              ApplicationError(
                message: 'Error caused by test Usecase',
                stackTrace: StackTrace.current,
              ),
            ),
          );

          final result = await usecase.list(category);

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
