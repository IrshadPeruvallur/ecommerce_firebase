import 'package:flutter/material.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/service/database_service.dart';

class DatabaseProvider extends ChangeNotifier {
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final DatabaseService databaseService = DatabaseService();
  List<ProductModel> allProduct = [];

  addProduct(ProductModel data) async {
    await databaseService.addProduct(data);
  }

  Future<void> getProducts() async {
    allProduct = await databaseService.getAllProducts();
    notifyListeners();
  }
}
