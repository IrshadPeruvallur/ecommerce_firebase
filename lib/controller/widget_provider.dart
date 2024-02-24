import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class WidgetProviders extends ChangeNotifier {
  //BottomBar
  int currentIndex = 0;
  void indexChanging(value) {
    currentIndex = value;
    notifyListeners();
  }

  Future bottomBarFunction() async {
    currentIndex = 0;
    notifyListeners();
  }

  // imagepicker
  ImagePicker _imagePicker = ImagePicker();
  File? file;

  pickImage(ImageSource source) async {
    final img = await _imagePicker.pickImage(source: source);
    file = img != null ? File(img.path) : null;
    notifyListeners();
  }

  //Switch
  final isSwitched = ValueNotifier<bool>(false);

  // Function to toggle the switch state
  void toggleSwitch(bool newState) {
    isSwitched.value = newState;
    notifyListeners();
  }

  // settings page
  bool isUsernameEdit = true;
  bool isPasswordEdit = true;

  void userNameClicked() {
    isUsernameEdit = !isUsernameEdit;
    notifyListeners();
  }

  void passwordClicked() {
    isPasswordEdit = !isPasswordEdit;
    notifyListeners();
  }
}
