
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/model/product_model.dart';
class ProductService{


Dio dio=Dio();
Future<List<ProductModel>>getData()async{
 const url="http://localhost:5000/api/users/products";
  try {
      final response = await dio.get(url);
      log('URL: $url');

      if (response.statusCode == 200) {
        final jsonData = response.data;
        final List<dynamic> allProducts = jsonData['products'];
        return allProducts
            .map((product) => ProductModel.fromJson(product))
            .toList();
      } else {
        log('Failed to load. Status code: ${response.statusCode}');
        throw Exception('Failed to load');
      }
    } catch (e) {
      log('Error in ApiService: $e');
      rethrow;
    }
  }

}

