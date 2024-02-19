import 'dart:developer';

import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/service/database_service.dart';

class DatabaseProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final DatabaseService databaseService = DatabaseService();
  final WidgetProviders widgetProviders = WidgetProviders();
  List<ProductModel> allProduct = [];
  String downloadURL = '';
  String imageName = DateTime.now().millisecondsSinceEpoch.toString();

  addProduct(ProductModel data) async {
    await databaseService.addProduct(data);
    clearControllers();
    getAllProducts();
  }

  IsWishLIstClick(id, bool wishListStatus) async {
    await databaseService.IsWishListClick(id, wishListStatus);
    notifyListeners();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    allProduct = await databaseService.getAllProducts();
    notifyListeners();
  }

  Future<void> deleteMyProduct(productId) async {
    await databaseService.deleteMyProduct(productId);
    notifyListeners();
    getAllProducts();
  }

  List<ProductModel> searchedList = [];
  searchFilter(String value) {
    searchedList = allProduct
        .where((product) =>
            product.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  uploadImage(image) async {
    try {
      if (image != null) {
        downloadURL = await databaseService.uploadImage(imageName, image);

        notifyListeners();
      } else {
        log('image is null');
      }
    } catch (e) {
      log("$e");
      throw e;
    }
  }

  clearControllers() {
    titleController.clear();
    subtitleController.clear();
    priceController.clear();
    descriptionController.clear();
    notifyListeners();
  }
}
