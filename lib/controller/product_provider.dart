import 'dart:developer';

import 'package:ecommerce_app/controller/widget_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/service/database_service.dart';

class DatabaseProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final DatabaseService databaseService = DatabaseService();
  final WidgetProviders widgetProviders = WidgetProviders();
  List<ProductModel> allProduct = [];
  List<ProductModel> searchedList = [];
  String downloadURL = '';
  bool? isEdit;
  String imageName = DateTime.now().millisecondsSinceEpoch.toString();

  void loadDatasForEdit(ProductModel product) {
    titleController = TextEditingController(text: product.title);
    brandController = TextEditingController(text: product.brand);
    locationController = TextEditingController(text: product.location);
    descriptionController = TextEditingController(text: product.description);
    priceController = TextEditingController(
      text: product.price != null ? product.price.toString() : '',
    );
  }

// wishlist functions
  IsWishLIstClick(id, bool wishListStatus) async {
    await databaseService.IsWishListClick(id, wishListStatus);
    notifyListeners();
    getAllProducts();
  }

  bool wishListCheck(ProductModel product) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final user = currentUser.email ?? currentUser.phoneNumber;
      if (product.wishList!.contains(user)) {
        // notifyListeners();
        getAllProducts();
        return false;
      } else {
        getAllProducts();
        return true;
      }
    } else {
      return true;
    }
  }

  Future<void> getAllProducts() async {
    allProduct = await databaseService.getAllProducts();
    notifyListeners();
  }
// my product functions

  Future<void> deleteMyProduct(productId) async {
    await databaseService.deleteMyProduct(productId);
    notifyListeners();
    getAllProducts();
  }

  addProduct(ProductModel data) async {
    await databaseService.addProduct(data);
    clearControllers();
    getAllProducts();
  }

  updateMyProduct(productId, ProductModel data) async {
    await databaseService.updateMyProudct(productId, data);
    clearControllers();
    notifyListeners();
  }

  idSold(String id) async {
    await databaseService.IsSold(id);
    getAllProducts();
  }

  // serach function
  searchFilter(String value) {
    searchedList = allProduct
        .where((product) =>
            product.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

// image funtion
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
    brandController.clear();
    priceController.clear();
    locationController.clear();
    descriptionController.clear();
    notifyListeners();
  }
}
