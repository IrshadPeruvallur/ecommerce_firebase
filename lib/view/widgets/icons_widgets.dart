import 'package:flutter/material.dart';

class IconsWidgets {
  Widget IconButtonWidget(BuildContext context, Size size,
      {required IconData iconData, VoidCallback? onPressed, Color? color}) {
    return IconButton(
      color: color,
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconData,
          size: size.width * 0.06,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
