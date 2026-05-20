import 'package:core_module/core_module.dart';
import 'package:my_recipes_application/src/modules/recipes/domain/usecases/get_recipe_usecase_interface.dart';
import 'package:my_recipes_application/src/modules/recipes/presenter/models/recipe_model.dart';

class RecipeListStore extends Bloc<RecipeEventInterface, RecipeStateInterface> {
  final GetRecipeUsecaseInterface usecase;
  RecipeListStore(
    this.usecase,
  ) : super(RecipeInitState()) {
    on<GetRecipeEvent>(_onGetRecipe);
  }

  Future<void> _onGetRecipe(GetRecipeEvent event, Emitter<RecipeStateInterface> emitter) async {
    emitter(RecipeLoadingState());

    final result = await usecase.list(event.category);

    result.fold(
      (error) => emitter(
        RecipeErrorState(message: error.message),
      ),
      (recipeEntities) => emitter(
        RecipeSuccessState(
            recipeList: recipeEntities.map((e) {
          return RecipeModel.fromEntity(e);
        }).toList()),
      ),
    );
  }
}

abstract class RecipeEventInterface {}

class GetRecipeEvent extends RecipeEventInterface {
  final String category;
  GetRecipeEvent({
    required this.category,
  });
}

abstract class RecipeStateInterface {}

class RecipeInitState extends RecipeStateInterface {}

class RecipeLoadingState extends RecipeStateInterface {}

class RecipeSuccessState extends RecipeStateInterface {
  final List<RecipeModel> recipeList;
  RecipeSuccessState({
    required this.recipeList,
  });
}

class RecipeErrorState extends RecipeStateInterface {
  final String message;
  RecipeErrorState({
    required this.message,
  });
}
