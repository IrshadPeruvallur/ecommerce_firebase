import 'package:ecommerce_app/view/widgets/icons_widgets.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class AppBarWidgets {
  appBarWithAction(context,
      {required title, IconData? iconbutton, VoidCallback? onPressed}) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      foregroundColor: Colors.white,
      centerTitle: true,
      title: TextWidgets()
          .mainHeadingText(context, text: title, color: Colors.white),
      actions: [
        IconsWidgets().IconButtonWidget(context, size,
            color: Colors.white, iconData: iconbutton!, onPressed: onPressed)
      ],
    );
  }

  appBar(
    context, {
    required title,
  }) {
    return AppBar(
      centerTitle: true,
      title: TextWidgets()
          .mainHeadingText(context, text: title, color: Colors.white),
    );
  }
}
