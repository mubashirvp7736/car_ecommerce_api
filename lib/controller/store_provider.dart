import 'package:ecommerce/service/store_services.dart';
import 'package:flutter/material.dart';

class StoreProvider extends ChangeNotifier {
  StoreService store = StoreService();

  Future<dynamic> getValues(key) async {
    return store.getValues(key);
  }

  void clearValues() async {
    await store.clearValues();
    notifyListeners();
  }
}