import 'package:dio/dio.dart';

import '../Models/category_model.dart';
import '../Models/product_model.dart';


class ApiProvider {
  final Dio _dio = Dio();
  late ProductsModel productsFromApi;

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await _dio.get('https://dummyjson.com/products/categories');

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }

  Future<ProductsModel> getAllProducts() async {
    final Response response = await Dio().get(
      "https://dummyjson.com/products",
      queryParameters: {
        "select": "id,title,description,category,price,thumbnail",
      },
    );

    if (response.statusCode == 200) {
      productsFromApi = ProductsModel.fromJson(response.data);

      return productsFromApi;
    } else {
      throw Exception("Failed to load products");
    }
  }

  Future<ProductsModel> getProductsByCategory(String categoryName) async {
    final response = await _dio.get('https://dummyjson.com/products/category/$categoryName');
    return ProductsModel.fromJson(response.data);
  }

}
