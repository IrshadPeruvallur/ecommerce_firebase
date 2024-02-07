import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidgets {
  Widget textFormField(
    Size size, {
    controller,
    label,
    TextInputFormatter? inputFormatter,
    TextInputType? keyboardType,
  }) {
    return Column(
      children: [
        TextFormField(
          inputFormatters: inputFormatter != null ? [inputFormatter] : [],
          keyboardType: keyboardType ?? TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return " Please enter $label";
            } else {
              return null;
            }
          },
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          height: size.width * .05,
        )
      ],
    );
  }
}
