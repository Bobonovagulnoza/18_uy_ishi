import '../../../core/client.dart';
import '../models/recipe_model_small.dart';

class CategoryDetailRepository {
  CategoryDetailRepository({required this.client});

  final ApiClient client;

  List<RecipeModelSmall> recipes = [];

  Future<List<RecipeModelSmall>> fetchRecipes(int categoryId) async {
    var rawRecipes = await client.fetchRecipes(categoryId);
    recipes =
        rawRecipes.map((recipe) => RecipeModelSmall.fromJson(recipe)).toList();
    return recipes;
  }
}
