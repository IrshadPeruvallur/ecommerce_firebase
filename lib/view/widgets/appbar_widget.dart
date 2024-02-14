import 'package:ecommerce_app/view/widgets/icons_widgets.dart';
import 'package:ecommerce_app/view/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class AppBarWidgets {
  appBarWithAction(context, size,
      {title, IconData? iconbutton, VoidCallback? onPressed}) {
    return AppBar(
      title: TextWidgets()
          .mainHeadingText(context, text: 'Sell Product', color: Colors.white),
      actions: [
        IconsWidgets().IconButtonWidget(context, size,
            color: Colors.white, iconData: iconbutton!, onPressed: onPressed)
      ],
    );
  }
}
