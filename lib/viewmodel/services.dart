import 'package:application_programming_interface/model/recipesdetail.dart';
import 'package:dio/dio.dart';
import '../model/recipes_model.dart';

Future<Recipes> getRecipes() async {
  Response response = await Dio()
      .get('https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood');
  String data = response.toString();
  return recipesFromJson(data);
}

Future<RecipeDetail> getRecipeDetail(String id) async {
  Response response = await Dio()
      .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
  String data = response.toString();
  return recipeDetailFromJson(data);
}
