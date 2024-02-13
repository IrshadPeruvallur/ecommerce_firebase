import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_model.dart';

class DatabaseService {
  String collection = 'products';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<ProductModel> collectionReference;
  DatabaseService() {}
}
