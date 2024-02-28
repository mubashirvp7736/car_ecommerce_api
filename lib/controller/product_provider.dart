import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier{

ProductService apiService=ProductService();
List<ProductModel>productList=[];


void getData()async{
try{
  productList=await apiService.getData();
  notifyListeners();
}catch(e){
  rethrow;
}

}
}