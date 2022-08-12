import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:flutter/material.dart';

import 'package:my_recipes_application/src/modules/categories/presenter/store/bloc/category_bloc.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/store/event/category_event.dart';

import '../../../categories/presenter/store/state/category_state.dart';

class HomePage extends StatefulWidget {
  final CategoryBloc bloc;
  const HomePage({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(GetCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CookieColors.yellow,
      appBar: AppBar(
        backgroundColor: CookieColors.orange,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
          ),
        ),
        centerTitle: true,
        title: Text(
          'My Recipes',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                  height: size.height * 0.92,
                  width: size.width * 0.9,
                  child: BlocBuilder<CategoryBloc, CategoryStateInterface>(
                    bloc: widget.bloc,
                    builder: (context, state) {
                      if (state is CategoryInitState) {
                        return const SizedBox.shrink();
                      }
                      if (state is CategoryErrorState) {
                        return const Center(
                          child: Text('Ops...An error has occurred!'),
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
                        padding: EdgeInsets.only(top: size.width * 0.03),
                        itemCount: state.categoryList.length,
                        itemBuilder: (context, index) {
                          final category = state.categoryList.elementAt(index);
                          return CookieCard(
                            onTap: () {
                              Modular.to.navigate(
                                '/recipePage',
                                arguments: category,
                              );
                            },
                            title: Text(
                              category.strCategory,
                            ),
                            leading: Image.network(
                              state.categoryList.elementAt(index).strCategoryThumb,
                              fit: BoxFit.fill,
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
                  )),
            )
          ],
        ),
      ),
    );
  }
}
