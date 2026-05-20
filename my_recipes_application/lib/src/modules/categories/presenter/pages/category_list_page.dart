import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:my_recipes_application/src/core/contants/routes.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/stores/category_list_store.dart';

class CategoriesListPage extends StatefulWidget {
  final CategoryListStore store;
  const CategoriesListPage({
    super.key,
    required this.store,
  });

  @override
  State<CategoriesListPage> createState() => _CategoriesListPageState();
}

class _CategoriesListPageState extends State<CategoriesListPage> {
  @override
  void initState() {
    super.initState();
    widget.store.add(GetCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CookieColors.yellow,
      appBar: CookieAppBar(
        title: 'My Recipes',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: size.height * 0.92,
                width: size.width * 0.9,
                child: BlocBuilder<CategoryListStore, CategoryStateInterface>(
                  bloc: widget.store,
                  builder: (context, state) {
                    if (state is CategoryInitState) {
                      return const SizedBox.shrink();
                    }
                    if (state is CategoryErrorState) {
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
                    if (state is CategoryLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: CookieColors.orange,
                        ),
                      );
                    }
                    state as CategorySuccessState;
                    return ListView.builder(
                      padding: EdgeInsets.only(
                        top: size.width * 0.03,
                        bottom: CookieSpacing.xl,
                      ),
                      itemCount: state.categoryList.length,
                      itemBuilder: (context, index) {
                        final category = state.categoryList.elementAt(index);
                        return CookieCard(
                          onTap: () {
                            Modular.to.pushNamed(
                              Routes.recipesList,
                              arguments: {
                                'categoryId': category.strCategory,
                              },
                            );
                          },
                          title: Text(
                            category.strCategory,
                          ),
                          leading: CookieNetworkImage(
                            imageUrl: state.categoryList.elementAt(index).strCategoryThumb,
                            fit: BoxFit.fill,
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
