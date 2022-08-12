import '../../../domain/models/recipe_model.dart';

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
