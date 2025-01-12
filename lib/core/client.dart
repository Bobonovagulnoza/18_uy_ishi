import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'http://13.232.186.30:8888/api/v1'

    ),
  );

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');
    List<dynamic> data = response.data;
    return data;
  }
  Future<List<dynamic>> fetchRecipes(int categoryId) async{
    var rerponse = await dio.get('/recipes/list?Category=$categoryId');
    List<dynamic> data =rerponse.data;
    return data;
  }
}
