import 'package:ecommerce_app/service/sharedprf/shrdprf.dart';
import 'package:flutter/material.dart';

class StoreProvider extends ChangeNotifier {
  StoreService store = StoreService();
  setKeys(key, tokenId) async {
    await store.setKeys(key, tokenId);
    notifyListeners();
  }

  getValues(key) async {
    return store.getValues(key);
  }

  clearValues() async {
    await store.clearValues();
    notifyListeners();
  }
}
