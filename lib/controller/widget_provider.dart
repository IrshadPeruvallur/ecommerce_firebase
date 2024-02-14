import 'package:flutter/foundation.dart';

class WidgetProviders extends ChangeNotifier {
  //BottomBar
  int currentIndex = 0;
  void indexChanging(value) {
    currentIndex = value;
    notifyListeners();
  }

  //DropDownButton
  List<String> items = [
    'Mobile',
    'Laptop',
    'T-shirt',
    'Shirt',
    'Headphones',
    'Camera',
    'Shoes',
    'Watch',
    'Backpack',
    'Gaming Console'
  ];

  String? selectedItem = '';
}
