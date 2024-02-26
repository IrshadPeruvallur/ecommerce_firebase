import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';

class UserService {
  String collection = 'UserPost';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference<UserModel> collectionReference;

  UserService() {
    collectionReference =
        firestore.collection(collection).withConverter<UserModel>(
              fromFirestore: (snapshot, options) =>
                  UserModel.fromJson(snapshot.id, snapshot.data()!),
              toFirestore: (value, options) => value.toJson(),
            );
  }

  Future<List<UserModel>> getAllUserData() async {
    final snapshot = await collectionReference.get();
    return snapshot.docs.map((e) => e.data()).toList();
  }
}
