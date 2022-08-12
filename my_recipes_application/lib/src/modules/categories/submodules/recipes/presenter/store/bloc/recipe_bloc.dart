import 'package:dependencies_module/dependencies_module.dart';

import '../../../domain/usecases/get_recipe_usecase.dart';
import '../event/recipe_event.dart';
import '../state/recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEventInterface, RecipeStateInterface> {
  final GetRecipeUsecase usecase;
  RecipeBloc(
    this.usecase,
  ) : super(RecipeInitState()) {
    on<GetRecipeEvent>(_onGetRecipe);
  }

  Future<void> _onGetRecipe(GetRecipeEvent event, Emitter<RecipeStateInterface> emitter) async {
    emitter(RecipeLoadingState());

    var result = await usecase(event.category);
    result.fold(
      (l) => emitter(
        RecipeErrorState(message: l.message),
      ),
      (r) => emitter(
        RecipeSuccessState(recipeList: r),
      ),
    );
  }
}
