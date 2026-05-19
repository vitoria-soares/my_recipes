import 'package:core_module/core_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/datasource/get_recipe_datasource_interface.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/domain/models/recipe_model.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/domain/usecases/get_recipe_usecase.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/domain/usecases/get_recipe_usecase_interface.dart';

class DatasourceMock extends Mock implements GetRecipeDatasourceInterface {}

void main() {
  late GetRecipeDatasourceInterface datasource;
  late GetRecipeUsecaseInterface usecase;
  final recipesMock = RecipeModel(
    strMeal: 'Baked salmon with fennel & tomatoes',
    strMealThumb: 'https://www.themealdb.com/images/media/meals/1548772327.jpg',
    idMeal: '52959',
  );
  const category = 'Seafood';

  setUpAll(() {
    datasource = DatasourceMock();
    usecase = GetRecipeUsecase(datasource: datasource);
  });

  group(
    '[Usecase] - Success => ',
    () {
      test(
        'Should return a list of RecipeModel',
        () async {
          when(() => datasource(category)).thenAnswer(
            (_) async => Right(
              <RecipeModel>[recipesMock],
            ),
          );

          final result = await usecase(category);

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
        'Should return Error',
        () async {
          when(() => datasource(category)).thenAnswer(
            (_) async => Left(
              ApplicationError(
                message: 'Error causad by test Usecase',
                stackTrace: StackTrace.current,
              ),
            ),
          );

          final result = await usecase(category);

          expect(
            result.fold((l) => l.message, (r) => r),
            'Error causad by test Usecase',
          );
        },
      );
    },
  );
}
