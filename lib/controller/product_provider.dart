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
  List<ProductModel> myProduct = [];
  String downloadURL = '';
  String imageName = DateTime.now().millisecondsSinceEpoch.toString();

  addProduct(ProductModel data) async {
    await databaseService.addProduct(data);
    clearControllers();
    getAllProducts();
    getMyProducts();
    log('provider');
  }

  Future<void> getAllProducts() async {
    allProduct = await databaseService.getAllProducts();
    notifyListeners();
  }

  Future<void> getMyProducts() async {
    final currentUser = databaseService.firebaseAuth.currentUser;

    if (currentUser == null) {
      return; // Return early if user is not logged in
    }

    final userEmail = currentUser.email ?? currentUser.phoneNumber;
    log("$userEmail");

    try {
      myProduct = await databaseService.getMyProduct(userEmail.toString());
      notifyListeners();
    } catch (e) {
      log('Error fetching products: $e');
    }
  }

  uploadImage(image) async {
    try {
      if (image != null) {
        downloadURL = await databaseService.uploadImage(imageName, image);
        image = null;
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
