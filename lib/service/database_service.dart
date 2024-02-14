import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_model.dart';

class DatabaseService {
  String collection = 'products';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<ProductModel> collectionReference;

  DatabaseService() {
    collectionReference =
        firestore.collection(collection).withConverter<ProductModel>(
      fromFirestore: (snapshot, options) {
        return ProductModel.fromJson(snapshot.id, snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  Future<void> addProduct(ProductModel data) async {
    try {
      await collectionReference.add(data);
    } catch (e) {
      print('Error adding post :$e');
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    final snapshot =
        await collectionReference.orderBy('timeStamp', descending: true).get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}
