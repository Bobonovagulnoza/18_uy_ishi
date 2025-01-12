import 'package:flutter/cupertino.dart';
import 'package:mvvm/categories/data/models/category_models.dart';

import '../../data/repositories/categories_repaotories.dart';

class CategoriesViewModel extends ChangeNotifier{
  CategoriesViewModel({required CategoriesRepository repo}):_repo=repo{
    load();
  }

  final CategoriesRepository _repo;

  List<CategoryModel> categories=[];
  Future<void> load()async{
    categories = await _repo.fetchCategories();

    notifyListeners();
  }
}