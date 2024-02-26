import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/service/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> allUserDatas = [];

  Future<void> getUserData() async {
    try {
      allUserDatas = await UserService().getAllUserData();
    } catch (e) {
      print("Error fetching user data: $e");
    }
    notifyListeners();
  }
}
