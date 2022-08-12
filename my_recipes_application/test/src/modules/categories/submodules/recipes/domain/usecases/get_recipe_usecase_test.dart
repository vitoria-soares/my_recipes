import 'package:core_module/core_module.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/datasource/get_recipe_datasource_interface.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/domain/models/recipe_model.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/domain/usecases/get_recipe_usecase.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/domain/usecases/get_recipe_usecase_interface.dart';

class DatasouceMock extends Mock implements GetRecipeDatasourceInterface {}

void main() {
  late GetRecipeDatasourceInterface _datasource;
  late GetRecipeUsecaseInterface _usecase;
  final _recipesMock = RecipeModel(
    strMeal: 'Baked salmon with fennel & tomatoes',
    strMealThumb: 'https://www.themealdb.com/images/media/meals/1548772327.jpg',
    idMeal: '52959',
  );
  const String category = 'Seafood';

  setUpAll(() {
    _datasource = DatasouceMock();
    _usecase = GetRecipeUsecase(datasource: _datasource);
  });

  group(
    '[Usecase] - Success => ',
    () {
      test(
        'Should return a list of RecipeModel',
        () async {
          //arange

          when(() => _datasource(category)).thenAnswer(
            (_) async => Right(
              <RecipeModel>[_recipesMock],
            ),
          );

          //action
          final result = await _usecase(category);

          //expected
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
          //arange

          when(() => _datasource(category)).thenAnswer(
            (_) async => Left(
              ApplicationError(
                message: 'Error causad by test Usecase',
                stackTrace: StackTrace.current,
              ),
            ),
          );

          //action
          final result = await _usecase(category);

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
