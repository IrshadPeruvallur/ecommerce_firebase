import 'package:flutter/material.dart';

class StyleWidgets {
  lineDivider(String text) {
    return Row(
      children: [
        const Flexible(child: Divider()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text),
        ),
        const Flexible(child: Divider())
      ],
    );
  }
}
