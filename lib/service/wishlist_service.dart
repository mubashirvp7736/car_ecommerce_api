import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/model/wishlist_model.dart';

class WishListService{

Dio dio =Dio();
String? WishListStatuscode;
addToWishList(WishListModel productId,String userId,String token)async{
  final url='http://localhost:5000/api/users/$userId/wishlist';
  
    try {
      Response response = await dio.post(
        url,
        data: productId.toJson(token)['data'],
        options: Options(
          headers: productId.toJson(token)['headers'],
        ),
      );

      if (response.statusCode == 200) {
        WishListStatuscode = '200';
        log('Product added to WishList');
      } else if (response.statusCode == 500) {
        log('Unsuccessful. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
      }
    } catch (e) {
      log('ErrorFromToWishList: $e');
      WishListStatuscode = '500';
    }
  }
  getWishListProduct(WishListModel product,String userId,String token)async{
   // String userId="65dd85e7b0b7938a1d07190b";
    final url='http://localhost:5000/api/users/$userId/wishlist';
    
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: product.toJson(token)['headers'],
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> productId = response.data['data'] as List;

        return productId;
      } else {
        log('Unsuccessful. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
        throw Exception('Failed to fetch wishlist');
      }
    } catch (e) {
      rethrow;
    }
  }

  deleteFromWishList(String productId,String userId,String token)async{}

}


