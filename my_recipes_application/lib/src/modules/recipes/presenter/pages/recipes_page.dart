import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

import '../store/recipe_list_store.dart';

class RecipesPage extends StatefulWidget {
  final String categoryId;
  final RecipeListStore store;
  const RecipesPage({
    super.key,
    required this.categoryId,
    required this.store,
  });

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  void initState() {
    super.initState();
    widget.store.add(
      GetRecipeEvent(category: widget.categoryId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CookieAppBar(
        backgroundColor: CookieColors.yellow,
        title: widget.categoryId,
        leading: CookieBackButton(
          onPressed: () => Modular.to.pop(),
        ),
      ),
      backgroundColor: CookieColors.yellow,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(
                  top: size.width * 0.03,
                ),
                height: size.height * 0.92,
                width: size.width * 0.9,
                child: BlocBuilder<RecipeListStore, RecipeStateInterface>(
                  bloc: widget.store,
                  builder: (context, state) {
                    if (state is RecipeInitState) {
                      return const SizedBox.shrink();
                    }
                    if (state is RecipeErrorState) {
                      return Center(
                        child: Column(
                          children: [
                            ImageNotFound(),
                            Text(
                              'Ops...An error has occurred!',
                              style: TextStyle(
                                fontSize: CookieFontSizes.sm,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    if (state is RecipeLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: CookieColors.orange,
                        ),
                      );
                    }
                    state as RecipeSuccessState;
                    return ListView.builder(
                      itemCount: state.recipeList.length,
                      itemBuilder: (context, index) {
                        final recipe = state.recipeList.elementAt(index);
                        return CookieCardRecipes(
                          title: Text(
                            recipe.strMeal,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          leading: CookieNetworkImage(
                            imageUrl: recipe.strMealThumb,
                            fit: BoxFit.fitWidth,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
