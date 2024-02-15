import 'dart:developer';

import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/service/database_service.dart';

class DatabaseProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final DatabaseService databaseService = DatabaseService();
  final WidgetProviders widgetProviders = WidgetProviders();
  List<ProductModel> allProduct = [];
  String downloadURL = '';
  String imageName = DateTime.now().millisecondsSinceEpoch.toString();

  addProduct(ProductModel data) async {
    await databaseService.addProduct(data);
  }

  Future<void> getProducts() async {
    allProduct = await databaseService.getAllProducts();
    notifyListeners();
  }

  uploadImage(image) async {
    try {
      if (image != null) {
        downloadURL = await databaseService.uploadImage(imageName, image);
        clearControllers();
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
    notifyListeners();
  }
}
