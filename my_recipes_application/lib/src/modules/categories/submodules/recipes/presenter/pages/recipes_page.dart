import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:flutter/material.dart';

import 'package:my_recipes_application/src/modules/categories/domain/models/category_model.dart';
import 'package:my_recipes_application/src/modules/categories/submodules/recipes/presenter/store/event/recipe_event.dart';

import '../store/bloc/recipe_bloc.dart';
import '../store/state/recipe_state.dart';

class RecipesPage extends StatefulWidget {
  final CategoryModel categoryModel;
  final RecipeBloc bloc;
  const RecipesPage({
    Key? key,
    required this.categoryModel,
    required this.bloc,
  }) : super(key: key);

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(
      GetRecipeEvent(
        category: widget.categoryModel.strCategory,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CookieColors.yellow,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Modular.to.navigate('/'),
        ),
        centerTitle: true,
        title: Text(
          widget.categoryModel.strCategory,
        ),
      ),
      backgroundColor: CookieColors.yellow,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: size.width * 0.03),
                height: size.height * 0.92,
                width: size.width * 0.9,
                child: BlocBuilder<RecipeBloc, RecipeStateInterface>(
                  bloc: widget.bloc,
                  builder: (context, state) {
                    if (state is RecipeInitState) {
                      return const SizedBox.shrink();
                    }
                    if (state is RecipeErrorState) {
                      return const Center(
                        child: Text('Ops...An error has occurred!'),
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
                          onTap: () {
                            Modular.to.navigate(
                              '/recipePage',
                              arguments: widget.bloc,
                            );
                          },
                          title: Text(
                            recipe.strMeal,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          leading: Image.network(
                            recipe.strMealThumb,
                            fit: BoxFit.fitWidth,
                            errorBuilder: (context, object, stackTrace) {
                              return const ImageNotFound();
                            },
                            loadingBuilder: (context, widget, event) {
                              if (event == null) {
                                return widget;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: CookieColors.yellow,
                                    value: event.cumulativeBytesLoaded /
                                        (event.expectedTotalBytes ?? 1),
                                  ),
                                );
                              }
                            },
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
