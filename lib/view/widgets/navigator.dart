import 'package:flutter/material.dart';

class NavigatorWidget {
  push(context, Widget location) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return location;
      },
    ));
  }
}
