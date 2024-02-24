import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  String collection = 'User';
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

  Stream<List<UserModel>> getAllUserData() {
    return FirebaseAuth.instance.authStateChanges().asyncMap((user) async {
      if (user != null) {
        String id = user.uid;
        QuerySnapshot<UserModel> snapshot =
            await collectionReference.where('id', isEqualTo: id).get();
        return snapshot.docs.map((doc) => doc.data()).toList();
      } else {
        return [];
      }
    });
  }
}
