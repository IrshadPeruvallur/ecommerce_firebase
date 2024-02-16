import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {
  String collection = 'products';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<ProductModel> collectionReference;
  Reference storage = FirebaseStorage.instance.ref();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
    log('service with out try');
    try {
      await collectionReference.add(data);
      log('service');
    } catch (e) {
      print('Error adding post :$e');
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    final snapshot =
        await collectionReference.orderBy('timeStamp', descending: true).get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<ProductModel>> getMyProduct(String userId) async {
    try {
      final snapshot = await firestore
          .collection(collection)
          .where('id', isEqualTo: userId)
          .orderBy('timeStamp', descending: true)
          .get();

      return snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.id, doc.data()))
          .toList();
    } catch (e) {
      log('Error fetching products: $e');
      return [];
    }
  }

  Future<String> uploadImage(imageName, imageFile) async {
    Reference imageFolder = storage.child('productImage');
    Reference? uploadImage = imageFolder.child('$imageName.jpg');

    await uploadImage.putFile(imageFile);
    String downloadURL = await uploadImage.getDownloadURL();
    log(downloadURL);
    return downloadURL;
  }
}
