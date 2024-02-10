import 'package:ecommerce_app/service/connectivity_service.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider extends ChangeNotifier {
  bool? isConnected;
  final ConnectivityServices connectivityServices = ConnectivityServices();

  void checkConnection() async {
    isConnected = await connectivityServices.checkInternet();
    notifyListeners();
  }
}
