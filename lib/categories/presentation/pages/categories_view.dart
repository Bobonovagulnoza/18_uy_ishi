import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'categories_view_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
    required this.viewModel,
  });

  final CategoriesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, widget) {
          return ListView.builder(
            itemCount: viewModel.categories.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => context.go('/categories/detail',
                  extra: viewModel.categories[index]),
              child: Image(
                image: NetworkImage(viewModel.categories[index].image),
              ),
            ),
          );
        },
      ),
    );
  }
}
