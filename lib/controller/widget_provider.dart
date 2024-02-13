import 'package:flutter/foundation.dart';

class WidgetProviders extends ChangeNotifier {
  int currentIndex = 0;
  void indexChanging(value) {
    currentIndex = value;
    notifyListeners();
  }
}
