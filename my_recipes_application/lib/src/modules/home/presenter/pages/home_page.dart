import 'package:cookie_design_system/cookie_design_system.dart';
import 'package:dependencies_module/dependencies_module.dart';
import 'package:flutter/material.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/store/bloc/category_bloc.dart';
import 'package:my_recipes_application/src/modules/categories/presenter/store/event/category_event.dart';

import '../../../categories/presenter/store/state/category_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = Modular.get<CategoryBloc>();
  @override
  void initState() {
    super.initState();
    _bloc.add(GetCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Recipes',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                  padding: EdgeInsets.only(top: size.width * 0.03),
                  height: size.height * 0.92,
                  width: size.width * 0.9,
                  child: BlocBuilder<CategoryBloc, CategoryStateInterface>(
                    bloc: _bloc,
                    builder: (context, state) {
                      if (state is CategoryInitState) {
                        return Container();
                      }
                      if (state is CategoryLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CategoryErrorState) {
                        return const Center(
                          child: Text('Ops...An error has occurred!'),
                        );
                      }
                      state as CategorySuccessState;
                      return ListView.builder(
                        itemCount: state.categoryList.length,
                        itemBuilder: (context, index) {
                          return CookieCard(
                            onTap: () {},
                            title: Text(
                              state.categoryList.elementAt(index).strCategory,
                            ),
                            leading: Image.network(
                              state.categoryList.elementAt(index).strCategoryThumb,
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
