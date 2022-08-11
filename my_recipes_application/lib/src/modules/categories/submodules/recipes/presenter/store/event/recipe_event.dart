abstract class RecipeEventInterface {}

class GetRecipeEvent extends RecipeEventInterface {
  final String category;
  GetRecipeEvent({
    required this.category,
  });
}
