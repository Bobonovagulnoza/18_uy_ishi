import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/categories/data/repositories/categories_repaotories.dart';
import 'package:mvvm/categories/presentation/pages/categories_view.dart';
import 'package:mvvm/categories/presentation/pages/categories_view_model.dart';
import 'package:mvvm/category_detail/presentation/pages/category_detail_view.dart';
import 'package:mvvm/category_detail/presentation/pages/category_detail_view_model.dart';
import 'package:mvvm/core/client.dart';
import 'package:provider/provider.dart';

import 'categories/data/models/category_models.dart';
import 'category_detail/data/repositories/category_detail_repository.dart';

GoRouter router = GoRouter(
  initialLocation: '/categories',
  routes: [
    GoRoute(
      path: '/categories',
      builder: (context, state) => CategoriesView(
        viewModel: CategoriesViewModel(repo: context.read()),
      ),
    ),
    GoRoute(
      path: '/categories/detail',
      builder: (context, state) => CategoryDetailView(
        viewModel: CategoryDetailViewModel(
          catsRepo: context.read(),
          repo: context.read(),
          selected: state.extra as CategoryModel,
        ),
      ),
    ),
  ],
);

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ApiClient()),
        Provider(
          create: (context) => CategoriesRepository(client: context.read()),
        ),
        Provider(create: (context)=>CategoryDetailRepository(client:context.read()),),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
